//
//  ContentView.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import SwiftUI

enum AuthSheetView: String, Identifiable{
    case register
    case login
    
    var id: String{
        return rawValue
    }
}


struct ContentView: View {
    
    @State private var authSheetView: AuthSheetView?
    
    
    var body: some View {
        
        VStack{
            Text("Hola!")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            HStack{
                Button {
                    authSheetView = .login
                } label: {
                    Label("Ingresar con Email", systemImage: "envelope.fill")
                }
            }
           
            Spacer()
            HStack{
                
                Text("No tienes cuenta?")
                Button {
                    authSheetView = .register
                } label: {
                    Label("Registrate", systemImage: "person.fill.badge.plus")
                }
                
            }
            
        }
        
        .sheet(item: $authSheetView){
            sheet in
            switch sheet {
            case .register:
                Text("Registro")
            case .login:
                Text("Login")
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
