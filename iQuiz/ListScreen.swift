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

struct quiz: Decodable {
    let title: String
    let desc: String
    let questions: [question]
}

struct question: Decodable {
    let text: String
    let answer: String
    let answers: [String]
}

class ListScreen: UIViewController {
    var quizzes: [Quiz] = []
    let storage = UserDefaults.standard
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        variables.score = 0
        
        if Reachability.isConnectedToNetwork() {
            print("Internet Connection Available!")
            self.downloadData()
        } else {
            print("Internet Connection not Available!")
            self.populateQuizzes(data: self.storage.object(forKey: "jsonQuiz") as! Data)
        }
    }
    
    // Download json data online
    func downloadData() {
        let jsonUrl = "https://tednewardsandbox.site44.com/questions.json"
        guard let url = URL(string: jsonUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            self.storage.set(data, forKey: "jsonQuiz")
            self.populateQuizzes(data: data)
        }.resume()
    }
    
    // Populate quiz app from json data
    func populateQuizzes(data: Data) {
        var quizzes: [Quiz] = []
        do {
            let jsonQuiz = try
                JSONDecoder().decode([quiz].self, from: data)
            for quiz in jsonQuiz {
                var questionList: [Question] = []
                for question in quiz.questions {
                    questionList.append(Question(question: question.text,
                                                 answers: question.answers,
                                                 correctAnswer: question.answer))
                }
                quizzes.append(Quiz(image: #imageLiteral(resourceName: "math"), subject: quiz.title, description: quiz.desc, questions: questionList))
                self.quizzes = quizzes
            }
        } catch let jsonErr {
            print ("Error serializing json:", jsonErr)
        }
    }
    
    // No internet connection alert
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !Reachability.isConnectedToNetwork() {
            let alert = UIAlertController(title: "No Internet Connection", message: "Go online to update quizzes", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            present(alert, animated: true, completion: nil)
        }
    }

    // Settings
    @IBAction func settingsButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        alert.addAction(UIAlertAction(title: "Check now", style: .default, handler: { action in
            var alertMessage: String
            if Reachability.isConnectedToNetwork() {
                self.downloadData()
                self.tableView.reloadData()
                alertMessage = "You are connected. Quizzes updated."
            } else {
                alertMessage = "Error downloading data. Try again with connection."
            }
            let alert2 = UIAlertController(title: "Connection Status", message: alertMessage, preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
            self.present(alert2, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
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
