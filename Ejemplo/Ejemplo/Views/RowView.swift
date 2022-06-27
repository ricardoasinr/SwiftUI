//
//  RowView.swift
//  Ejemplo
//
//  Created by Ricardo Asin on 26/6/22.
//

import SwiftUI

struct RowView: View {
    var programador: Programmer
    
    var body: some View {
        HStack(){
            programador.avatar.resizable().frame(width: 40, height: 40).padding(10)
            VStack(alignment: .leading){
                //Text(programador.id)
                Text(programador.name)
                    .fontWeight(.semibold)
                Text(programador.lenguaje)
                
            }
            Spacer()
            if programador.favorite {
                Image(systemName: "star.fill").foregroundColor(.yellow).frame(width: 5, height: 5)
            }
            
            
            
        }
       
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(programador: Programmer(id: 1, name: "Ricardo Asin", lenguaje: "Swift", avatar: Image(systemName: "person.fill"), favorite: true)
        )
    }
}
