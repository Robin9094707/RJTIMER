import AlarmKit
import SwiftUI

struct SettingsView: View {
    @Environment(TimerStore.self) private var store

    @AppStorage("hapticsEnabled") private var hapticsEnabled = true
    @AppStorage("keepScreenAwake") private var keepScreenAwake = false
    @AppStorage("defaultSound") private var defaultSound = "glass_chime.wav"

    @State private var alarmService = AlarmKitService.shared
    @State private var showDebug = false

    var body: some View {
        NavigationStack {
            Form {
                Section("AlarmKit") {
                    HStack {
                        Label("Systemalarm", systemImage: "bell.and.waves.left.and.right.fill")
                        Spacer()
                        Text(authText)
                            .foregroundStyle(authColor)
                    }

                    if alarmService.authorizationState != .authorized {
                        Button("AlarmKit erlauben") {
                            Task { _ = await alarmService.requestAuthorization() }
                        }
                    }

                    Text("AlarmKit ist die iOS-26-System-API für prominente Timer und Alarme.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Section("Timer") {
                    Toggle("Display wach halten", isOn: $keepScreenAwake)
                    Toggle("Haptisches Feedback", isOn: $hapticsEnabled)

                    Picker("Standardton", selection: $defaultSound) {
                        ForEach(TimerSoundCatalog.all) { sound in
                            Label(sound.title, systemImage: sound.symbol)
                                .tag(sound.fileName)
                        }
                    }

                    Button {
                        SoundPlayer.shared.preview(defaultSound)
                    } label: {
                        Label("Standardton testen", systemImage: "speaker.wave.2")
                    }
                }

                Section("Systemintegration") {
                    LabeledContent("Live Activities", value: "Aktiv")
                    LabeledContent("Dynamic Island", value: "Aktiv")
                    LabeledContent("Widget", value: "Enthalten")
                    LabeledContent("Control Center", value: "5 & 25 Min")
                    LabeledContent("Shortcuts", value: "Enthalten")
                }

                Section("Daten") {
                    if let url = store.exportURL() {
                        ShareLink(item: url) {
                            Label("Daten exportieren", systemImage: "square.and.arrow.up")
                        }
                    }

                    Button {
                        showDebug = true
                    } label: {
                        Label("Debug-Konsole", systemImage: "ladybug.fill")
                    }
                }

                Section("RJ UltraTimer") {
                    LabeledContent("Version", value: "1.0")
                    LabeledContent("Minimum", value: "iOS 26")
                    LabeledContent("Framework", value: "AlarmKit")
                }
            }
            .navigationTitle("Einstellungen")
            .onAppear {
                alarmService.refreshAuthorization()
            }
            .sheet(isPresented: $showDebug) {
                DebugConsoleView()
            }
        }
    }

    private var authText: String {
        switch alarmService.authorizationState {
        case .authorized: "Erlaubt"
        case .denied: "Abgelehnt"
        case .notDetermined: "Nicht gefragt"
        @unknown default: "Unbekannt"
        }
    }

    private var authColor: Color {
        alarmService.authorizationState == .authorized ? .green : .orange
    }
}
