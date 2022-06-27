//
//  ContentView.swift
//  Ejemplo
//
//  Created by Ricardo Asin on 17/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Hola Mundo").font(.title).padding()
        
            Spacer()
            VStack{
                Image("Milko").padding().clipShape(Circle()).overlay(Circle().stroke(Color.gray, lineWidth: 4)).shadow(color: Color.gray, radius: 4)
                HStack{
                    Image(systemName: "person.fill")
                    Text("Amigo").fontWeight(.bold)
                    Text("Milko Moreno")
                }
                
            }
            
            Spacer()
            HStack{
                Text("Creador por ").fontWeight(.bold)
                Text("Ricardo Asin")
             
            }.padding()
            
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
