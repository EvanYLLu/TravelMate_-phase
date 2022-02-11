//
//  CarImageView.swift
//  finwork
//
//  Created by Evan on 2021/7/24.
//

import Foundation
import UIKit
@IBDesignable
class ImageView: UIImageView {
    override func layoutSubviews() {
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
}
