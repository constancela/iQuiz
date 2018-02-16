//
//  FinishedScene.swift
//  iQuiz
//
//  Created by iguest on 2/15/18.
//  Copyright © 2018 iGuest. All rights reserved.
//

import UIKit

class FinishedScene: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let totalQuestions = variables.selectedQuiz.questions.count
        let totalCorrect = variables.score
        score.text = "\(totalCorrect) / \(totalQuestions)"
        
        let percentage = (Double(totalCorrect) / Double(totalQuestions)) * 100
        if percentage == 100 {
            message.text = "Perfect!"
        } else if percentage >= 80 {
            message.text = "Excellent!"
        } else if percentage >= 60 {
            message.text = "Almost!"
        } else if percentage >= 30 {
            message.text = "Nice try!"
        } else if percentage == 0 {
            message.text = "You failed."
        }
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "FinishedToHome", sender: self)
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "FinishedToHome", sender: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
