//
//  UITextField.swift
//  Flame
//
//  Created by Johnnie Walker on 30.06.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import UIKit

extension UITextField {
    
    /// Indent left text box
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    /// Indent right text box
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }

    /// Change placeholder color
    func placeholderColor(color: UIColor) {
        if let font = self.font, let placeholder = self.placeholder {
            let attributeString = [NSAttributedString.Key.foregroundColor: color.withAlphaComponent(1),
                                   NSAttributedString.Key.font: font] as [NSAttributedString.Key: Any]
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributeString)
        }
    }
}
