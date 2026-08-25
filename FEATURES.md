# RJ UltraTimer – Feature-Übersicht

## Haupt-Timer
- beliebig viele parallele Timer
- Stunde / Minute / Sekunde
- individueller Name
- SF-Symbol
- Akzent
- eigener Ton
- Pause / Fortsetzen
- +1 Minute
- Neustart
- Stop
- Repeat im Alarm

## Systemintegration
- AlarmKit
- Live Activities
- Dynamic Island
- Lock Screen
- StandBy
- Apple-Watch-Weitergabe durch das System
- Home-Screen-/Lock-Screen-Widget
- Control-Center-Control
- Action-Button-fähige Controls
- App Intents
- Shortcuts / Siri

## Oberfläche
- SwiftUI
- Liquid Glass
- GlassEffectContainer
- Glass Button Styles
- animierte Fortschrittsringe
- adaptive Navigation
- Dark Mode
- Haptics
- Accessibility

## Organisation
- Quick Presets
- eigene Presets
- Favoriten
- Kategorien über Symbol + Akzent
- Verlauf
- Charts
- Export

## Zuverlässigkeit
- AlarmKit ist die Systemquelle für laufende Countdowns
- App synchronisiert ihren Zustand mit AlarmKit/ActivityKit
- lokale Daten werden atomar als JSON gespeichert
- beim Start werden noch laufende AlarmKit-Timer wieder übernommen
- Debug-Log im Documents-Ordner
