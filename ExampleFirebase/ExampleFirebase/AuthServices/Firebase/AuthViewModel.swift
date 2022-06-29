//
//  AuthViewModel.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import Foundation

final class AuthViewModel: ObservableObject{
    
    @Published var user: User?
    @Published var messageError: String?
    
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository = AuthRepository()){
        self.authRepository = authRepository
        getCurrentUser()    
    }
    
    func getCurrentUser(){
        self.user = authRepository.getCurrentUser()
    }
    
    func createNewUser (email: String, password: String){
        authRepository.createNewUser(email: email, password: password){
            
            [weak self]
            result in
            switch result
            {
            case .success(let user):
                self?.user = user
                //
            case .failure(let error):
                self?.messageError = error.localizedDescription
                //
                
            }
        }
    }
    
    func loginUser (email: String, password: String){
        authRepository.loginUser(email: email, password: password){
            [weak self]
            result in
            switch result
            {
            case .success(let user):
                self?.user = user
                //
            case .failure(let error):
                self?.messageError = error.localizedDescription
                //
                
            }
        }
    }
    
    func loginWithFacebook(){
        authRepository.loginWithFacebook(){
            [weak self]
            result in
            switch result
            {
            case .success(let user):
                self?.user = user
                //
            case .failure(let error):
                self?.messageError = error.localizedDescription
                //
                
            }
        }
    }
    
    
    
    func logout(){
        do {
            try authRepository.logout()
            self.user = nil
        }catch
        {
            print("Error al cerrar la sesión")
            
        }
    }
}
