//
//  SignUpviEW.swift
//  vistasPoke
//
//  Created by Samuel Martínez on 09/05/24.
//

import SwiftUI

struct SignUpviEW: View {
        @State private var username: String = ""
        @State private var password: String = ""
        var body: some View {
            ZStack{
                VStack{
                    Spacer()
                    Text("Username").fontWeight( .bold).foregroundColor(.gray).opacity(0.4).font(.system(size: 40))
                    Text("Usuario disponible").fontWeight( .light).foregroundColor(.gray).opacity(0.4).font(.system(size: 20)).padding(.top)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.headline)
                                .foregroundColor(.green).padding(.top)
            
                    HStack{
                        Text("Correo electrónico").fontWeight(.medium).foregroundColor(.gray).opacity(0.4).frame(alignment: .leading)
                    }.padding(.leading, -170)
                    TextField("ejemplo123@ola", text: $username)
                                    .padding()
                                    .background(Color(UIColor.systemGray6))
                                    .cornerRadius(20).padding(.horizontal, 20).padding(.bottom,20)
                    HStack{
                        Text("Contraseña").fontWeight(.medium).foregroundColor(.gray).opacity(0.4)
                       
                    }
                    .padding(.leading, -170)
                    SecureField("**********", text: $password)
                                            .padding()
                                            .background(Color(UIColor.systemGray6))
                                            .cornerRadius(20)
                                            .padding(.horizontal, 20)
                                            .padding(.bottom, 20)
                    HStack{
                        Text("La contraseña debe tener 8 caracteres como mínimo,\n una mayúscula y un símbolo.")
                            .fontWeight(.light) .foregroundColor(.gray).opacity(0.6).font(.subheadline)
                    }.padding(.leading)
                    Spacer()
                    
                    Button("Registrarse") {
                           
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
                
                
            }
        }




#Preview {
    SignUpviEW()
}
