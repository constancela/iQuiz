//
//  QuestionScene.swift
//  iQuiz
//
//  Created by iguest on 2/15/18.
//  Copyright © 2018 iGuest. All rights reserved.
//

import UIKit

class QuestionScene: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var A: UILabel!
    @IBOutlet weak var B: UILabel!
    @IBOutlet weak var C: UILabel!
    @IBOutlet weak var D: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        variables.segmentedControl = self.segmentedControl
        let currentQuestion = variables.remainingQuestions[0]
        question.text = currentQuestion.question
        A.text = "A. \(currentQuestion.A)"
        B.text = "B. \(currentQuestion.B)"
        C.text = "C. \(currentQuestion.C)"
        D.text = "D. \(currentQuestion.D)"
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "QuestionToHome", sender: self)
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
         performSegue(withIdentifier: "QuestionToAnswerSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
