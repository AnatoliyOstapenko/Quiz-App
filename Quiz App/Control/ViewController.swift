//
//  ViewController.swift
//  Quiz App
//
//  Created by MacBook on 08.07.2021.
//

import UIKit


class ViewController: UIViewController {
    
    // initialized Timer class by variable timer added
    var timer = Timer()
    
    // initialized Sound class by variable timer added
    var sound = Sound()

    
    // QuestionBrain structure is initialized
    var questionBrain = QuestionBrain()
    
    // added variable currentSound to transfer to func plpaySound a true or false string
    var currentSound = "True"
    

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 1
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // transfered from button False or True (default label button names)
        // unwrapping current tittle of button with guard statement
        guard let currentAnswer = sender.currentTitle else {
            return
        }
        // initialize result of check answer from Question Brain structure
        // changed the background color of pressed button and sound plays
        if questionBrain.checkAnswer(answer: currentAnswer) {
            
            currentSound = "True"
            sender.backgroundColor = UIColor.green
           
        } else {
            
            currentSound = "False"
            sender.backgroundColor = UIColor.red
            
        }
        //initialize from QB loop for count up question in quiz array and countdown progress bar
        questionBrain.nextQuestion()

        //initilizaton of timer and fetched data to fair
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(counter), userInfo: nil, repeats: false)
        
        // play sound from Sound struct while true/false string trnsferred to Sound struct
        sound.playSound(currentSound)
        updateUI()
        
   

    }
    
    func updateUI() {
        // transfer a next question from QB struct and progress bar on screen
        mainLabel.text = questionBrain.getQuestionAsk()
        // get a current progress to show it on the screen
        progressBar.progress = questionBrain.progress
        
        
    }
    // counter created
    @objc func counter() {
        // when time is over triggered clear method
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear


    }

    
    
}

