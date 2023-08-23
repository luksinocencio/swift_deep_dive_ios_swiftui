import SwiftUI

struct LandscapeGreetingsView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            HStack {
                VerticalTitleView()
                
                Spacer()
                
                MeesagesView()
            }
        }
    }
}

struct LandscapeGreetingsView_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeGreetingsView()
    }
}
