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
            VStack {
                Image("back4")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            RadialGradient(
                colors: [Color("spaceBlue").opacity(0.5), .black.opacity(0.3)],
                center: .bottom,
                startRadius: 105, endRadius: UIScreen.main.bounds.height / 1.3
            )
            Rectangle()
                .opacity(0)
                .ignoresSafeArea()
                .background(.ultraThinMaterial)
                .opacity(0.8)
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
