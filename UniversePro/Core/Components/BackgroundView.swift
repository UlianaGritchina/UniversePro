//
//  BackgroundView.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .clipped()
            RadialGradient(
                colors: [Color("spaceBlue"), .black.opacity(0.7)],
                center: .bottom,
                startRadius: 105, endRadius: UIScreen.main.bounds.height / 1.3
            )
        }
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .preferredColorScheme(.dark)
    }
}
