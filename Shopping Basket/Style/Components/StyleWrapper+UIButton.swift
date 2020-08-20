//
//  StyleWrapper+UIButton.swift
//  Flame
//
//  Created by Johnnie Walker on 30.06.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import Foundation
import UIKit

extension StyleWrapper where Element: UIButton {
    
    static func buy() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
            button.setImage(UIImage(systemName: "cart"), for: .normal)
            button.tintColor = .white
            button.layer.cornerRadius = 10.0
            button.layer.masksToBounds = true
        }
        return wrap
    }
    
    static func delete() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = .systemPink
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
            button.setImage(UIImage(systemName: "trash"), for: .normal)
            button.tintColor = .white
            button.layer.cornerRadius = 10.0
            button.layer.masksToBounds = true
        }
        return wrap
    }
    
    static func cancel() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = .systemOrange
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
            button.setImage(nil, for: .normal)
            button.tintColor = .white
            button.layer.cornerRadius = 10.0
            button.layer.masksToBounds = true
        }
        return wrap
    }
    
    static func add() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = .systemOrange
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
            button.setImage(nil, for: .normal)
            button.tintColor = .white
            button.layer.cornerRadius = 10.0
            button.layer.masksToBounds = true
        }
        return wrap
    }
}
