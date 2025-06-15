import SwiftUI

struct ContentView: View {
    let colorList1 = Gradient(colors: [Color(hex: "#8E2DE2"), Color(hex: "#4A00E0")])
    let colorList2 = Gradient(colors: [Color(hex: "#396afc"), Color(hex: "#2948ff")])
    
    @State private var screenTapped: Bool = false
    let rotatingAngle: CGFloat = 360.0
    
    // computed property
    var colors: Gradient {
        return screenTapped ? colorList1 : colorList2
    }
    
    var text: String {
        return screenTapped ? "SwiftUI Basics" : "To know what you know what you know and what you do not know, that is truw knowledge"
    }
    
    var font: Font {
        return screenTapped ? .largeTitle : .title
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 100) {
                Text(text)
                    .font(font)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                   
                Text("Another line of text")
                    .font(font)
                    .fontWeight(.semibold)
                    .foregroundStyle(screenTapped ? .red : .blue)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .rotation3DEffect(.degrees(screenTapped ? .zero : rotatingAngle), axis: (x: 0, y: 1, z: 0))
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.5)) {
                screenTapped.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
