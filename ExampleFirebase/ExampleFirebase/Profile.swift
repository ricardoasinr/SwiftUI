//
//  Profile.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 29/6/22.
//

import SwiftUI

struct Profile: View {
    @ObservedObject var authViewModel: AuthViewModel
  
    var body: some View {
        VStack{
            Form{
                Section{
                    Button(action: {
                        print("Hola")
                    },label:{
                        Label("Vincula tu email", systemImage: "envelope.fill")
                    })
                    
                    Button(action: {
                        print("Hola")
                    },label:{
                        HStack{
                            Image("FacebookLogo").resizable().frame(width: 33, height: 33)
                            Label("Vincular con Facebook", systemImage: "").padding(.leading, -40.0)
                                
                        }
                        
                        
                    })
                }header: {
                    Text("Vincula tus cuentas")
                        .font(.subheadline)
                       
                }
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(authViewModel: AuthViewModel())
    }
}
