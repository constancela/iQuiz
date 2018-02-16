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
        let selectedAnswer = variables.segmentedControl.titleForSegment(at: selectedAnswerIndex)
        if selectedAnswer == currentQuestion.correctAnswer {
            variables.score = variables.score + 1
            answerResult.text = "CORRECT"
        } else {
            answerResult.text = "INCORRECT"
        }
        
        yourAnswer.text = getAnswerText(letter: selectedAnswer!)
        correctAnswer.text = getAnswerText(letter: currentQuestion.correctAnswer)
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
    
    
    func getAnswerText(letter: String) -> String {
        var result = ""
        if letter == "A" {
            result = variables.remainingQuestions[0].A
        } else if letter == "B" {
            result = variables.remainingQuestions[0].B
        } else if letter == "C" {
            result = variables.remainingQuestions[0].C
        } else if letter == "D" {
            result = variables.remainingQuestions[0].D
        }
        return result
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
