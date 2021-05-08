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

        let documentsDirectoryPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        var folderPath = documentsDirectoryPath
        folderPath?.appendPathComponent("Best Score")

        guard let path = folderPath else {
            return
        }
        try? FileManager.default.createDirectory(at: path, withIntermediateDirectories: false, attributes: nil)

        let score = ScoreNumber.score
        let data = try? JSONEncoder().encode(score)
        let dataPath = folderPath?.appendingPathComponent("BestScore.json")
        FileManager.default.createFile(atPath: dataPath!.path, contents: data, attributes: nil)
    }
    @IBAction private func onPlayButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: Bundle.main)
        let destinationViewController = storyboard.instantiateInitialViewController()!
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    @IBAction private func onCarViewButton(_ sender: Any) {
        ChangeCar.carObject = true
        ChangeCar.carObject2 = false
        ChangeCar.carObject3 = false
        saveCar()
        navigationController?.popViewController(animated: true)
    }
    @IBAction private func onCarViewButtonTwo(_ sender: Any) {
        ChangeCar.carObject2 = true
        ChangeCar.carObject = false
        ChangeCar.carObject3 = false
        saveCar()
        navigationController?.popViewController(animated: true)
    }
    @IBAction private func onCarViewButtonThree(_ sender: Any) {
        ChangeCar.carObject3 = true
        ChangeCar.carObject = false
        ChangeCar.carObject2 = false
        saveCar()
        navigationController?.popViewController(animated: true)
    }
    func saveCar() {
        let userCar = UserDefaults.standard
        if ChangeCar.carObject == true {
            userCar.setValue(true, forKey: "carObject")
            userCar.synchronize()
        }
        if ChangeCar.carObject2 == true {
            userCar.setValue(true, forKey: "carObject2")
            userCar.synchronize()
        }
        if ChangeCar.carObject3 == true {
            userCar.setValue(true, forKey: "carObject3")
            userCar.synchronize()
        }
    }
    }
