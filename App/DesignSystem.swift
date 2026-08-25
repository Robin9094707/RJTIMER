import SwiftUI

struct UltraBackground: View {
    var body: some View {
        ZStack {
            Color(uiColor: .systemBackground)

            RadialGradient(
                colors: [
                    Color.cyan.opacity(0.16),
                    Color.clear
                ],
                center: .topLeading,
                startRadius: 10,
                endRadius: 520
            )

            RadialGradient(
                colors: [
                    Color.purple.opacity(0.12),
                    Color.clear
                ],
                center: .bottomTrailing,
                startRadius: 10,
                endRadius: 520
            )
        }
        .ignoresSafeArea()
    }
}

struct UltraGlassCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .glassEffect(.regular, in: .rect(cornerRadius: 28))
    }
}

struct AccentDot: View {
    let accent: TimerAccentToken
    let selected: Bool

    var body: some View {
        Circle()
            .fill(accent.color)
            .frame(width: selected ? 30 : 24, height: selected ? 30 : 24)
            .overlay {
                if selected {
                    Image(systemName: "checkmark")
                        .font(.caption.bold())
                        .foregroundStyle(.white)
                }
            }
            .accessibilityLabel(accent.title)
    }
}

struct EmptyCard: View {
    let title: String
    let message: String
    let systemImage: String

    var body: some View {
        UltraGlassCard {
            ContentUnavailableView(
                title,
                systemImage: systemImage,
                description: Text(message)
            )
            .frame(maxWidth: .infinity)
        }
    }
}

extension View {
    func ultraProminentButton() -> some View {
        self.buttonStyle(.glassProminent)
    }

    func ultraGlassButton() -> some View {
        self.buttonStyle(.glass)
    }
}
