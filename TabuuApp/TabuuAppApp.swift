//
//  TabuuAppApp.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 21.08.2024.
//

import SwiftUI
import Firebase

@main
struct TabuuAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
