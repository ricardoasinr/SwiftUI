//
//  RegisterEmailView.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import SwiftUI


struct RegisterEmailView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State var TextFieldEmail: String = ""
    @State var TextFieldPassword: String = ""
    var body: some View {
        VStack{
            Text("👋🏻Registrate para hacer tus calculos")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center).padding(.top, 30)
            Spacer()
            Group{
                TextField("Ingresa tu correo electronico", text: $TextFieldEmail).keyboardType(.emailAddress).autocapitalization(.none)
                SecureField("Contraseña", text: $TextFieldPassword).autocapitalization(.none)
                Button("Registrar"){
                    authViewModel.createNewUser(email: TextFieldEmail, password: TextFieldPassword)
                }.padding(.top,20).buttonStyle(.bordered)
                if let messageError = authViewModel.messageError {
                    Text(messageError).bold().foregroundColor(.red).padding(.top, 20)
                    
                }
                
            }.textFieldStyle(.roundedBorder).padding(.horizontal, 30)
            Spacer()
            DismissView()
           
            
        }
    }
}

struct RegisterEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmailView(authViewModel: AuthViewModel())
    }
}
