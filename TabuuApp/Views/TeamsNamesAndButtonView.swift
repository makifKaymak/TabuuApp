//
//  TeamsNamesAndButtonView.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 21.08.2024.
//

import SwiftUI

struct TeamsNamesAndButtonView: View {
    
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("A Takımı")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("textColorOnStartGameViewFrame"))
                        .padding()
                        .background(LinearGradient(colors: [Color("color3"), Color("color4")], startPoint: .bottom, endPoint: .leading))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    
                    TextField("", text: $viewModel.atakimi)
                        .textFieldStyle(OvalTextFieldStyle())
                        
                        
                }
                .padding(.bottom, 50)
                
                VStack {
                    Text("B Takımı")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("textColorOnStartGameViewFrame"))
                        .padding()
                        .background(LinearGradient(colors: [Color("color3"), Color("color4")], startPoint: .bottom, endPoint: .leading))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    
                    TextField("", text: $viewModel.btakimi)
                        .textFieldStyle(OvalTextFieldStyle())
                }
                
                Spacer()
                
                Button {
                    viewModel.startGame = true
                } label: {
                    Text("Başlat")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("textColorOnStartGameViewFrame"))
                        .padding()
                        .background(LinearGradient(colors: [Color("color3"), Color("color4")], startPoint: .bottom, endPoint: .leading))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                }
                .padding(.bottom)
                .disabled(viewModel.atakimi.isEmpty || viewModel.btakimi.isEmpty)
                .opacity((viewModel.atakimi.isEmpty || viewModel.btakimi.isEmpty) ? 0.3 : 1)
                                
                Spacer()
                
            }
            .padding()
            .navigationDestination(isPresented: $viewModel.startGame) {
                GameViewForFirstTeam(viewModel: viewModel)
            }
            .onAppear {
                viewModel.currentTeam = viewModel.atakimi
                viewModel.atakimi = ""
                viewModel.btakimi = ""
                viewModel.teamAScore = 0
                viewModel.teamBScore = 0
            }
        }
        
        
    }
}

#Preview {
    TeamsNamesAndButtonView()
}
