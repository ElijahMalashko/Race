//
//  UILable+UIUtilites.swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 17.04.21.
//

import Foundation
import UIKit

extension UILabel {
    func applyCornerRadius(_ radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
}
extension UIView {
    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5
    }
}
