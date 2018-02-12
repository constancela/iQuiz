//
//  QuizCell.swift
//  iQuiz
//
//  Created by iguest on 2/12/18.
//  Copyright © 2018 iGuest. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {

    @IBOutlet weak var quizImageView: UIImageView!
    @IBOutlet weak var quizSubjectLabel: UILabel!
    @IBOutlet weak var quizDescriptionLabel: UILabel!

    func setQuiz(quiz: Quiz) {
        quizImageView.image = quiz.image
        quizSubjectLabel.text = quiz.subject
        quizDescriptionLabel.text = quiz.description
    }

}
