//
//  GameQuestionFirstTeamBoxView.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 22.08.2024.
//

import SwiftUI

struct GameQuestionFirstTeamBoxView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        if viewModel.showScorePage {
            ScorePageView(viewModel: viewModel)
        } else {
            VStack(spacing: 20) {
                HStack {
                    Text("Score: \(viewModel.teamAScore)")
                        .font(.headline)
                        .foregroundColor(Color("textColorOnStartGameViewFrame"))
                        .padding()
                        .background(LinearGradient(colors: [Color("color2"), Color("color3")], startPoint: .top, endPoint: .bottom))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    Text("Time: \(viewModel.timeRemaining)s")
                        .font(.headline)
                        .foregroundColor(Color("textColorOnStartGameViewFrame"))
                        .padding()
                        .background(LinearGradient(colors: [Color("color2"), Color("color3")], startPoint: .top, endPoint: .bottom))
                        .clipShape(Capsule())
                }
                .padding(.horizontal)
                
                VStack(spacing: 16) {
                    Text(viewModel.currentQuestion)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .background(LinearGradient(colors: [Color("color2"), Color("color3")], startPoint: .top, endPoint: .bottom))
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(viewModel.tabooWords, id: \.self) { word in
                            Text(word)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("textColorOnStartGameViewFrame"))
                        }
                    }
                    .padding()
                    .background(LinearGradient(colors: [Color("color3"), Color("color1")], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        viewModel.loadNextQuestion() // Geç butonu işlevi
                    }) {
                        Text("Pass")
                            .font(.headline)
                            .foregroundColor(Color("textColorOnStartGameViewFrame"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(colors: [Color("color3"), Color("color1")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    Button(action: {
                        viewModel.teamAScore -= 3 // Skor güncelle
                        viewModel.loadNextQuestion() // Yeni soru al
                    }) {
                        Text("Tabu")
                            .font(.headline)
                            .foregroundColor(Color("textColorOnStartGameViewFrame"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(colors: [Color("color1"), Color("color3")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    Button(action: {
                        viewModel.teamAScore += 1 // Skor güncelle
                        viewModel.loadNextQuestion() // Yeni soru al
                    }) {
                        Text("Correct")
                            .font(.headline)
                            .foregroundColor(Color("textColorOnStartGameViewFrame"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(colors: [Color("color1"), Color("color3")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .padding(.top, 50)
            .onAppear {
                viewModel.currentTeam = viewModel.atakimi
                viewModel.startTimer()
                
            }
        }
    }
}

#Preview {
    GameQuestionFirstTeamBoxView(viewModel: GameViewModel())
}
