//
//  UIViewController.swift
//  Shopping Basket
//
//  Created by Johnnie Walker on 20.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit
import SwiftEntryKit

extension UIViewController {
    
    /// Shows a text notification without buttons in a pop-up window at the top of the screen (similar to standard notifications)
    ///
    /// - Parameter message: Responsible for the message that will be in the interface
    /// - Parameter style: Responsible for the appearance of the interface. Allows you to separate UI according to the logical meaning of notifications
    /// - Parameter duration: Responsible for the time during which the notification will be displayed on the screen
    func showNotice(_ message: String) {
        DispatchQueue.main.async {
            
            var attributes = EKAttributes.bottomToast
            attributes.hapticFeedbackType = .success
            attributes.entryBackground = .color(color: EKColor(.systemBlue))
            attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
            attributes.shadow = .active(with: .init(color: EKColor(.black), opacity: 0.3, radius: 3))
            attributes.statusBar = .currentStatusBar
            attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
            attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .intrinsic)
            attributes.displayDuration = 4
            
            let titleText: String = "Message"
            let title = EKProperty.LabelContent(text: titleText, style: .init(font: UIFont.systemFont(ofSize: 18), color: .white))
            let description = EKProperty.LabelContent(text: message, style: .init(font: UIFont.systemFont(ofSize: 14), color: EKColor(.white)))
            
            let simpleMessage = EKSimpleMessage(image: nil, title: title, description: description)
            let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
            
            let contentView = EKNotificationMessageView(with: notificationMessage)
            
            SwiftEntryKit.display(entry: contentView, using: attributes)
        }
    }
} 
