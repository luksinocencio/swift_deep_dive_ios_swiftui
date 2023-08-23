import SwiftUI

struct MeesagesView: View {
    let messages: [DataItemModel] = [
        DataItemModel(text: LocalizedStringKey("Hello there!"), color: Color("green")),
        DataItemModel(text: LocalizedStringKey("Welcome to Swift programming"), color: Color("gray")),
        DataItemModel(text: LocalizedStringKey("Are you ready to,"), color: Color("yellow")),
        DataItemModel(text: LocalizedStringKey("start exploring?"), color: Color("red")),
        DataItemModel(text: LocalizedStringKey("Boom"), color: Color("purple"))
    ]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(messages) { message in
                    TextView(text: message.text, color: message.color)
                }
            }.padding()
            Spacer()
        }
    }
}


struct MeesagesView_Previews: PreviewProvider {
    static var previews: some View {
        MeesagesView()
    }
}
