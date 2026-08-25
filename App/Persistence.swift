import Foundation

enum AppPersistence {
    static var root: URL {
        let base = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = base.appendingPathComponent("RJUltraTimer", isDirectory: true)
        try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        return url
    }

    static var timersURL: URL { root.appendingPathComponent("timers.json") }
    static var presetsURL: URL { root.appendingPathComponent("presets.json") }
    static var historyURL: URL { root.appendingPathComponent("history.json") }

    static func load<T: Decodable>(_ type: T.Type, from url: URL) -> T? {
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(type, from: data)
        } catch {
            return nil
        }
    }

    static func save<T: Encodable>(_ value: T, to url: URL) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(value)
        try data.write(to: url, options: [.atomic])
    }

    static func exportBundle(
        timers: [TimerRecord],
        presets: [TimerPreset],
        history: [TimerHistoryEntry]
    ) throws -> URL {
        struct Export: Codable {
            let exportedAt: Date
            let timers: [TimerRecord]
            let presets: [TimerPreset]
            let history: [TimerHistoryEntry]
        }

        let export = Export(
            exportedAt: .now,
            timers: timers,
            presets: presets,
            history: history
        )
        let url = root.appendingPathComponent("RJ-UltraTimer-Export.json")
        try save(export, to: url)
        return url
    }
}
