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
    @State var showAlert: Bool = false
    
    var body: some View {
        
        VStack {
            TextEditor(text: $text).frame(height: 100)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(.green, lineWidth: 2)).padding(.horizontal, 12).cornerRadius(3)
            
            HStack{
                Button(action: {
                    linkViewModel.createNewLink(FromURL: text)
                   
                    
                }, label: {
                    Label("Crear link", systemImage: "link").tint(.green).controlSize(.regular).buttonStyle(.bordered).buttonBorderShape(.capsule)
                })
                Button(action: {
                    text = " "
                    
                }, label: {
                    Label("Limpiar", systemImage: "link").tint(.red).controlSize(.regular).buttonStyle(.bordered).buttonBorderShape(.capsule)
                })
                
            }
          
            if(linkViewModel.MessageError != nil){
                Text(linkViewModel.MessageError!).bold().foregroundColor(.red)
            }
            
            List{
                ForEach(linkViewModel.links){ link in
                    VStack{
                        Spacer()
                        Text(link.title).bold().lineLimit(4).padding(.bottom, 8)
                        Text(link.URL).foregroundColor(.gray).font(.caption)
                        Spacer()
                        HStack{
                            Spacer()
                            if link.isCompleted{
                                Image(systemName: "checkmark.circle.fill").resizable()
                                    .foregroundColor(.blue).frame(width: 10, height: 10).padding(.bottom, 10)
                            }
                            if link.isFavorite{
                                Image(systemName: "star.fill").resizable()
                                    .foregroundColor(.yellow).frame(width: 10, height: 10).padding(.bottom, 10)
                            }
                        }
                        }.swipeActions(edge: .trailing) {
                            
                            Button(action: {
                                linkViewModel.updateIsFavorite(link: link)
                                
                            }, label: {
                                Label("Favorito", systemImage: "star.fill")
                                
                            }).tint(.yellow)
                            Button(action: {
                                linkViewModel.updateIsCompleted(link: link)
                                
                            }, label: {
                                Label("Completado", systemImage: "checkmark.circle.fill")
                                
                            }).tint(.blue)
                            
                           
                            
                        }.swipeActions(edge: .leading) {
                            Button(action: {
                                //linkViewModel.deleteLink(link: link)
                                showAlert = true
                                
                            }, label: {
                                Label("Eliminar", systemImage: "trash.fill")
                                
                            }).tint(.red)
                            
                        }.alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Desea eliminar este link?"),
                                message: Text("Esta acción no podrá deshacerse"),
                                primaryButton: .default(
                                    Text("Cancelar"),
                                    action: {
                                        print("No se eliminó")
                                    }
                                ),
                                secondaryButton: .destructive(
                                    Text("Eliminar"),
                                    action:
                                    {
                                        linkViewModel.deleteLink(link: link)
                                        print("Se eliminó")
                                    }
                                    
                                )
                            )
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
