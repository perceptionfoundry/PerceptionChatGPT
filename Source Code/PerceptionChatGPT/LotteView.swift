//
//  LotteView.swift
//  Prayer AI iOS
//
//  Created by Perception on 14/03/2023.
//

import SwiftUI
import Lottie

struct LotteView: UIViewRepresentable {
   
    func makeUIView(context: Context) -> some LottieAnimationView {
        
        let animationView = LottieAnimationView(name: "lets-chat")
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.play()
        return animationView

    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct LotteView_Previews: PreviewProvider {
    static var previews: some View {
        LotteView()
    }
}
