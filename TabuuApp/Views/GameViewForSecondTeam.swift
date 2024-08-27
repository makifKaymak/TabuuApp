//
//  GameViewForSecondTeam.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 24.08.2024.
//

import SwiftUI

struct GameViewForSecondTeam: View {
    @ObservedObject var viewModel: GameViewModel
    //@State private var navigateToGameView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    // Arka plan
                    TabuWordView()
                        .opacity(0.1)
                        
                    
                    GameQuestionSecondTeamBoxView(viewModel: viewModel)
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
    GameViewForSecondTeam(viewModel: GameViewModel())
}
