//
//  HomeView.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            TabView{
                VStack(alignment: .center){
                    Text("Bienvenido \(authViewModel.user?.email ?? "NO USER")").padding(.top, 35)
                    Spacer()
                    
                }
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
                
                ProfileView(authViewModel: authViewModel).tabItem{
                    Label("Perfil", systemImage: "person.fill")
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
