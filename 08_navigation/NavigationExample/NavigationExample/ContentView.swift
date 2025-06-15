import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()
                
                VStack {
                    Form {
                        Section {
                            Text("Enter your name")
                            TextField("What's your name?", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .listRowBackground(Color.white)
                        
                        Section {
                            Text("Enter your age")
                            TextField("30", text: $age)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                        }
                        .listRowBackground(Color.white)
                    }
                    .scrollContentBackground(.hidden)
                    
                    Spacer()
                    
                    NavigationLink {
                        DrinkingView(name: name, age: age, drinkingAge: 18)
                    } label: {
                        Text("Okay")
                            .font(.title)
                            .padding()
                            .overlay(Capsule().stroke())
                    }
                }
            }
            .navigationTitle("Example")
        }
    }
}

struct DrinkingView: View {
    let name: String
    let age: String
    
    let drinkingAge: Int
    
    var numericalAge: Int {
        Int(age) ?? -1
    }
    
    var body : some View {
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            
            if numericalAge > 18 {
                Text("\(name.capitalized), you can drink.")
            }
            else if numericalAge < 0 {
                Text("\(age) is not a valid.")
            } else {
                VStack {
                    Text("Sorry \(name.capitalized)")
                    Text("Can't serve you.")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
