//
//  Question.swift
//  iQuiz
//
//  Created by iguest on 2/15/18.
//  Copyright © 2018 iGuest. All rights reserved.
//

import Foundation
import UIKit

class Question {
    var question: String
    var correctAnswer: String
    var answers: [String]
    
    init(question: String, answers: [String], correctAnswer: String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
