//
//  ListScreen.swift
//  iQuiz
//
//  Created by iguest on 2/12/18.
//  Copyr/Users/iguest/Documents/iQuiz/iQuiz/QuizCell.swiftight © 2018 iGuest. All rights reserved.
//

import UIKit

// Global Variables
struct variables {
    static var selectedQuiz: Quiz!
    static var remainingQuestions: [Question]!
    static var segmentedControl: UISegmentedControl!
    static var score = 0
}

class ListScreen: UIViewController {
    var quizzes: [Quiz] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizzes = createQuizList()
        variables.score = 0
    }

    // Settings
    @IBAction func settingsButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Create Math Questions
    func createMathQuestions() -> [Question] {
        var questionList: [Question] = []
        questionList.append(Question(question: "What is 2 * 9?",
                                     A: "18", B: "7", C: "11", D: "20",
                                     correctAnswer: "A"))
        questionList.append(Question(question: "What is 5 + 3 * 2?",
                                     A: "12", B: "16", C: "11", D: "18",
                                     correctAnswer: "C"))
        questionList.append(Question(question: "What is the square root of 256?",
                                     A: "13", B: "16", C: "9", D: "11",
                                     correctAnswer: "B"))
        return questionList
    }
    
    // Create Marvel Questions
    func createMarvelQuestions() -> [Question] {
        var questionList: [Question] = []
        questionList.append(Question(question: "Thor's hammer is made of metal from the heart of a(n) _____",
                                     A: "Asteroid", B: "Comet", C: "Star", D: "Black Hole",
                                     correctAnswer: "C"))
        questionList.append(Question(question: "What is the name of the villian in Ant Man?",
                                     A: "Yellowjacket", B: "Hornet", C: "Wasp", D: "BumbleBee",
                                     correctAnswer: "A"))
        questionList.append(Question(question: "What is Black Widow's real name?",
                                     A: "Natasha Ravenova", B: "Natasha Romanova", C: "Natalia Ravenova", D: "Natalia Romanova",
                                     correctAnswer: "D"))
        return questionList
    }
    
    // Create Science Questions
    func createScienceQuestions() -> [Question] {
        var questionList: [Question] = []
        questionList.append(Question(question: "What is the fifth planet from the sun?",
                                     A: "Venus", B: "Jupiter", C: "Saturn", D: "Mercury",
                                     correctAnswer: "B"))
        questionList.append(Question(question: "What is the atomic number of oxygen?",
                                     A: "8", B: "9", C: "10", D: "16",
                                     correctAnswer: "A"))
        questionList.append(Question(question: "What is the greatest element in Earth's atmosphere?",
                                     A: "Oxygen", B: "Carbon Dioxide", C: "Nitrogen", D: "Argon",
                                     correctAnswer: "C"))
        return questionList
    }

    // Create Quizzes
    func createQuizList() -> [Quiz] {
        var quizList: [Quiz] = []
        quizList.append(Quiz(image: #imageLiteral(resourceName: "math"), subject: "Mathematics", description: "Are you a math wizard? Test your math skills!", questions: createMathQuestions()))
        quizList.append(Quiz(image: #imageLiteral(resourceName: "marvel"), subject: "Marvel Super Heroes", description: "How well do you know your favorite heroes?", questions: createMarvelQuestions()))
        quizList.append(Quiz(image: #imageLiteral(resourceName: "science"), subject: "Science", description: "Test your science knowledge, Einstein!", questions: createScienceQuestions()))
        
        return quizList
    }
    
    
}

extension ListScreen: UITableViewDataSource, UITableViewDelegate {
    // Get selected quiz
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedQuiz = quizzes[indexPath.row]
        variables.selectedQuiz = selectedQuiz
        variables.remainingQuestions = variables.selectedQuiz.questions
        performSegue(withIdentifier: "ShowQuestionSceneSegue", sender: tableView)
    }
    
    // Get number of rows of quizzes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    // Set quiz cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quiz = quizzes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizCell
        
        cell.setQuiz(quiz: quiz)
        return cell
    }
}
