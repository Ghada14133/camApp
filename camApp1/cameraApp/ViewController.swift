//
//  ViewController.swift
//  cameraApp
//
//  Created by Ghada Fahad on 27/04/1443 AH.
//

import UIKit
import Lottie





class ViewController: UIViewController {
let animationView = AnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimation()
        animate()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animationView.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: self.animate)
    }
    func setupAnimation() {
        animationView.animation = Animation.named("71723-take-a-selfie")
        animationView.frame = view.bounds
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }
    func animate() {
        UIView.animate(withDuration: 4, animations: {
            self.animationView.alpha = 0
        }, completion: {done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute:{
                    let ViewController = ViewController2()
                  ViewController.modalTransitionStyle = .crossDissolve
                    ViewController.modalPresentationStyle = .fullScreen
                  self.present(ViewController, animated: true)
                })
        }
        
    })
  
}

}

