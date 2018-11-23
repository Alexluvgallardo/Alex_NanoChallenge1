//
//  GameViewController.swift
//  GetToKnowBeyza
//
//  Created by Alex Cheung on 13/11/2018.
//  Copyright © 2018 Alex Cheung. All rights reserved.
//

import UIKit

class GameViewController: UIViewController{
    
    var question = [["Choose either one ... for Beyza",0]
                    ,["Mac or PC ...",0]
                    ,["Beyza's favorite color ...",1]
                    ,["Beyza's favorite dishes ...",2]
                    ,["Beyza is a ...",0]
                    ,["Best time to work ...",2]
                    ,["Beyza's ultimate goal in career...",1]
        
                    
    ]
    var options = [["Coffee","Tea","Me"]
                   ,["Mac","PC","-"]
                   ,["Yellow","Turquoise","Cyan"]
                    ,["Cheese","Turkish breakfast","Why not both?"]
                   ,["Fortune teller","Diver","Chef"]
                   ,["In the morning","In the afternoon","At night"]
                   ,["Work in Apple","Create a startup","Doing nothing"]
                   
    ]

//    var question_no: Int = Question.shared.question_no
    
    var answered_correct:Bool = false
    var button_clicked: Int?
    
    @IBOutlet weak var scoreOnBoard: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //first load
        if Question.shared.question_no == 0 {
            renderingQuestion(Question.shared.question_no)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        scoreOnBoard.text = String(Score.shared.points)
        
        //button hiding
        if options[Question.shared.question_no][2] == "-" {
            self.Button3.isHidden = true
        } else {
            self.Button3.isHidden = false
        }
        
    }
    
    @IBAction func Button1_Clicked(_ sender: Any) {
        button_clicked = 0
        checkingTheAnswer(Question.shared.question_no)
    }
    @IBAction func Button2_Clicked(_ sender: Any) {
        button_clicked = 1
        checkingTheAnswer(Question.shared.question_no)
    }
    @IBAction func Button3_Clicked(_ sender: Any) {
        button_clicked = 2
        checkingTheAnswer(Question.shared.question_no)
    }
    
    
    func renderingQuestion(_ q_no: Int){
        questionLabel.text = (question[q_no][0] as! String)
        Button1.setTitle(options[q_no][0], for: .normal)
        Button2.setTitle(options[q_no][1], for: .normal)
        Button3.setTitle(options[q_no][2], for: .normal)
    }
    
    func checkingTheAnswer(_ q_no: Int){
        //correct answer position
        if button_clicked == (question[q_no][1] as! Int) {
            Correct.shared.correct = true
            Score.shared.points += 10
        }
        else {
            Correct.shared.correct = false
        }
    }
    

    @IBAction func unwindToGameViewController(segue: UIStoryboardSegue) {
        // Do nothing
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameAnswerVC = segue.destination as? GameAnswerViewController {
            gameAnswerVC.delegate = self
        }
    }
}


extension GameViewController: GameAnswerViewControllerDelegate {
    
    func finishAnswering() {
        // Update question
        Question.shared.question_no += 1
        renderingQuestion(Question.shared.question_no)
    }
}
