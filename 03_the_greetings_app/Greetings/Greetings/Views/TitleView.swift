import SwiftUI

struct VerticalTitleView: View {
    @State var isRotated: Bool = false
    @State var captionIndex: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            GreetingsTextView(captionIndex: $captionIndex)
            RotatableCircleView(isRotated: $isRotated)
            Spacer()
        }
    }
}

struct TitleView: View {
    @State var isRotated: Bool = false
    @State var captionIndex: Int = 0
    
    var body: some View {
        HStack {
            GreetingsTextView(captionIndex: $captionIndex)
            
            Spacer()
            
            RotatableCircleView(isRotated: $isRotated)
        }
    }
}

struct GreetingsTextView: View {
    @Binding var captionIndex: Int
    
    let caption: [LocalizedStringKey] = [
        LocalizedStringKey("Exploring iOS 15 programming"),
        LocalizedStringKey("Learning how to bake"),
        LocalizedStringKey("Programming recipes"),
        LocalizedStringKey("A quest for knowledge")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text(LocalizedStringKey("Greetings"))
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(caption[captionIndex])
                .font(.headline)
                .fontWeight(.thin)
        }.padding()
            .onTapGesture {
                captionIndex = Int.random(in: 0..<caption.count)
            }
    }
}

struct RotatableCircleView: View {
    @Binding var isRotated: Bool
    
    var body: some View {
        Circle()
            .strokeBorder(AngularGradient(gradient: Gradient(
                colors: [
                    .pink, .purple,
                    .blue, .orange, .yellow
                ]),
                                          center: .center,
                                          angle: .zero),
                          lineWidth: 15)
            .rotationEffect(isRotated ? .zero : .degrees(180))
            .frame(maxWidth: 70, maxHeight: 70)
            .padding()
            .onTapGesture {
                withAnimation(Animation.spring()) {
                    isRotated.toggle()
                }
            }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
