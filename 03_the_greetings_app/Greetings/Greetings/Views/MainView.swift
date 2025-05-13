import SwiftUI

struct MainView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isPortraitPhone: Bool {
        horizontalSizeClass == .compact && verticalSizeClass == .regular
    }
    
    var isIpad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .regular
    }
    
    @Binding var language: String
    @Binding var layoutDirectionString: String
    
    var body: some View {
        if isPortraitPhone || isIpad {
            NavigationStack {
                GreetingsView()
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            LanguageOptionsTapView(
                                language: $language,
                                layoutDirectionString: $layoutDirectionString
                            )
                        }
                    }
            }
        } else {
            // Landscape mode ?
            NavigationStack {
                LandscapeGreetingsView()
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            LanguageOptionsTapView(
                                language: $language,
                                layoutDirectionString: $layoutDirectionString
                            )
                        }
                    }
            }
        }
    }
}

#Preview {
    MainView(
        language: .constant("en"),
        layoutDirectionString: .constant(LEFT_TO_RIGHT)
    )
}
