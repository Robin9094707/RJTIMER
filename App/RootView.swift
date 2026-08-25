import SwiftUI
import UIKit

struct RootView: View {
    @Environment(TimerStore.self) private var store
    @Environment(AppRouter.self) private var router
    @Environment(\.scenePhase) private var scenePhase

    @AppStorage("keepScreenAwake") private var keepScreenAwake = false

    var body: some View {
        @Bindable var router = router

        TabView(selection: $router.selectedTab) {
            Tab("Timer", systemImage: "timer", value: .timers) {
                TimerHomeView()
            }

            Tab("Presets", systemImage: "square.grid.2x2.fill", value: .presets) {
                PresetsView()
            }

            Tab("Verlauf", systemImage: "chart.bar.xaxis", value: .history) {
                HistoryView()
            }

            Tab("Einstellungen", systemImage: "gearshape.fill", value: .settings) {
                SettingsView()
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
        .onChange(of: scenePhase) { _, phase in
            if phase == .active {
                UIApplication.shared.isIdleTimerDisabled = keepScreenAwake && !store.activeTimers.isEmpty
                Task { await store.syncFromSystem() }
            } else {
                UIApplication.shared.isIdleTimerDisabled = false
            }
        }
        .onChange(of: keepScreenAwake) { _, enabled in
            UIApplication.shared.isIdleTimerDisabled = enabled && !store.activeTimers.isEmpty
        }
        .onChange(of: store.activeTimers.count) { _, count in
            UIApplication.shared.isIdleTimerDisabled = keepScreenAwake && count > 0
        }
        .alert(
            "RJ UltraTimer",
            isPresented: Binding(
                get: { store.lastError != nil },
                set: { if !$0 { store.lastError = nil } }
            )
        ) {
            Button("OK") { store.lastError = nil }
        } message: {
            Text(store.lastError ?? "")
        }
    }
}
