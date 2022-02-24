import UIKit
import Lottie
import SwiftUI

public struct ExtraLottieView: UIViewRepresentable {
    var animationName: String
    var loopMode: LottieLoopMode
    var manualLoop = false
    var delayBetweenLoop: Double = 0.0
    var fromProgress: CGFloat = 0.0
    
    let animationView = AnimationView()
    
    public init(animationName: String) {
        self.animationName = animationName
        self.loopMode = .loop
    }
    
    public init(animationName: String, loopMode: LottieLoopMode) {
        self.animationName = animationName
        self.loopMode = loopMode
        self.manualLoop = false
    }
    
    public init(animationName: String, manualLoop: Bool, delayBetweenLoop: Double, fromProgress: CGFloat) {
        self.animationName = animationName
        self.manualLoop = manualLoop
        self.fromProgress = fromProgress
        self.loopMode = .playOnce
    }
    
    public func makeUIView(context: UIViewRepresentableContext<ExtraLottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animation = Animation.named(animationName)
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

    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    func playAnimation() {
        animationView.play(fromProgress: fromProgress, toProgress: 1) { _ in
            if manualLoop {
                DispatchQueue.main.asyncAfter(deadline: .now() + delayBetweenLoop) {
                    playAnimation()
                }
            }
        }
    }
}
