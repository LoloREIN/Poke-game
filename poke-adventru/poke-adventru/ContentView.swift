import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var shouldNavigate = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Iniciar sesión")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .opacity(0.4)
                        .font(.system(size: 40))
                        .padding(.bottom, 70)
                        .padding(.top, 50)

                    TextField("ejemplo123@ola", text: $username)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)

                    SecureField("**********", text: $password)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)

                    Spacer()

                    Button("Iniciar sesión") {
                        authenticateUser()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(30)
                    .padding(.horizontal, 20)

                    // NavigationLink oculto para manejar la navegación de forma programática
                    NavigationLink(destination: UserView(), isActive: $shouldNavigate) {
                        EmptyView()
                    }
                }
            }
            .padding()
        }
    }

    func authenticateUser() {
        // Aquí podrías añadir tu lógica de verificación
        if username == "1" && password == "1" {
            shouldNavigate = true
        } else {
            print("Credenciales incorrectas")
        }
    }
}


// Vista de previsualización
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
