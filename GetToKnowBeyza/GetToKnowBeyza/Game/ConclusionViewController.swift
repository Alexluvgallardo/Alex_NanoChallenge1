//
//  ConclusionViewController.swift
//  GetToKnowBeyza
//
//  Created by Alex Cheung on 16/11/2018.
//  Copyright © 2018 Alex Cheung. All rights reserved.
//

import UIKit

class ConclusionViewController: UIViewController {

    @IBOutlet weak var scorelabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scorelabel.text = String(Score.shared.points)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        Question.shared.question_no = 0
        Score.shared.points = 0
        
        performSegue(withIdentifier: "UnwindtoHome", sender: self)
    }
    
   

}
