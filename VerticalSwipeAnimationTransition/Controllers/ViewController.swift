//
//  ViewController.swift
//  VerticalSwipeAnimationTransition
//
//  Created by Zachary Chandler on 7/18/18.
//  Copyright © 2018 Zachary Chandler. All rights reserved.
//

import UIKit
import QuartzCore
import Pulsator

class ViewController: UIViewController {

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var imageView: UIImageView!

    var timer: Timer!
    let pulsator = Pulsator()
    
    @IBOutlet weak var tapButton: UIButton!
    
    @IBAction func didTouchDown() {
        UIView.animate(withDuration: 0.221,
                       animations: {
                        self.circleView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        },
                       completion: { _ in
                    
        })
    }
    @IBAction func didTouchUp() {
        let pulse = Pulsator()
        pulse.numPulse = 1
        pulse.animationDuration = 5
        pulse.backgroundColor =  UIColor(red: 0, green: 1, blue: 0.9892283082, alpha: 1).cgColor
        pulse.radius = 200
        self.circleView.layer.superlayer?.insertSublayer(pulse, below: self.circleView.layer)
        pulse.autoRemove = true
        pulse.autoreverses = false
        pulse.position = self.circleView.layer.position
        pulse.start()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            pulse.stop()
        })
        UIView.animate(withDuration: 0.50,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIViewAnimationOptions.allowUserInteraction,
                       animations: {
                        self.circleView.transform = CGAffineTransform.identity
                        },
                       completion: { Void in()
                        
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        circleView.layer.cornerRadius = 22
        circleView.layer.masksToBounds = true
        animatePulse()
        pulsator.numPulse = 5
        pulsator.animationDuration = 8
        pulsator.backgroundColor =  UIColor(red: 0, green: 1, blue: 0.9892283082, alpha: 1).cgColor
        pulsator.radius = 200
        circleView.layer.superlayer?.insertSublayer(pulsator, below: circleView.layer)
        pulsator.start()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.layoutIfNeeded()
        pulsator.position = circleView.layer.position
    }

    override func viewDidAppear(_ animated: Bool) {
//        runTimer()
    }
    override func viewWillDisappear(_ animated: Bool) {
        endTimer()
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    func endTimer() {
//        timer.invalidate()
    }
    func animatePulse() {
        
    }
    @objc func updateTimer() {
        animatePulse()
    }
}
