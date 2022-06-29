//
//  AuthFacebook.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 29/6/22.
//

import Foundation

import FacebookLogin
import FBSDKLoginKit

final class AuthFacebook {
    let loginManager = LoginManager()
    
    
    func loginFacebook (completionBlock: @escaping(Result<String, Error>)->Void){
        loginManager.logIn(permissions: ["email"], from: nil){
            loginManagerLoginResult, error in
            if let error = error{
                print("Sucecidó un error al intentar hacer login con Facebook")
                print(error.localizedDescription)
                completionBlock(.failure(error))
                return
            }
            let token = loginManagerLoginResult?.token?.tokenString
            completionBlock(.success(token ?? "No token"))
        }
    }
    
    //func getAccesToken
}


