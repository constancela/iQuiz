//
//  Quiz.swift
//  iQuiz
//
//  Created by iguest on 2/12/18.
//  Copyright © 2018 iGuest. All rights reserved.
//

import Foundation
import UIKit

class Quiz {
    var image: UIImage
    var subject: String
    var description: String
    
    init(image: UIImage, subject: String, description: String) {
        self.image = image
        self.subject = subject
        self.description = description
    }
}
