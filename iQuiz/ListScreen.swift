//
//  ListScreen.swift
//  iQuiz
//
//  Created by iguest on 2/12/18.
//  Copyr/Users/iguest/Documents/iQuiz/iQuiz/QuizCell.swiftight © 2018 iGuest. All rights reserved.
//

import UIKit

class ListScreen: UIViewController {
    var quizzes: [Quiz] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizzes = createQuizList()
    }
    
    @IBAction func settingsButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func createQuizList() -> [Quiz] {
        var quizList: [Quiz] = []
        quizList.append(Quiz(image: #imageLiteral(resourceName: "math"), subject: "Mathematics", description: "Are you a math wizard? Test your math skills!"))
        quizList.append(Quiz(image: #imageLiteral(resourceName: "marvel"), subject: "Marvel Super Heroes", description: "How well do you know your favorite heroes?"))
        quizList.append(Quiz(image: #imageLiteral(resourceName: "science"), subject: "Science", description: "Test your science knowledge, Einstein!"))
        
        return quizList
    }

}

extension ListScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quiz = quizzes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizCell
        
        cell.setQuiz(quiz: quiz)
        return cell
    }
}
