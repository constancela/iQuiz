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
    var A: String
    var B: String
    var C: String
    var D: String
    var correctAnswer: String
    
    init(question: String, A: String, B: String, C: String, D: String, correctAnswer: String) {
        self.question = question
        self.A = A
        self.B = B
        self.C = C
        self.D = D
        self.correctAnswer = correctAnswer
    }
}
