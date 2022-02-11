//
//  CardView.swift
//  finwork
//
//  Created by Evan on 2021/7/3.
//

import UIKit

@IBDesignable
class CardView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 10
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeigth: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        //layer.cornerRadius = 10
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeigth)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
    }
    
}
