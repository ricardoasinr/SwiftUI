//
//  LoginEmailView.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import SwiftUI

struct LoginEmailView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    
    @State var TextFieldEmail: String = ""
    @State var TextFieldPassword: String = ""
    
    var body: some View {
        
        VStack{
            Text("👋🏻Inicia sesión para revisar tus notas")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center).padding(.top, 30)
            Spacer()
            Group{
                
                TextField("Ingresa tu correo electronico", text: $TextFieldEmail).keyboardType(.emailAddress).autocapitalization(.none)
                TextField("Contraseña", text: $TextFieldPassword).autocapitalization(.none)
                Button("Ingresar"){
                    authViewModel.loginUser(email: TextFieldEmail,
                                            password: TextFieldPassword)
                       
                }.padding(.top,20).buttonStyle(.bordered)
                    .tint(.blue)
                if let messageError = authViewModel.messageError{
                    Text(messageError).foregroundColor(.red).bold().font(.body).padding(.top, 20)
                }
            }.textFieldStyle(.roundedBorder).padding(.horizontal, 30)
            Spacer()
            DismissView()
           
            
        }
        
        
        
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView(authViewModel: AuthViewModel())
    }
}
