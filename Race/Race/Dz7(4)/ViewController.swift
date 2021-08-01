//
//  ViewController.swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 23.03.21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    var arrayOfResult = [String]()
    var stringData = ""
    var resultModel = [String]()
    var deleteValueStore = 0
    var deleteValueJSON = 0
    var scores: [ScoreNumber] = []
    var sortedScore: [ScoreNumber] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(patternImage: UIImage(named: "fad")!)

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

            let score = ScoreNumber.score
            let data = try? JSONEncoder().encode(score)
            let dataPath = folderPath?.appendingPathComponent("BestScore.json")
            FileManager.default.createFile(atPath: dataPath!.path, contents: data, attributes: nil)


            let newData = FileManager.default.contents(atPath: dataPath!.path)
            let newSettings = try? JSONDecoder().decode(ScoreNumber.self, from: newData!)
            print(newSettings?.scores) // делал как показывал антон, и тут нил

        






//        let documentDirectoryPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//        guard var folderPath = documentDirectoryPath else {
//            return
//        }
//        folderPath.appendPathComponent("Best Score")
//        let file = try? FileManager.default.contentsOfDirectory(atPath: folderPath.path)
//        guard let arrayOfResult = file else {
//            return














//        for data in 0..<arrayOfResult.count {
//            resultModel.append(arrayOfResult[data])
//            if resultModel[data] == ".DS_Store" {
//                deleteValueStore = data
//            }
//            if resultModel[data] == ".json" {
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
//                scores.append(resultOfRace)
//            }
//        }
//        sortedScore = sortedArray(array: scores)
//
//
//
//            func sortedArray(array: [ScoreNumber]) -> [ScoreNumber] {
//                var sortedArrayScore = array.sorted { (s1: ScoreNumber, s2: ScoreNumber) -> Bool in
//                    return ScoreNumber.score > ScoreNumber.score
//
//                }
//                while sortedArrayScore.count > 7 {
//                    sortedArrayScore.removeLast()
//                }
//                return sortedArrayScore
//
//            }
//        print(sortedScore)
//    }
    }


    @IBAction private func onPlayButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: Bundle.main)
        let destinationViewController = storyboard.instantiateInitialViewController()!
        navigationController?.pushViewController(destinationViewController, animated: true)
        ScoreNumber.score = 0
        
    }
    @IBAction private func onCarViewButton(_ sender: Any) {
        ChangeCar.carObject = true
        ChangeCar.carObject2 = false
        ChangeCar.carObject3 = false
        //saveCar()
        navigationController?.popViewController(animated: true)
    }
    @IBAction private func onCarViewButtonTwo(_ sender: Any) {
        ChangeCar.carObject2 = true
        ChangeCar.carObject = false
        ChangeCar.carObject3 = false
       // saveCar()
        navigationController?.popViewController(animated: true)
    }
    @IBAction private func onCarViewButtonThree(_ sender: Any) {
        ChangeCar.carObject3 = true
        ChangeCar.carObject = false
        ChangeCar.carObject2 = false
       // saveCar()
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedScore.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CellIdentifier" , for: indexPath)
        cell.textLabel?.text = "\(sortedScore[indexPath.row])"
        return cell
    }
}

