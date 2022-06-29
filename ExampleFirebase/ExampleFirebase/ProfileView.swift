//
//  Profile.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 29/6/22.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var authViewModel: AuthViewModel
  
    var body: some View {
        VStack{
            Form{
                Section{
                    Button(action: {
                        print("Hola")
                    },label:{
                        Label("Vincula tu email", systemImage: "envelope.fill")
                    }).disabled(authViewModel.isEmailAndPasswordLinked())
                    
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
