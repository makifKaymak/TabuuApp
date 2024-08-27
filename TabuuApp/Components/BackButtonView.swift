//
//  BackButtonView.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 21.08.2024.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                                .font(.system(size: 20, weight: .bold))
                                //.padding()
                                .foregroundStyle(Color("textColorOnStartGameViewFrame"))
                                
                               
            }
            
        }
    }

}

#Preview {
    BackButtonView()
}
