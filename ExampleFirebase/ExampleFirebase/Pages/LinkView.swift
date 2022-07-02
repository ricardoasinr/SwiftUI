//
//  LinkView.swift
//  NotasFirebase
//
//  Created by Ricardo Asin on 30/6/22.
//

import SwiftUI

struct LinkView: View {
    
    @ObservedObject var linkViewModel: LinkViewModel
  //  @ObservedObject var authViewModel: AuthViewModel
    @State var text: String = " "
    
    
    var body: some View {
        VStack {
            TextEditor(text: $text).frame(height: 100)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(.green, lineWidth: 2)).padding(.horizontal, 12).cornerRadius(3)
            Button(action: {
                linkViewModel.createNewLink(FromURL: text)
            }, label: {
                Label("Crear link", systemImage: "link").tint(.green).controlSize(.regular).buttonStyle(.bordered).buttonBorderShape(.capsule)
            })
            if(linkViewModel.MessageError != nil){
                Text(linkViewModel.MessageError!).bold().foregroundColor(.red)
            }
            List{
                ForEach(linkViewModel.links){ link in
                    VStack{
                        Text(link.title).bold().lineLimit(4).padding(.bottom, 8)
                        Text(link.URL).foregroundColor(.gray).font(.caption)
                        HStack{
                            Spacer()
                            if link.isCompleted{
                                Image(systemName: "checkmark.circle.fill").resizable()
                                    .foregroundColor(.blue).frame(width: 10, height: 10)
                            }
                            if link.isFavorite{
                                Image(systemName: "star.fill").resizable()
                                    .foregroundColor(.yellow).frame(width: 10, height: 10)
                            }
                        }
                    }
                    
                }
            }.task{
                linkViewModel.getAllLinks()
                //linkViewModel.createNewNota( email: authViewModel.user?.email ?? "No user")
        }
        }
        
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(linkViewModel: LinkViewModel()) //,authViewModel: AuthViewModel())
    }
}
