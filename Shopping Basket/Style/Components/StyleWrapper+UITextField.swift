//
//  StyleWrapper+UITextField.swift
//  Flame
//
//  Created by Johnnie Walker on 30.06.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UITextField {
    
    /// Standard style for text fields
    static func standart() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { textField in
            
            textField.backgroundColor = .white
            textField.layer.borderWidth = 0
            textField.layer.borderColor = CGColor(srgbRed: 173, green: 178, blue: 185, alpha: 100)
            textField.layer.cornerRadius = 10
            textField.layer.masksToBounds = true
            textField.borderStyle = .none
            textField.font = UIFont.systemFont(ofSize: 18.0)
            textField.textColor = .black
            textField.placeholderColor(color: .darkGray)
            textField.setLeftPaddingPoints(16.0)
        }
        return wrap
    }
}
