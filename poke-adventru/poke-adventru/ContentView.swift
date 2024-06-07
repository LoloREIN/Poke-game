//
//  ContentView.swift
//  vistasPoke
//
//  Created by Samuel Martínez on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        ZStack{
            VStack {
                
                Text("Iniciar sesión").fontWeight( .semibold).foregroundColor(.gray).opacity(0.4).font(.system(size: 40)).padding(.bottom,70).padding(.top,50)
                HStack{
                    Text("Username o Correo electrónico").fontWeight(.medium).foregroundColor(.gray).opacity(0.4).frame(alignment: .leading)
                }.padding(.leading, -60)
                TextField("ejemplo123@ola", text: $username)
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(20).padding(.horizontal, 20).padding(.bottom,20)
                HStack{
                    Text("Contraseña").fontWeight(.medium).foregroundColor(.gray).opacity(0.4)
                   
                }
                .padding(.leading, -150)
                SecureField("**********", text: $password)
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(20).padding(.horizontal, 20).padding(.bottom,20)
                Spacer()
                
                Button("Iniciar sesión") {
                       
                            print("Botón presionado")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(30)
                        .padding(.horizontal, 20)
                    }
            }
            .padding()
        }}


#Preview {
    ContentView()
}
