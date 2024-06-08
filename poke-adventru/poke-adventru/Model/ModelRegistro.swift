//
//  Model.swift
//  Inicio
//
//  Created by Alexia Gizmo on 07/06/24.
//

import Foundation
import Firebase

class Registrar: ObservableObject{
    @Published var email=""
    @Published var user=""
    @Published var password=""
    @Published var country=""
    @Published var score=0
    
    
    func registrar_usuario(){
        //obtiene los datos de firestore
        
        let db = Firestore.firestore()
        let usuarios = db.collection("users")
        
        //verificamos si el usuario existe
        usuarios.whereField("username", isEqualTo:user).getDocuments{
            (QuerySnapshot, error) in
            if error != nil{
                return
            }
            
            //si se guardò un usuario, significa que existe entonces no se guardan los datos
            //si no existe, guardarà los datos
            if let documents = QuerySnapshot?.documents, !documents.isEmpty {
                print("Usuario ya registrado")
                return
            }else{
                
                //guardamos en firebase authentication
                Auth.auth().createUser(withEmail: self.email, password: self.password) { AuthDataResult, error in
                    if let error = error {
                        print("Error al registrar al usuario: \(error.localizedDescription)")
                        return
                    }
                    guard let user = AuthDataResult?.user else {
                        print("Error: No se pudo obtener el usuario de AuthDataResult")
                        return
                    }
                    
                    // guardamos la informaciòn para firestore
                    let info_usuario: [String:Any] = [
                        "email": self.email,
                        "username": self.user,
                        "country": self.country,
                        "score": self.score
                    ]
                    
                    db.collection("users").document(user.uid).setData(info_usuario) {error in
                        if error != nil {
                            print("Error al guardar la información")
                        }else{
                            print("Se guardó correctamente la información")
                        }
                    }
                    
                    
            }
        }
            
        }
    }
    
    
    func iniciarSesion(userInfo: String, pass: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        let usuarios = db.collection("users")

        usuarios.whereField("username", isEqualTo: userInfo).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error obteniendo documentos: \(error)")
                completion(false)
                return
            }

            if let document = querySnapshot?.documents.first,
               let userEmail = document.data()["email"] as? String {
                self.signInop(emailUser: userEmail, pass: pass, completion: completion)
            } else {
                self.signInop(emailUser: userInfo, pass: pass, completion: completion)
            }
        }
    }

    func signInop(emailUser: String, pass: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: emailUser, password: pass) { authResult, error in
            if let error = error {
                print("Error al iniciar sesión: \(error.localizedDescription)")
                completion(false)
            } else {
                print("Inicio de sesión exitoso")
                completion(true)
            }
        }
    }

    
}
