//
//  HomeView.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    @StateObject var linkViewModel = LinkViewModel()
    
    var body: some View {
        NavigationView{
            TabView{
                VStack(alignment: .center){
                    Text("Bienvenido \(authViewModel.user?.email ?? "NO USER")").padding(.top, 35)
                    Spacer()
                    LinkView(linkViewModel: linkViewModel, authViewModel: authViewModel)
                }
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
                
                ProfileView(authViewModel: authViewModel).tabItem{
                    Label("Perfil", systemImage: "person.fill")
                }
                //list.number
                Notas().tabItem {
                    Label("Notas", systemImage: "list.number")
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("NOTAS").toolbar{
                    Button("Salir"){
                        authViewModel.logout()
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(authViewModel: AuthViewModel())
    }
}
