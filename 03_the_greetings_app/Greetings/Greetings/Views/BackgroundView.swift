import SwiftUI

/// this is the main view of greetings app
struct BackgroundView: View {
    // change background color, we need to set a ZStack
    var body: some View {
        LinearGradient(colors: [Color("blue"), Color(red: 139/255, green: 80/255, blue: 240/255)],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .opacity(0.3)
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
