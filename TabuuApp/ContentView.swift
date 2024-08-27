//
//  ContentView.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 21.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        NavigationStack {
            
            VStack {
                TabuWordView()
                
                NavigationLink(destination: StartGameView()) {
                    StartGameButtonView()
                }
                
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [Color("color1"), Color("color2")], startPoint: .topLeading, endPoint: .bottomTrailing))
            
        }
        .tint(Color("textColorOnStartGameViewFrame"))
        .navigationBarBackButtonHidden(true)
    
    }
}

#Preview {
    ContentView()
}

