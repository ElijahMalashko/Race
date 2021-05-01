//
//  UIViewController+Storyboard .swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 1.05.21.
//

import Foundation
import UIKit

    extension UIViewController {
    static func instantiate() -> Self {
    let name = String(describing: Self.self)
    let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
    guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
    fatalError("Can't init view controller from storyboard")
    }
    return viewController
    }
    }
