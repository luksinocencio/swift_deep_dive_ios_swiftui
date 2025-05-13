import SwiftUI

struct LanguageOptionsView: View {
    @Binding var language: String
    @Binding var layoutDirectionString: String

    @State private var isAnimating = false
    @State private var rotationDegrees: Double = 0

    var body: some View {
        Image(systemName: "gearshape.fill")
            .rotationEffect(.degrees(rotationDegrees))
            .animation(.easeInOut(duration: 0.5), value: rotationDegrees)
            .onLongPressGesture {
                rotationDegrees += 360
            }
            .contextMenu {
                Button("English") {
                    language = "en"
                    layoutDirectionString = LEFT_TO_RIGHT
                }
                Button("Português") {
                    language = "pt-BR"
                    layoutDirectionString = RIGHT_TO_LEFT
                }
            }
    }
}

#Preview {
    LanguageOptionsView(
        language: .constant("en"),
        layoutDirectionString: .constant(LEFT_TO_RIGHT)
    )
}
