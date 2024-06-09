import SwiftUI

struct Login: View {
    @StateObject var viewModel = Registrar()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var shouldNavigateToPokeView = false

    
    var body: some View {
        //NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Iniciar sesión")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 36))
                        .padding(.top, 100)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Username o correo electrónico")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        
                        UsernameField(text: $username)
                            .padding(.top, 5)
                    }
                    .padding(.horizontal, 20)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Contraseña")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        
                        PasswordField(text: $password)
                            .padding(.top, 5)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 180)
                    
                    Image("login")
                        .scaledToFit()
                        .padding(.trailing, 30)
                        .frame(maxWidth: 200, maxHeight: 100)
                        .padding(.bottom, 100)
                    
                    NavigationLink(destination: Text("Next View")) {

                    }
                    Button(action: {
                        viewModel.iniciarSesion(userInfo: username, pass: password) { isAuthenticated in
                            if isAuthenticated {
                                shouldNavigateToPokeView = true
                            } else {
                                print("Error al iniciar sesión")
                            }
                        }
                    }) {
                        Text("Iniciar sesión")
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                            .padding(20)
                            .foregroundColor(.white)
                            .background(Color(red: 0.345, green: 0.565, blue: 0.898))
                            .cornerRadius(26)
                    }
                    .padding(.top)

                    NavigationLink(destination: PokedexView(), isActive: $shouldNavigateToPokeView) {
                        EmptyView()
                    }
                }
                .padding(.top, -110)
            }
        //}
    }
}

struct UsernameField: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
            .padding()
            .background(Color.black)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(red: 0.345, green: 0.565, blue: 0.898), lineWidth: 2)
                    .shadow(color: Color(red: 0.345, green: 0.565, blue: 0.898), radius: 10, x: 0, y: 0)
                    .blur(radius: 10)
            )
            .shadow(color: Color(red: 0.345, green: 0.565, blue: 0.898), radius: 10, x: 0, y: 0)
            .foregroundColor(.white)
            .padding(.horizontal)
    }
}

struct PasswordField: View {
    @Binding var text: String
    
    var body: some View {
        SecureField("", text: $text)
            .padding()
            .background(Color.black)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(red: 0.345, green: 0.565, blue: 0.898), lineWidth: 2)
                    .shadow(color: Color(red: 0.345, green: 0.565, blue: 0.898), radius: 10, x: 0, y: 0)
                    .blur(radius: 10)
            )
            .shadow(color: Color(red: 0.345, green: 0.565, blue: 0.898), radius: 10, x: 0, y: 0)
            .foregroundColor(.white)
            .padding(.horizontal)
    }
}

#Preview {
    Login()
}
