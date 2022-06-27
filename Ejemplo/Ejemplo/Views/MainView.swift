//
//  MainView.swift
//  Ejemplo
//
//  Created by Ricardo Asin on 17/6/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView{
            VStack{
                ContentView()
                Divider().padding()
                Text("📍Ubicación:")
                MapView().frame(width: 400, height: 400).padding()
            }
        }
       
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
