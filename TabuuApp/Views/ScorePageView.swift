//
//  ScorePageView.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 23.08.2024.
//

import SwiftUI

struct ScorePageView: View {
    @ObservedObject var viewModel: GameViewModel
    @State private var navigateToGameView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(viewModel.atakimi): \(viewModel.teamAScore)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("\(viewModel.btakimi): \(viewModel.teamBScore)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                
                Button(action: {
                    //viewModel.switchTeam()
                    navigateToGameView = true
                    //viewModel.showScorePage = false
                }) {
                    Text("Continue")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .background(LinearGradient(colors: [Color("color3"), Color("color4")], startPoint: .bottom, endPoint: .leading))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    
                }
            }
            .padding()
        }
        .navigationDestination(isPresented: $navigateToGameView) {
            GameViewForSecondTeam(viewModel: viewModel)
        }
        
        
    }
}

#Preview {
    ScorePageView(viewModel: GameViewModel())
}
