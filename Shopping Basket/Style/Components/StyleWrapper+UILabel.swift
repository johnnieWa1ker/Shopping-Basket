//
//  StyleWrapper+UILabel.swift
//  Flame
//
//  Created by Johnnie Walker on 30.06.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import Foundation

import UIKit

extension StyleWrapper where Element: UILabel {
    
    // MARK: - Title 2
    
    /// System 24 | Regular
    static func title2Regular24(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 24)
            label.textColor = color
        }
        return wrap
    }
    
    /// System 24 | Bold
    static func title2Bold24(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 24)
            label.textColor = color
        }
        return wrap
    }
    
    // MARK: - Title 3
    
    /// System 20 | Regular
    static func title3Regular20(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = color
        }
        return wrap
    }
    
    /// System 20 | Semibold
    static func title3Semibold20(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = color
        }
        return wrap
    }
    
    // MARK: - Headline
    
    /// System 18 | Regular
    static func headlineRegular18(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = color
        }
        return wrap
    }
    
    /// System 18 | Semibold
    static func headlineSemibold18(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = color
        }
        return wrap
    }
    
    /// System 18 | Semibold
    static func headlineBold18(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = color
        }
        return wrap
    }
    
    // MARK: - Subheadline
    
    /// System 16 | Regular
    static func subheadlineRegular16(_ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .white
        }
        return wrap
    }
    
    /// System 16 | Semibold
    static func subheadlineSemibold16(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = color
        }
        return wrap
    }
    
    // MARK: - Body
    
    /// System 14 | Regular
    static func bodyRegular14(_ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .white
        }
        return wrap
    }
    
    /// System 14 | Semibold
    static func bodySemibold14(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = color
        }
        return wrap
    }
    
    // MARK: - Caption
    
    /// System 12 | Medium
    static func captionMedium12(_ color: UIColor, _ textAlignment: NSTextAlignment?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { label in
            label.textAlignment = textAlignment ?? .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingMiddle
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = color
        }
        return wrap
    }
}
