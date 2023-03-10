//
//  LauncherVC.swift
//  Enqura Challenge
//
//  Created by Ozan on 8.03.2023.
//

import UIKit
import Lottie

class LauncherVC: BaseVC<MainVM> {
    
    @IBOutlet private weak var splashAnimation: UIView! {
        didSet {
            if let animationView = animationView {
                splashAnimation.addSubview(animationView)
                animationView.play(fromFrame: ProgressKeyFrames.start.rawValue, toFrame: ProgressKeyFrames.end.rawValue, loopMode: .none) { [weak self] (_) in
                    self?.viewModel?.goToMainVC.onNext(())
                }
            }
        }
    }
    private var animationView: LottieAnimationView? {
        let animationView = LottieAnimationView.init(name: "lizard")
        animationView.frame = splashAnimation.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1
        return animationView
    }
    enum ProgressKeyFrames: CGFloat {
        case start = 0
        case end = 149.9
        case complete = 300
    }
}
