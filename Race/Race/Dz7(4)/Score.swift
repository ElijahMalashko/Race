//
//  Score.swift
//  Dz7(4)
//
//  Created by Elijah Malashko on 2.05.21.
//

import Foundation
import UIKit

struct ScoreNumber: Codable {
    static var score: Int = 10
    var scores = score
}
struct ScoreModel: Codable {
    var score = ScoreNumber.score
    
}
