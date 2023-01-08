//
//  CIrcleButtonView.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 21.12.2022.
//

import SwiftUI

struct CircleButtonView: View {
    let titel: String
    let foregroundColor: Color
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(foregroundColor)
                .opacity(0.4)
                .shadow(radius: 2)
                .overlay { Text(titel) }
            
        }
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(titel: "❤️", foregroundColor: .purple, action: {})
    }
}
