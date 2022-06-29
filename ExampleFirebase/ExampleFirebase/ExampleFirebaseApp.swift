//
//  ExampleFirebaseApp.swift
//  ExampleFirebase
//
//  Created by Ricardo Asin on 28/6/22.
//

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ExampleFirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.user != nil{
                HomeView(authViewModel: authViewModel)
                
            }else{
                AuthView(authViewModel: authViewModel)
            }
            
            
            
            
        }
    }
}
