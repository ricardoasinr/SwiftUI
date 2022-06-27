//
//  ListDetailView.swift
//  Ejemplo
//
//  Created by Ricardo Asin on 27/6/22.
//

import SwiftUI

struct ListDetailView: View {
    
    var programador: Programmer
    
    var body: some View {
        VStack{
            programador.avatar.resizable().frame(width: 200, height: 200, alignment: .leading).clipShape(Circle()).overlay(Circle().stroke(Color.black, lineWidth: 5)).shadow(color: Color.gray, radius: 8).padding(10)
            HStack{
                Text("Nombre del programador: ")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 5)
                Text(programador.name)
                    
            }
            HStack{
                Text("Lenguajes: ").fontWeight(.bold).padding(.leading, 39)
                Text(programador.lenguaje)
                Spacer()
            }
            Spacer()
            
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(programador: Programmer(id: 1, name: "Ricardo Asin", lenguaje: "Swift", avatar: Image(systemName: "person.fill"), favorite: true))
    }
}
