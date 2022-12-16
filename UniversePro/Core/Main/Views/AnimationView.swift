//
//  StarterAnimationView.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 16.12.2022.
//

import SwiftUI
import Lottie

struct AnimationView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let animation = LottieAnimation.named("spaceman")
        
        let animationView = LottieAnimationView()
        animationView.animation = animation
        animationView.play()
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
    
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
