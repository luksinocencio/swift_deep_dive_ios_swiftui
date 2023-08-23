import SwiftUI

struct GreetingstView: View {
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
        GreetingstView()
        //  change preview for dark mode
//            .preferredColorScheme(.dark)
        GreetingstView()
        //  change preview for light mode
            .preferredColorScheme(.light)
    }
}

