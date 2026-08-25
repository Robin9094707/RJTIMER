import SwiftUI
import WidgetKit

@main
struct RJUltraTimerWidgetBundle: WidgetBundle {
    var body: some Widget {
        RJAlarmLiveActivityWidget()
        QuickTimerWidget()
        FiveMinuteControl()
        PomodoroControl()
    }
}
