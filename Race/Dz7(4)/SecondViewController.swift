//
//  SecondViewController.swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 11.04.21.
//

import UIKit

class SecondViewController: UIViewController {
    private var xCordCar: Int = 0
    let userCar = UserDefaults.standard
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var carView: UIImageView!
    @IBOutlet weak var carViewTwo: UIImageView!
    @IBOutlet weak var carViewThree: UIImageView!
    @IBOutlet weak var carViewFour: UIImageView!
    @IBOutlet weak var onCarButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLable.text = "Score \(ScoreNumber.score)"
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] (_) in
            ScoreNumber.score += 1
            scoreLable.text = "Score \(ScoreNumber.score)"
        }

        if userCar.bool(forKey: "carObject") {
            if let image = UIImage(named: "car") {
                self.onCarButton.setImage(image, for: .normal)
                ScoreNumber.score += 1
            }
        }
        if userCar.bool(forKey: "carObject2") {
            if let image = UIImage(named: "objectCar5") {
                self.onCarButton.setImage(image, for: .normal)
                }
            }
        if userCar.bool(forKey: "carObject3") {
            if let image = UIImage(named: "objectCar6") {
                self.onCarButton.setImage(image, for: .normal)
                }
            }
        UIView.animate(withDuration: 5.0, delay: 0.0, options: [.repeat]) {
            self.carView.frame = CGRect(x: 0, y: 999, width: 240, height: 200)
        } completion: { _ in
        }

        UIView.animate(withDuration: 5.0, delay: 4.0, options: [.repeat]) {
            self.carViewTwo.frame = CGRect(x: 200, y: 999, width: 240, height: 200)
        } completion: { _ in
        }

        UIView.animate(withDuration: 5.0, delay: 2.0, options: [.repeat]) {
            self.carViewThree.frame = CGRect(x: 0, y: 999, width: 240, height: 200)
        } completion: { _ in
        }

        UIView.animate(withDuration: 5.0, delay: 6.0, options: [.repeat]) {
            self.carViewFour.frame = CGRect(x: 200, y: 999, width: 240, height: 200)
        } completion: { _ in
        }
    }
    @IBAction private func onPan(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: self.view)
        xCordCar = Int(point.x)
        onCarButton.frame = CGRect(x: xCordCar, y: 692, width: 103, height: 200)
        if xCordCar > 325 || xCordCar == 0 {
            navigationController?.popViewController(animated: true)
        }
    }
}
