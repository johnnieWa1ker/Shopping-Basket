//
//  StyleWrapper+UIView.swift
//  Flame
//
//  Created by Johnnie Walker on 30.06.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UIView {
    
    /// Style for invisible view
    static func clear() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { view in
            view.backgroundColor = .clear
        }
        return wrap
    }
    
    /// Standard view style for background
    static func asBackground() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { view in
            view.backgroundColor = .black
        }
        return wrap
    }
    
    /// Style for a view that will contain text or graphic content
    static func forContent() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { view in
            view.backgroundColor = .systemIndigo
            view.roundCorners([.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 10.0)
        }
        return wrap
    }
}
