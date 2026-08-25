import SwiftUI

@main
struct RJUltraTimerApp: App {
    @State private var store = TimerStore()
    @State private var router = AppRouter()

    init() {
        UserDefaults.standard.register(defaults: [
            "hapticsEnabled": true,
            "keepScreenAwake": false,
            "defaultSound": "glass_chime.wav"
        ])
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(store)
                .environment(router)
                .tint(.cyan)
                .onOpenURL { url in
                    router.handle(url)
                }
                .task {
                    await store.bootstrap()
                }
        }
    }
}
