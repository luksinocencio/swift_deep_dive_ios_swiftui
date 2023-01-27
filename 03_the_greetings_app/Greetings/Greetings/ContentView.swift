import SwiftUI

struct DataItemModel: Identifiable {
    let id = UUID()
    let text: LocalizedStringKey
    let color: Color
}

struct ContentView: View {
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

struct TitleView: View {
    
    @State var isRotated: Bool = false
    @State var captionIndex: Int = 0
    
    
    let caption: [LocalizedStringKey] = [
        LocalizedStringKey("Exploring iOS 15 programming"),
        LocalizedStringKey("Learning how to bake"),
        LocalizedStringKey("Programming recipes"),
        LocalizedStringKey("A quest for knowledge")
    ]
    
    var body: some View {
        HStack {
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
            
            Spacer()
            
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
                .onTapGesture {
                    withAnimation(Animation.spring()) {
                        isRotated.toggle()
                    }
                }
        }
    }
}

struct MeesagesView: View {
    let messages: [DataItemModel] = [
        DataItemModel(text: LocalizedStringKey("Hello there!"), color: Color("green")),
        DataItemModel(text: LocalizedStringKey("Welcome to Swift programming"), color: Color("gray")),
        DataItemModel(text: LocalizedStringKey("Are you ready to,"), color: Color("yellow")),
        DataItemModel(text: LocalizedStringKey("start exploring?"), color: Color("red")),
        DataItemModel(text: LocalizedStringKey("Boom"), color: Color("purple"))
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(messages) { message in
                TextView(text: message.text, color: message.color)
            }
        }
        .padding()
    }
}

struct TextView: View {
    let text: LocalizedStringKey
    // To change state of a variable we need to add wrapper @State
    @State var color: Color
    
    let colors: [Color] = [
        .red, .green, .blue, .orange,
        .yellow, .purple,
        Color(red: 0.5, green: 0, blue: 0.5),
        Color(red: 0.0, green: 0.5, blue: 0.5),
        Color(red: 139/255, green: 207/255, blue: 240/255),
        Color(red: 255/255, green: 215/255, blue: 0/255)
    ]
    
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .padding()
            .background(color.opacity(0.8))
            .cornerRadius(20)
            .shadow(color: color.opacity(0.8), radius: 5, x: 10, y: 10)
            .onTapGesture {
                let length = colors.count
                let randomIndex = Int.random(in: 0..<length)
                color = colors[randomIndex]
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //  change preview for dark mode
            .preferredColorScheme(.dark)
        ContentView()
        //  change preview for dark mode
            .preferredColorScheme(.light)
    }
}

