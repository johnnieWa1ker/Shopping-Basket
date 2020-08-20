//
//  UIView.swift
//  Shopping Basket
//
//  Created by Johnnie Walker on 20.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Makes view corners rounded with a given radius
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
    }
}
