//
//  LanchScreenVC.swift
//  Comma
//
//  Created by 임채승 on 2022/07/17.
//

import UIKit
import Lottie

class SplashVC: UIViewController {

    private var animationView: AnimationView?
        
    public override func viewDidAppear(_ animated: Bool) {
        animationView = .init(name: "logo")
        animationView!.frame = view.bounds
        animationView!.contentMode = .center
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 1.20
        view.addSubview(animationView!)
        animationView!.play {_ in
        let Storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let VC = Storyboard.instantiateViewController(identifier: "MainVC") as? UIViewController else { return }
        VC.modalPresentationStyle = .fullScreen // 풀스크린으로 설정
        self.present(VC, animated: false, completion: nil)
        }
    }
}
