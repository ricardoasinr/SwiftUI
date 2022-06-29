//
//  AuthRepository.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import Foundation

final class AuthRepository{
    private let authFirebaseDatasource: AuthFirebaseDataSource
    init(authFirebaseDatasource: AuthFirebaseDataSource = AuthFirebaseDataSource() ){
        self.authFirebaseDatasource = authFirebaseDatasource
        
    }
    
    func getCurrentUser() -> User? {
        authFirebaseDatasource.getCurrentUser()
    }
    
    func createNewUser (email: String, password: String, completionBlock: @escaping(Result<User, Error>)->Void ){
        authFirebaseDatasource.createNewUser(email: email, password: password, completionBlock: completionBlock)
    }
    
    func loginUser (email: String, password: String, completionBlock: @escaping(Result<User, Error>)->Void ){
        authFirebaseDatasource.LoginUser(email: email, password: password, completionBlock: completionBlock)
    }
    
    func loginWithFacebook (completionBlock: @escaping(Result<User, Error>)->Void ){
        authFirebaseDatasource.loginWithFacebook(completionBlock: completionBlock)
    }
    
    
    func logout() throws{
        try authFirebaseDatasource.logout()
    }
}
