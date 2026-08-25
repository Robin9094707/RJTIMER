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
