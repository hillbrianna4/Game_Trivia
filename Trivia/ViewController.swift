//
//  ViewController.swift
//  Trivia
//
//  Created by Brianna Hill 2/18/2025
//

import Foundation
import UIKit
class ViewController: UIViewController{
    @IBOutlet weak var numQuestions: UILabel!
    @IBOutlet weak var categoryType: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    let questionSet = [
        TriviaQuestion(category: "Game: Final Fantasy", question: "Which animal is in every Final Fantasy game", answers: ["Chicken","Dog", "Pikachu", "Chocobo"], correctAnswer: "Chocobo"),
        TriviaQuestion(category: "Game: Animal Crossing", question: "Which of the following are not Villagers in animal crossing?", answers: ["Melba", "Cornelius", "Tank", "Chevre"], correctAnswer: "Cornelius"),
        TriviaQuestion(category: "Game: Persona 5?", question: "Who is not a character in Persona 5?", answers: ["Naruto", "Morgana", "Akechi", "Futaba"], correctAnswer: "Naruto"),
        TriviaQuestion(category: "Game: Outlast", question: "Which outlast game takes place in Arizona?", answers: ["Outlast","Outlast: the whistleblower","Outlast 2","Five nights at freddy's"], correctAnswer: "Outlast 2"),
        TriviaQuestion(category: " Game: Fallout", question: "Which fallout game takes place in Vegas?", answers: ["Fallout 4", "Fallout: New Vegas", "Fallout 76", "Fallout 2"], correctAnswer: "Fallout: New Vegas")
    ]
    var numCorrectScore = 0
    var currQuestion = 0
    
    

    func displayQuestion(){
        if currQuestion < questionSet.count{
            numQuestions.text = "Question: \(currQuestion+1)/\(questionSet.count)"
            categoryType.text = questionSet[currQuestion].category
            question.text = questionSet[currQuestion].question
            button1.setTitle(questionSet[currQuestion].answers[0], for: .normal)
            button2.setTitle(questionSet[currQuestion].answers[1], for: .normal)
            button3.setTitle(questionSet[currQuestion].answers[2], for: .normal)
            button4.setTitle(questionSet[currQuestion].answers[3], for: .normal)
            
        }
    }
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if sender.currentTitle == questionSet[currQuestion].correctAnswer {
            numCorrectScore += 1
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.backgroundColor = UIColor.clear
            
            
            //Change the question if there are any, else display final score
            if self.currQuestion < self.questionSet.count - 1 {
                self.currQuestion += 1
                self.displayQuestion()
            } else {
                let alert = UIAlertController(title: "Quiz Complete", message: "Your score is \(self.numCorrectScore)/\(self.questionSet.count).", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
    }
}
