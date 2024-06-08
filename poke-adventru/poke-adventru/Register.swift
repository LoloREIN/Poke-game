import SwiftUI

struct Register: View {
    var countries = ["🇲🇽", "🇫🇷", "🇯🇵", "🇹🇼"]
    @State private var selectedCountry = "Red"
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Image("icon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
                    .padding(.top, 40)
                
                Text("Ingresa un nombre de usuario")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                    .font(.system(size: 20))
                
                ZStack {
                    if username.isEmpty {
                        Text("Usuario")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .font(.system(size: 36))
                            .padding(.leading, 5)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    TextField("", text: $username)
                        .foregroundColor(.white)
                        .font(.system(size: 36))
                        .multilineTextAlignment(.center)
                        .padding(5)
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                
                Text("Nacionalidad")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top, 5)
                    .font(.system(size: 20))
                
                VStack {
                    Picker("", selection: $selectedCountry) {
                        ForEach(countries, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Text("Contraseña")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                    .font(.system(size: 20))
                
                ZStack {
                    if password.isEmpty {
                        Text("••••••••••")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .font(.system(size: 36))
                            .padding(.leading, 5)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    SecureField("", text: $password)
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                        .padding(5)
                    
                }
                .padding(.horizontal, 20)
                
                VStack(alignment: .center){
                    Text("La contraseña debe tener 8 caracteres como mínimo, una mayúscula y un símbolo.")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }
                .padding(.horizontal, 40)
                
                NavigationLink(destination: Text("Next View")) {
                    Text("Registrarse")
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .padding(20)
                        .foregroundColor(.white)
                        .background(Color(red: 0.984, green: 0.471, blue: 0.239))
                        .cornerRadius(26)
                }
                .padding(.top)
                
                Spacer()
            }
        }
    }
}

#Preview {
    Register()
}
