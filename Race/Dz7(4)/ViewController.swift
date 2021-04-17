//
//  ViewController.swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 23.03.21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "fad")!)
    }
    @IBAction private func onPlayButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: Bundle.main)
        let destinationViewController = storyboard.instantiateInitialViewController()!
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
