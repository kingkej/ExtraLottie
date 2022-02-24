import UIKit
import Lottie
import SwiftUI

struct ExtraLottieView: UIViewRepresentable {
    var name = "success"
    var loopMode: LottieLoopMode = .loop
    var repeats = false
    var delayTime: Double = 0.0
    let animationView = AnimationView()
    var fromProgress: CGFloat = 0.0
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.backgroundBehavior = .pauseAndRestore
        playAnimation()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    func playAnimation() {
        animationView.play(fromProgress: fromProgress, toProgress: 1) { _ in
            if repeats {
                DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
                    playAnimation()
                }
            }
        }
    }
}
