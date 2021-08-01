//
//  UILable+Utilites.swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 1.05.21.
//

import Foundation
import UIKit

extension UILabel {
    func applyCornerRadius(_ radius: CGFloat) {
    clipsToBounds = true
    layer.cornerRadius = radius
        }
    }
