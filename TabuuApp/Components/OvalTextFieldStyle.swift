//
//  OvalTextFieldStyle.swift
//  TabuuApp
//
//  Created by Mehmet Akif Kaymak on 21.08.2024.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(colors: [Color("color4"), Color("color3")], startPoint: .bottom, endPoint: .leading))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
            .frame(width: 300)
            .foregroundStyle(Color("textColorOnStartGameViewFrame"))
            //.preferredColorScheme(.light)
    }
}
