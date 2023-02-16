//
//  questionView.swift
//  Personality Quiz
//
//  Created by David Granger on 2/14/23.
//
var whichPageWeAreOn: Int = 1
var resultsArray: [Int] = [0, 0, 0, 0]
var lastButtonPressed: Int = 0

import UIKit

class questionView: UIViewController {
    
    var questionDictionary: [Int: String] = [11: "Brave and bold",
                                             12: "Calm and collected",
                                             13: "Creative and curious",
                                             14: "Reliable and Loyal",
                                             21: "Confront the problem head-on",
                                             22: "Take a step back and evaluate the situation",
                                             23: "Look for a creative solution",
                                             24: "Stay calm and support others",
                                             31: "I enjoy meeting new people and making new friends",
                                             32: "I prefer to stick with a close-knit group of friends",
                                             33: "I'm more of an introvert and enjoy my alone time",
                                             34: "I enjoy socializing, but I value my alone time as well",
                                             41: "The forest or jungle",
                                             42: "The ocean or beach",
                                             43: "The mountains or hills",
                                             44: "The plains or open fields",
                                             51: "Courage",
                                             52: "Intelligence",
                                             53: "Adaptability",
                                             54: "Loyalty"]
    
    var stringTheNumbering: [String] = ["1: ", "2: ", "3: ", "4: ", "5: "]
    var stringQuestion: [String] = ["Which of these best describes your personality?", "How do you typically react to stressful situations?", "How do you feel about socializing?", "What is your favorite environment to be in?", "Which of these characteristics do you value the most in yourself or others?"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if whichPageWeAreOn < 6 {
            firstQuestion.text = stringTheNumbering[0] + (questionDictionary[(whichPageWeAreOn * 10) + 1] ?? "")
            secondQuestion.text = stringTheNumbering[1] + (questionDictionary[(whichPageWeAreOn * 10) + 2] ?? "")
            thirdQuestion.text = stringTheNumbering[2] + (questionDictionary[(whichPageWeAreOn * 10) + 3] ?? "")
            fourthQuestion.text = stringTheNumbering[3] + (questionDictionary[(whichPageWeAreOn * 10) + 4] ?? "")
            titleLabel.text = stringQuestion[whichPageWeAreOn - 1]
            navigationItem.title = "Question " + stringTheNumbering[whichPageWeAreOn - 1]
        }
        whichPageWeAreOn += 1
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if whichPageWeAreOn > 5 && (identifier != "finishQuestions") {
            return false
        } else {
            return true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            whichPageWeAreOn -= 1
            resultsArray[lastButtonPressed - 1] -= 1
        }
    }
    
    
    @IBOutlet weak var fourthQuestion: UILabel!
    @IBOutlet weak var thirdQuestion: UILabel!
    @IBOutlet weak var secondQuestion: UILabel!
    @IBOutlet weak var firstQuestion: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBAction func oneButton(_ sender: UIButton) {
        resultsArray[0] += 1
        lastButtonPressed = 1
        checkIfLastQuestion()
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        resultsArray[1] += 1
        lastButtonPressed = 2
        checkIfLastQuestion()
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        resultsArray[2] += 1
        lastButtonPressed = 3
        checkIfLastQuestion()
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        resultsArray[3] += 1
        lastButtonPressed = 4
        checkIfLastQuestion()
    }
    
    func checkIfLastQuestion() {
        if whichPageWeAreOn >= 6 {
            performSegue(withIdentifier: "finishQuestions", sender: self)
        }
    }
    
}
