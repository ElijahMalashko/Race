//
//  ViewController.swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 23.03.21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    var arrayOfResultt = 0
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(patternImage: UIImage(named: "fad")!)

            arrayOfResultt = ScoreNumber.score
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
        
        navigationController?.popViewController(animated: true)
    }
    @IBAction private func onCarViewButtonTwo(_ sender: Any) {
        ChangeCar.carObject2 = true
        ChangeCar.carObject = false
        ChangeCar.carObject3 = false

        navigationController?.popViewController(animated: true)
    }
    @IBAction private func onCarViewButtonThree(_ sender: Any) {
        ChangeCar.carObject3 = true
        ChangeCar.carObject = false
        ChangeCar.carObject2 = false

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
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CellIdentifier" , for: indexPath)
        cell.textLabel?.text = "\(arrayOfResultt)"
        return cell
    }
}

