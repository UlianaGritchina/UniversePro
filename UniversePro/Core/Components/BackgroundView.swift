//
//  BackgroundView.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        RadialGradient(
            colors: [.blue, .black],
            center: .center,
            startRadius: 5, endRadius: 500
        )
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .preferredColorScheme(.dark)
    }
}
