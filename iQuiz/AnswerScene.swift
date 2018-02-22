//
//  AnswerScene.swift
//  iQuiz
//
//  Created by iguest on 2/15/18.
//  Copyright © 2018 iGuest. All rights reserved.
//

import UIKit

class AnswerScene: UIViewController {
    
    @IBOutlet weak var answerResult: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var yourAnswer: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let currentQuestion = variables.remainingQuestions[0]
        question.text = currentQuestion.question
        let selectedAnswerIndex = variables.segmentedControl.selectedSegmentIndex
        let correctAnswerIndex  = Int(currentQuestion.correctAnswer)! - 1
        if selectedAnswerIndex == correctAnswerIndex {
            variables.score = variables.score + 1
            answerResult.text = "CORRECT"
        } else {
            answerResult.text = "INCORRECT"
        }
        
        yourAnswer.text = currentQuestion.answers[selectedAnswerIndex]
        correctAnswer.text = currentQuestion.answers[correctAnswerIndex]
    }

    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "AnswerToHome", sender: self)
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        variables.remainingQuestions.removeFirst()
        if variables.remainingQuestions.isEmpty {
            performSegue(withIdentifier: "AnswerToResultsSegue", sender: self)
        } else {
            performSegue(withIdentifier: "AnswerToQuestionSegue", sender: self)
        }
    }

    @IBAction func nextButton(_ sender: UIButton) {
        variables.remainingQuestions.removeFirst()
        if variables.remainingQuestions.isEmpty {
            performSegue(withIdentifier: "AnswerToResultsSegue", sender: self)
        } else {
            performSegue(withIdentifier: "AnswerToQuestionSegue", sender: self)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
