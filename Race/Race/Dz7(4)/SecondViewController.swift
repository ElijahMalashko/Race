//
//  SecondViewController.swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 11.04.21.
//

import UIKit

class SecondViewController: UIViewController {
    var xCordCar: Int = 0
    let userDefaultsInstance = UserDefaults.standard
    var timer = Timer()
    var stringData = ""

    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var carView: UIImageView!
    @IBOutlet weak var carViewTwo: UIImageView!
    @IBOutlet weak var carViewThree: UIImageView!
    @IBOutlet weak var carViewFour: UIImageView!
    @IBOutlet weak var onCarButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLable.text = "Score: \(ScoreNumber.score)"
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] timer in
            ScoreNumber.score += 1
            scoreLable.text = "Score: \(ScoreNumber.score)"
            onCarButton.setImage(UIImage(named: "car"), for: .normal)

        })
        if ChangeCar.carObject == true {
            onCarButton.setImage(UIImage(named: "car"), for: .normal)
        }
        if ChangeCar.carObject2 == true {
            onCarButton.setImage(UIImage(named: "objectCar5"), for: .normal)
        }
        if ChangeCar.carObject3 == true {
            onCarButton.setImage(UIImage(named: "objectCar6"), for: .normal)
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let dataString = dateFormatter.string(from: Date())
        stringData = dataString

        let documentsDirectoryPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        var folderPath = documentsDirectoryPath
        folderPath?.appendPathComponent("Best Score")

        guard let path = folderPath else {
            return
        }
        try? FileManager.default.createDirectory(at: path, withIntermediateDirectories: false, attributes: nil)

        let score = ScoreNumber(scores: 0)
        let data = try? JSONEncoder().encode(score)
        let dataPath = folderPath?.appendingPathComponent("Best\(stringData)Score.json")
        FileManager.default.createFile(atPath: dataPath!.path, contents: data, attributes: nil)


        let file = try? FileManager.default.contentsOfDirectory(atPath: folderPath!.path)

        guard let arrayOfResult = file else {
            return
        }
        guard let newData = FileManager.default.contents(atPath: dataPath!.path) else {
            return
        }

        let resultOfRace = try? JSONDecoder().decode(ScoreNumber.self, from: newData)
        ScoreNumber.score = resultOfRace!.scores
    }
    func displayAlert() {
        let alertController = UIAlertController(title: "You left the road :((", message: "", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Main menu", style: .default) { (closeAction) in
            self.navigationController?.popViewController(animated: true)

        }
        alertController.addAction(closeAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction private func onPan(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: self.view)
        xCordCar = Int(point.x)
        onCarButton.frame = CGRect(x: xCordCar, y: 692, width: 103, height: 200)
        if xCordCar > 325 || xCordCar == 0 {
            timer.invalidate()
            displayAlert()

        }
    }
}

