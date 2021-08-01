//
//  SecondViewController.swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 11.04.21.
//

import UIKit

class SecondViewController: UIViewController {
    private var xCordCar: Int = 0
    let userDefaultsInstance = UserDefaults.standard
    var timer = Timer()
    var stringData = ""
    var resultModel = [String]()
    var deleteValueStore = Int()
    var deleteValueJSON = Int()
    var score: [ScoreNumber] = []
    var sortedScore: [ScoreNumber] = []
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

        })

      //  scoreLable.text = "Score: \(ScoreNumber.score)"
      //  _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] (_) in
       //     ScoreNumber.score += 1
        //    scoreLable.text = "Score: \(ScoreNumber.score)"
       // }
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
    }
    func displayAlert() {
        let alertController = UIAlertController(title: "You left the road :((", message: "", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Main menu", style: .default) { (closeAction) in
            self.navigationController?.popViewController(animated: true)

        }
        alertController.addAction(closeAction)
        present(alertController, animated: true, completion: nil)
    }

//    func saveScore() {
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM d, h:mm a"
//        let dataString = dateFormatter.string(from: Date())
//        stringData = dataString
//
//
//        let documentsDirectoryPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//        var folderPath = documentsDirectoryPath
//        folderPath?.appendPathComponent("Best Score")
//
//        guard let path = folderPath else {
//            return
//        }
//        try? FileManager.default.createDirectory(at: path, withIntermediateDirectories: false, attributes: nil)
//
//        let score = ScoreNumber.score
//        let data = try? JSONEncoder().encode(score)
//        let dataPath = folderPath?.appendingPathComponent("BestScore \(stringData).json")
//        FileManager.default.createFile(atPath: dataPath!.path, contents: data, attributes: nil)
//
//    }
//    private func loadScore(){
//        let documentDirectoryPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//        guard var folderPath = documentDirectoryPath else {
//            return
//        }
//        folderPath.appendPathComponent("Best Score")
//        let file = try? FileManager.default.contentsOfDirectory(atPath: folderPath.path)
//        guard let arrayOfResult = file else {
//            return
//        }
//        for data in 0..<arrayOfResult.count {
//            resultModel.append(arrayOfResult[data])
//            if resultModel[data] == ".DS_Store" {
//                deleteValueStore = data
//            }
//            if resultModel[data] == ".json"{
//                deleteValueJSON = data
//            }
//        }
//        if resultModel[deleteValueStore] == ".DS_Store" {
//            let index = deleteValueStore
//            resultModel.remove(at: index)
//        }
//        if resultModel[deleteValueJSON] == ".json" {
//            let index = deleteValueJSON
//            resultModel.remove(at: index)
//        }
//        for data in 0..<resultModel.count {
//            let dataPath = folderPath.appendingPathComponent("\(resultModel[data])")
//            guard let newData = FileManager.default.contents(atPath: dataPath.path) else {
//                return
//            }
//            if let resultOfRace = try? JSONDecoder().decode(ScoreNumber.self, from: newData) {
//                score.append(resultOfRace)
//            }
//        }
//        sortedScore = sortedArray(array: score)
//
//
//        func sortedArray(array: [ScoreNumber]) -> [ScoreNumber] {
//            var sortedArrayScore = array.sorted { (s1: ScoreNumber, s2: ScoreNumber) -> Bool in
//                return ScoreNumber.score > ScoreNumber.score
//
//            }
//            while sortedArrayScore.count > 20 {
//                sortedArrayScore.removeLast()
//            }
//            return sortedArrayScore
//        }
//        print(sortedScore.count)
//
//
//
//
//    }
    @IBAction private func onPan(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: self.view)
        xCordCar = Int(point.x)
        onCarButton.frame = CGRect(x: xCordCar, y: 692, width: 103, height: 200)
        if xCordCar > 325 || xCordCar == 0 {
            timer.invalidate()
            displayAlert()
           // saveScore()
           // loadScore()
        }
    }
}

