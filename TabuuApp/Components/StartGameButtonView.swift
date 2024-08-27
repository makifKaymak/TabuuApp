//
//  StartGameButtonView.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 21.08.2024.
//

import SwiftUI

struct StartGameButtonView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                LinearGradient(
                    gradient: Gradient(colors: [Color("color1"), Color("color2")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                
                VStack {
                    Text("BAŞLAYIN")
                        .font(.title)
                        .foregroundStyle(Color("textColorOnStartGameViewFrame"))
                        .padding()
                    
                    Image(systemName: "theatermasks")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                        .foregroundStyle(Color("textColorOnStartGameViewFrame"))
                        .opacity(0.5)
                        
                }
            }
            
        }
       
        
    }
}

#Preview {
    StartGameButtonView()
}
