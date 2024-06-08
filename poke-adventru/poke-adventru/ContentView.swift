import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SliderView()
        }
    }
}

struct SliderView: View {
    @State private var buttonColorIndex = 0
    let colors: [Color] = [
        Color(red: 0.788, green: 0.569, blue: 0.341),
        Color(red: 0.329, green: 0.784, blue: 0.541),
        Color(red: 1, green: 0.6, blue: 0.682)
    ]
    let glowColors: [Color] = [
        Color(red: 0.796, green: 0.588, blue: 0.361),
        Color(red: 0.271, green: 0.992, blue: 0.6),
        Color(red: 1.0, green: 0.588, blue: 0.675)
    ]
    @State private var currentGlowColorIndex = 0
    let glowChangeTimer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    public let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    let images = ["eevee", "leafeon", "sylveon"]
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Image("ball").scaledToFit()
                .padding(.trailing, 170)
                .padding(.bottom, 180)
            
            TabView(selection: $selection) {
                ForEach(0..<3) { i in
                    ZStack {
                        Color.black
                            .ignoresSafeArea()
                        
                        Text("Pokélect")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.bottom, 670)
                            .font(.system(size: 36))
                        
                        Image("ball").scaledToFit()
                            .padding(.trailing, 170)
                            .padding(.bottom, 180)
                        
                        Image("\(images[i])").scaledToFit()
                            .padding(.leading, 25)
                            .padding(.bottom, 180)
                        
                        NavigationLink(destination: Login()) {
                            Text("Iniciar sesión")
                                .fontWeight(.bold)
                                .padding(.horizontal, 20)
                                .padding(20)
                                .foregroundColor(.white)
                                .background(colors[i])
                                .cornerRadius(26)
                        }
                        .padding(.top, 500)
                        
                        Button(action: {
                            // Action to perform when the button is tapped
                            print("Button tapped")
                        }) {
                            NavigationLink(destination: Register()) {
                                Text("Registrarse")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 28)
                                    .padding(20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(26)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 26)
                                            .stroke(Color.black, lineWidth: 1)
                                            .shadow(color: glowColors[currentGlowColorIndex], radius: 10, x: 0, y: 0)
                                            .blur(radius: 10)
                                    )
                                    .shadow(color: glowColors[currentGlowColorIndex], radius: 10, x: 0, y: 0)
                            }
                        }
                        .padding(.top, 680)
                    }
                }
            }
            .onReceive(timer, perform: { _ in
                withAnimation {
                    selection = selection < 2 ? selection + 1 : 0
                }
            })
            .onReceive(glowChangeTimer, perform: { _ in
                withAnimation(.easeInOut(duration: 3)) {
                    currentGlowColorIndex = (currentGlowColorIndex + 1) % glowColors.count
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
