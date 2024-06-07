import SwiftUI

struct UserView: View {
    let columns: [GridItem] = Array(repeating: .init(.fixed(150)), count: 2)
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var countryCode: String = "US" // Este valor puede venir de la base de datos

    // Supongamos que estos son identificadores de imágenes o URLs que cargarás
    @State private var imageNames = ["placeholder", "placeholder", "placeholder", "placeholder"]

    var body: some View {
        ZStack {
            VStack {
                Image("prueba")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.top, 60)
                
                Text("Username").fontWeight(.bold).foregroundColor(.gray).opacity(0.4).font(.system(size: 30)).padding(.bottom, 30)


                if let flagName = getFlagName(for: countryCode) {
                    Image(systemName: flagName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 60)
                        .padding()
                }

                LazyVGrid(columns: columns, spacing: 20) {
                                    ForEach(imageNames, id: \.self) { imageName in
                                        Image(imageName) // Utiliza un placeholder mientras tanto
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                            .border(Color.black, width: 1) // Definición del borde con color negro y ancho de 1
                                    }
                                }

               
            }
        }
    }

    func getFlagName(for countryCode: String) -> String? {
        let flagBase = "flag."
        let lowercasedCode = countryCode.lowercased()
        return flagBase + lowercasedCode
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
