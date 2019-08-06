//
//  ViewController.swift
//  AnimatedView
//
//  Created by Marcelo Sampaio on 06/08/19.
//  Copyright © 2019 Marcelo Sampaio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    private var sliderValue : Int = 0
    
    // MARK: - Outlets
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var curveValue: UILabel!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = Float(sliderValue)
        slider.minimumValue = 0.00
        slider.maximumValue = 800.00
        curveValue.text = String(Int(sliderValue))
    }
    
    // MARK: - UI Actions
    @IBAction func animationIcon(_ sender: Any) {
        animate(view: view1, fromPoint: CGPoint(x: 40, y: 40), toPoint: CGPoint(x: 40, y: view.bounds.size.height - 140))
    }
    
    @IBAction func slideToValue(_ sender: Any) {
        sliderValue = Int(slider.value)
        curveValue.text = String(Int(sliderValue))
    }
    
    

    // MARK: - Animation Helper
    private func animate(view : UIView, fromPoint start : CGPoint, toPoint end: CGPoint){
        // The animation
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        // Animation's path
        let path = UIBezierPath()
        
        // Move the "cursor" to the start
        path.move(to: start)
        
        // Calculate the control points
        let c1 = CGPoint(x: start.x + CGFloat(sliderValue), y: start.y)
        let c2 = CGPoint(x: end.x,        y: end.y)
        
        // Draw a curve towards the end, using control points
        path.addCurve(to: end, controlPoint1: c1, controlPoint2: c2)
        
        // Use this path as the animation's path (casted to CGPath)
        animation.path = path.cgPath;
        
        // The other animations properties
        animation.fillMode              = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.duration              = 1.0
        animation.timingFunction        = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeIn)
        
        // Apply it
        view.layer.add(animation, forKey:"trash")
    }
    
    
}

