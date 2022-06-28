//
//  LoginEmailView.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import SwiftUI

struct LoginEmailView: View {
    
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
                TextField("Ingresa tu correo electronico", text: $TextFieldEmail)
                TextField("Contraseña", text: $TextFieldPassword)
                Button("Ingresar"){
                    print("Login")
                }.padding(.top,20).buttonStyle(.bordered)
            }.textFieldStyle(.roundedBorder).padding(.horizontal, 30)
            Spacer()
            DismissView()
           
            
        }
        
        
        
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView()
    }
}
