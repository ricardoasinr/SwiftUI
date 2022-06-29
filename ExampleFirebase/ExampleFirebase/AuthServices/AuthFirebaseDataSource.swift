//
//  AuthFirebaseDataSource.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}

final class AuthFirebaseDataSource{
    
    func getCurrentUser () -> User?{
        guard let email = Auth.auth().currentUser?.email
        else{
            return nil
        }
        return .init(email: email)
        
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping(Result<User, Error>)->Void ){
        Auth.auth().createUser(withEmail: email, password: password){
            authDataResult, error in
            if let error = error {
                print("Error al crear al usuario: \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "No email"
            print("Nuevo usuario con información \(email)")
            completionBlock(.success(.init(email: email)))
        }
        
    }
    
    func LoginUser(email: String, password: String, completionBlock: @escaping(Result<User, Error>)->Void ){
        Auth.auth().signIn(withEmail: email, password: password){
            authDataResult, error in
            if let error = error {
                print("Error al iniciar sesión: \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "No email"
            print("Inicio de sesión del Usuario: \(email)")
            completionBlock(.success(.init(email: email)))
        }
        
    }
    
    func logout() throws{
        try Auth.auth().signOut()
    }
}
