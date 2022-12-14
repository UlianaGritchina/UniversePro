//
//  FindButtonView.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import SwiftUI

struct FindButtonView: View {
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
                .opacity(0.3)
                .shadow(radius: 2)
                .overlay { Text("🔍") }
        }
    }
}

struct FindButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FindButtonView(action: {})
    }
}
