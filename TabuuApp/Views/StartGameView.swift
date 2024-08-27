//
//  StartGameView.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 21.08.2024.
//

import SwiftUI

struct StartGameView: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                    
                ZStack {
                    
                    BackButtonView(presentationMode: _presentationMode)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                   // Spacer()
                    
                    TabuWordView()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .opacity(0.3)
                }
                
                
                //Spacer()
                
                TeamsNamesAndButtonView()
                    
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [Color("color1"), Color("color2")], startPoint: .topLeading, endPoint: .bottomTrailing))
            
        }
        
        .navigationBarBackButtonHidden(true)
        
    }
    
}

#Preview {
    StartGameView()
}
