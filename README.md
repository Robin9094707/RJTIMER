# RJ UltraTimer – GitHub Build Source

Native iOS-26-Timer-App mit:

- AlarmKit
- Live Activities
- Dynamic Island
- Liquid Glass
- Widgets
- Control Center Controls
- App Intents / Shortcuts
- mehreren parallelen Timern
- Presets
- Verlauf + Charts
- eigenen Sounds
- Debug-Logging

## Cloud Build

Der Workflow liegt unter:

```text
.github/workflows/build-ios.yml
```

Er wird **nur manuell** über `workflow_dispatch` gestartet, damit keine unnötigen
GitHub-Actions-Minuten bei jedem Commit verbraucht werden.

Der Workflow erzeugt eine **unsigned IPA**. Signierung erfolgt anschließend extern.

Siehe `GITHUB-QUICKSTART.md`.


## v1.0.1 Build-Fix

- Deployment Target auf iOS 26.1 angehoben, weil die verwendete
  `AlarmPresentation.Alert`-API ab iOS 26.1 verfügbar ist.
- `ActivityKit` in `RJTimerAlarm.swift` importiert, damit
  `AlertConfiguration.AlertSound` korrekt aufgelöst wird.


## v1.0.2 Swift-6 Build-Fix

- `TimerCardView.stateBadge` aus dem `@ViewBuilder` herausgenommen.
  Normale Variablenzuweisungen wurden dort von SwiftUI als View-Ausdrücke interpretiert.
- Actor-Isolation-Fehler im `TimerStore.deinit` entfernt.
- Kleine Compiler-Warnung im Timer-Startcode bereinigt.
