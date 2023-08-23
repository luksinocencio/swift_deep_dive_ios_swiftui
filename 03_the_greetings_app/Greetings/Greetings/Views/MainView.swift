import SwiftUI

struct MainView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            GreetingstView()
        } else {
            LandscapeGreetingsView()
        }
    }
}

#Preview {
    MainView()
}
