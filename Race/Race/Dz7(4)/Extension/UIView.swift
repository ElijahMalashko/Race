//
//  UIView.swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 1.05.21.
//

import Foundation
import UIKit

extension UIView {
func makeShadow() {
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOpacity = 0.7
    self.layer.shadowOffset = CGSize.zero
    self.layer.shadowRadius = 5
    }
    }
