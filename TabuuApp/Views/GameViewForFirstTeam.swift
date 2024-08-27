//
//  GameViewForFirstTeam.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 22.08.2024.
//

import SwiftUI

struct GameViewForFirstTeam: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    // Arka plan
                    TabuWordView()
                        .opacity(0.1)

                    GameQuestionFirstTeamBoxView(viewModel: viewModel)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea()
            .background(LinearGradient(colors: [Color("color1"), Color("color2")], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .navigationBarBackButtonHidden(true)
        
    }
}


#Preview {
    GameViewForFirstTeam(viewModel: GameViewModel())
}
 
