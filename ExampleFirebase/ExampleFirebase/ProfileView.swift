//
//  Profile.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 29/6/22.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State var expandVerificationWhithEmailForm: Bool = false
    @State var TextFieldEmail: String = ""
    @State var TextFieldPassword: String = ""
    
    var body: some View {
        VStack{
            Form{
                Section{
                    Button(action: {
                        expandVerificationWhithEmailForm.toggle()
                        print("Hola")
                    },label:{
                        Label("Vincula tu correo", systemImage: "envelope.fill")
                    }).disabled(authViewModel.isEmailAndPasswordLinked())
                    if expandVerificationWhithEmailForm {
                        Group{
                            
                            TextField("Ingresa tu correo electronico", text: $TextFieldEmail).keyboardType(.emailAddress).autocapitalization(.none)
                            SecureField("Contraseña", text: $TextFieldPassword).autocapitalization(.none)
                            Button("Aceptar"){
                                authViewModel.linkEmail(email: TextFieldEmail, password: TextFieldPassword)
                                   
                            }.padding(2).buttonStyle(.bordered)
                                .tint(.blue)
                            if let messageError = authViewModel.messageError{
                                Text(messageError).foregroundColor(.red).bold().font(.body).padding(.top, 20)
                            }
                        }
                    }
                    
                    Button(action: {
                        authViewModel.linkFacebook()
                    },label:{
                        HStack{
                            Image("FacebookLogo").resizable().frame(width: 33, height: 33)
                            Label("Vincular con Facebook", systemImage: "").padding(.leading, -40.0)
                                
                        }
                        
                        
                    }).disabled(authViewModel.isFacebookLinked())
                }header: {
                    Text("Vincula tus cuentas")
                        .font(.subheadline)
                       
                }
                
            }
            .task {
                authViewModel.getCurrentProvider()
            }
            .alert(authViewModel.isAccountLinked ? "Cuenta vinculada" : "Error", isPresented: $authViewModel.showAlert) {
                Button("Aceptar"){
                    print("Dissmiss alert")
                    if authViewModel.isAccountLinked {
                        expandVerificationWhithEmailForm = false
                    }
                        
                }
            } message: {
                Text(authViewModel.isAccountLinked ? "✅Vinculación correcta" : "Error al vincular la cuenta")
                
            }

            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(authViewModel: AuthViewModel())
    }
}
