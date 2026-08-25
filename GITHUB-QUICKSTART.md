# GitHub Quick Start – RJ UltraTimer

## Einmalig

1. Auf GitHub **New repository**.
2. Name z. B. `RJ-UltraTimer`.
3. **Private** auswählen.
4. Repository erstellen.

## Source hochladen

Den **Inhalt dieses Ordners** ins Repository hochladen.

Wichtig: `.github/workflows/build-ios.yml` muss mit hochgeladen werden.

Am einfachsten:

```text
Repository → Add file → Upload files
```

Danach **Commit changes**.

> Falls der Browser versteckte `.github`-Ordner beim Drag-and-Drop nicht sauber übernimmt,
> nutze GitHub Desktop oder Git im Terminal.

## IPA bauen

```text
Repository
→ Actions
→ Build RJ UltraTimer IPA
→ Run workflow
→ Run workflow
```

Der Build läuft auf GitHubs `macos-26` Runner mit Xcode 26.5.

## IPA herunterladen

Nach einem grünen Build:

```text
Actions
→ erfolgreicher Build
→ Artifacts
→ RJ-UltraTimer-unsigned-IPA
```

ZIP herunterladen und entpacken. Darin liegt:

```text
RJ-UltraTimer-unsigned.ipa
```

Danach mit deinem IPA-Signierer signieren.

## Wenn der Build rot wird

Unten im fehlgeschlagenen Workflow findest du das Artifact:

```text
RJ-UltraTimer-build-log
```

Diese Logdatei kannst du ChatGPT schicken.
