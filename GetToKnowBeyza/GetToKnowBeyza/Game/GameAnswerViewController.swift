//
//  GameAnswerViewController.swift
//  GetToKnowBeyza
//
//  Created by Alex Cheung on 14/11/2018.
//  Copyright © 2018 Alex Cheung. All rights reserved.
//


//protocol GameDelegate {
//    func finishPassing(type: Int)
//}

import UIKit

protocol GameAnswerViewControllerDelegate: class {
    func finishAnswering()
}

class GameAnswerViewController: UIViewController {

    var GameViewController: GameViewController?

    @IBOutlet weak var scoreBoard2: UILabel?
    @IBOutlet weak var beyzaExplainLabel: UILabel!
    @IBOutlet weak var correctlabel: UILabel!
    
    
    weak var delegate: GameAnswerViewControllerDelegate?
    
    var explainArray = [
    "Beyza needs coffee to wake up !!! She especially loves turkish coffee “No Coffee, No Life”"
    ,"Do you need to think of this question lol."
    ,"Look at the color of the navigation bar. Turquoise is a kind of gemstone in a greenish-blue color."
    ,"The best 3 dishes I like are Cheese, Calamar, and Turkish Breakfast!"
        ,"Call me a fortune teller. I am going to tell you everything :) Besides, I love to read books and be a nerdy developer."
    ,"Oh. I love working at night, focus and enjoy the quiet moment."
    ,"Beyza has started creating apps two years ago. She want to have her own company. She wants partners :)"
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("questionNO:", Question.shared.question_no)
        
        renderExplanation()
        
        
        scoreBoard2?.text = String(Score.shared.points)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if Question.shared.question_no <= 3 {
//            delegate?.finishAnswering()
//        }
//
//    }
    
    func renderExplanation() {
        if Correct.shared.correct == true {
            correctlabel.text = "You got the right answer!"
        } else {
            correctlabel.text = "Oops. Not this one ..."
        }
        
        beyzaExplainLabel.text = explainArray[Question.shared.question_no]
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        //Loop until total quesion_no - 2
        if Question.shared.question_no <= 5 {
            
            delegate?.finishAnswering()
            
            performSegue(withIdentifier: "Unwind Game VC", sender: self)
            print("NextQ")
        } else {
            performSegue(withIdentifier: "GoToEnd", sender: self)
            print("END")
        }
        
    }
}



