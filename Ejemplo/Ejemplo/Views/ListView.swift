//
//  ListView.swift
//  Ejemplo
//
//  Created by Ricardo Asin on 26/6/22.
//

import SwiftUI
import MapKit


private let programadores = [Programmer(id: 1,
                                        name: "Ricardo Asin",
                                        lenguaje: "Swift",
                                        avatar: Image(systemName:"person.fill"), favorite: true),
                             Programmer(id: 2,
                                        name: "Enrique Nuñez",
                                        lenguaje: "Dart",
                                        avatar: Image(systemName:"person.fill"), favorite: true),
                             Programmer(id: 3,
                                        name: "Pablo Asin",
                                        lenguaje: "C++",
                                        avatar: Image(systemName:"person.fill"), favorite: true),
                            Programmer(id: 4,
                                        name: "Milko Moreno",
                                        lenguaje: "Python",
                                       avatar: Image(systemName:"person.fill"), favorite: true),
                             Programmer(id: 5,
                                         name: "Roberto Carlos",
                                         lenguaje: "JavaScript",
                                         avatar: Image(systemName:"person.fill"), favorite: false)]
struct ListView: View {
    var body: some View {
        NavigationView{
            List(programadores, id: \.id){
                Programmer in NavigationLink(destination: ListDetailView(programador: Programmer)){
                    RowView(programador: Programmer)
                    
                }
                
            }.navigationTitle("Programadores")
        }
        Spacer()
     
        
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
