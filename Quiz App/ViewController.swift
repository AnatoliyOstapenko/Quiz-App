//
//  ViewController.swift
//  Quiz App
//
//  Created by MacBook on 08.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let quiz = [
        Questions(ask: "Four + Two is equal to Six", reply: "False"),
        Questions(ask: "Five + One is equal to Ten", reply: "False"),
        Questions(ask: "Two + Two is equal to Four", reply: "True")
    ]
    var questionNumber = 0

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let currentAnswer = sender.currentTitle
        let rightAnswer = quiz[questionNumber].reply
        
        if currentAnswer == rightAnswer {
            // changed the background color of pressed button
            sender.backgroundColor = UIColor.green
           
        } else {
            sender.backgroundColor = UIColor.red
            
        }
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        updateUI()
    }
    
    func updateUI() {
        mainLabel.text =  quiz[questionNumber].ask
    }
    
}

