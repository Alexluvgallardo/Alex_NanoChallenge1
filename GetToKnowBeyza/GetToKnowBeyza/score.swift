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
    static var shared = Score(points: 0)
    var points: Int
}

struct Question{
    static var shared = Question(question_no: 0)
    var question_no : Int
    
    
}

struct Correct{
    static var shared = Correct(correct: false)
    var correct : Bool
}


