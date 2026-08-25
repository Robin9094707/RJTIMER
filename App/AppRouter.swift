import Foundation
import Observation

@MainActor
@Observable
final class AppRouter {
    enum Tab: Hashable {
        case timers
        case presets
        case history
        case settings
    }

    var selectedTab: Tab = .timers
    var requestedTimerID: UUID?

    func handle(_ url: URL) {
        guard url.scheme == "rjultratimer" else { return }
        selectedTab = .timers

        if url.host == "timer",
           let raw = url.pathComponents.dropFirst().first,
           let id = UUID(uuidString: raw) {
            requestedTimerID = id
        }
    }
}
