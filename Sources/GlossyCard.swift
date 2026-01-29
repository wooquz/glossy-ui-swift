import SwiftUI

public struct GlossyCard<Content: View>: View {
    private let content: Content
    private let cornerRadius: CGFloat
    private let blurIntensity: CGFloat
    private let glowOpacity: Double
    
    public init(
        cornerRadius: CGFloat = 20,
        blurIntensity: CGFloat = 16,
        glowOpacity: Double = 0.4,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.cornerRadius = cornerRadius
        self.blurIntensity = blurIntensity
        self.glowOpacity = glowOpacity
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0.15),
                            Color.white.opacity(0.05)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .background(
                    Color.black.opacity(0.5)
                        .blur(radius: blurIntensity)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.8),
                                    Color.white.opacity(0.15)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
                .shadow(color: Color.black.opacity(0.3), radius: 16, x: 0, y: 10)
            
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(glowOpacity),
                            Color.white.opacity(0)
                        ],
                        startPoint: .top,
                        endPoint: .center
                    )
                )
                .padding(.horizontal, 4)
                .blur(radius: 5)
                .blendMode(.screen)
                .mask(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                )
            
            content
                .padding()
        }
        .compositingGroup()
    }
}
