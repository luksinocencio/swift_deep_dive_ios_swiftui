import SwiftUI

struct LanguageOptionsTapView: View {
    @Binding var language: String
    @Binding var layoutDirectionString: String
    
    @State private var isAnimating = false
    @State private var rotationDegrees: Double = 0
    
    var body: some View {
        Menu {
            Button("English") {
                language = "en"
                layoutDirectionString = LEFT_TO_RIGHT
            }
            Button("Português") {
                language = "pt-BR"
                layoutDirectionString = RIGHT_TO_LEFT
            }
        } label: {
            Image(systemName: "gearshape.fill")
        }
    }
}

#Preview {
    LanguageOptionsTapView(
        language: .constant("en"),
        layoutDirectionString: .constant(LEFT_TO_RIGHT)
    )
}
