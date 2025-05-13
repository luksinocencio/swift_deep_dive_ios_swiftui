import SwiftUI

struct GreetingsView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(alignment: .leading, spacing: 10) {
                TitleView()
                
                Spacer()
                
                MeesagesView()
                
                Spacer()
                Spacer()
            }
            .padding()
        }
    }
}

struct GreetingstView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingsView()
        //  change preview for dark mode
//            .preferredColorScheme(.dark)
        GreetingsView()
        //  change preview for light mode
            .preferredColorScheme(.light)
    }
}

