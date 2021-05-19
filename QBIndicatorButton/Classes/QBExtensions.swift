//
//  QBExtensions.swift
//  QBIndicatorButton
//
//  Created by quan bui on 2021/05/19.
//

import UIKit

extension UIButton {

    /// Set title of the button
    /// - Parameter text: button text
    open func setTitle(_ text: String?) {
        for state: UIControl.State in [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved] {
            self.setTitle(text, for: state)
        }
    }
}

extension UIView {

    /// Set corner, border of the button
    /// - Parameters:
    ///   - color: border color of the button
    ///   - cornerRadius: corner radius of the button
    ///   - borderWidth: border width of the button
    open func setCornerBorder(color: UIColor? = nil,
                              cornerRadius: CGFloat = 4.0,
                              borderWidth: CGFloat = 1.5) {
        self.layer.borderColor = color != nil ? color?.cgColor : UIColor.clear.cgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
    }
}

extension UIColor {

    /// Use of hexString color
    /// - Parameter hexString: hex string
    convenience init(hex hexString: String) {
        var color: UInt32 = 0
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0
        if Scanner(string: hexString.replacingOccurrences(of: "#", with: "")).scanHexInt32(&color) {
            r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            g = CGFloat((color & 0x00FF00) >>  8) / 255.0
            b = CGFloat( color & 0x0000FF) / 255.0
        }
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
