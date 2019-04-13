//
//  score.swift
//  GetToKnowBeyza
//
//  Created by Alex Cheung on 15/11/2018.
//  Copyright © 2018 Alex Cheung. All rights reserved.
//

import Foundation
import UIKit

struct Score {
    var points: Int
    static var shared = Score(points: 0)
}

struct Question{
    var question_no : Int
    static var shared = Question(question_no: 0)
}

struct Correct{
    var correct : Bool
    static var shared = Correct(correct: false)
}


