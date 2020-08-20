//
//  Stylable.swift
//  Flame
//
//  Created by Johnnie Walker on 30.06.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import Foundation

protocol Stylable { }

extension NSObject: Stylable { }

extension Stylable {
    
    static func style(style: @escaping Style<Self>) -> Style<Self> {
        let value = style
        return value}
    
    func apply(_ style: StyleWrapper<Self>) {
        switch style {
        case let .wrap(style):
            style(self)
        }
    }
    
}
