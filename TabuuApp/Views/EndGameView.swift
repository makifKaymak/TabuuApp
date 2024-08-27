//
//  EndGameView.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 24.08.2024.
//

import SwiftUI

struct EndGameView: View {
    @ObservedObject var viewModel: GameViewModel
    
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
                    viewModel.endGameReturnStartView = true
                }) {
                    Text("Bitir")
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
        .navigationDestination(isPresented: $viewModel.endGameReturnStartView) {
            ContentView()
        }
        
    }
}

#Preview {
    EndGameView(viewModel: GameViewModel())
}
