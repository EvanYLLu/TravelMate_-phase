//
//  NavigationView.swift
//  finwork
//
//  Created by Evan on 2021/7/3.
//

import UIKit

class GradientView: UIView {
    var topColor: UIColor = #colorLiteral(red: 0.9984691739, green: 0.4278234541, blue: 0.3354437947, alpha: 1)
    var flootColor: UIColor = #colorLiteral(red: 1, green: 0.6393517256, blue: 0.264567703, alpha: 1)
    var startPionx: CGFloat = 0
    var startPiony: CGFloat = 0
    var endPionx: CGFloat = 1
    var endPiony: CGFloat = 1
    
    override func layoutSubviews() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ topColor.cgColor, flootColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPionx, y: startPiony)
        gradientLayer.endPoint = CGPoint(x: endPionx, y: endPiony)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
