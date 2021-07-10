//
//  ViewController.swift
//  Quiz App
//
//  Created by MacBook on 08.07.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // initialized Timer class by variable timer added
    var timer = Timer()
    // audio player variable created from AVFoundation
    var audioPlayer = AVAudioPlayer()
    
    let quiz = [
        Questions(ask: "Four + Two is equal to Six", reply: "False"),
        Questions(ask: "Five + One is equal to Ten", reply: "False"),
        Questions(ask: "Two + Two is equal to Four", reply: "True")
    ]
    var questionNumber = 0
    var progress: Float = 1
    var sound = "True"

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = progress
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // transfered from button False or True (default label button names)
        // // unwrapping current tittle of button with guard statement
        guard let currentAnswer = sender.currentTitle else {
            return
        }
        //retrieve answer from quiz array
        let rightAnswer = quiz[questionNumber].reply
        
        // changed the background color of pressed button
        if currentAnswer == rightAnswer {
            
            sound = "True"
            sender.backgroundColor = UIColor.green
           
        } else {
            
            sound = "False"
            sender.backgroundColor = UIColor.red
            
        }
        // it's loop for count up question in quiz array and countdown progress bar
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            progress -= 1 / Float(quiz.count)

        } else {
            questionNumber = 0
            progress = 1

        }
       
        //initilizaton of timer and fetched data to fair
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(counter), userInfo: nil, repeats: false)
        
        updateUI()
        playSound(pressedButton: sound)
    }
    
    func updateUI() {
        // transfer a next question and progress bar on screen
        mainLabel.text =  quiz[questionNumber].ask
        
     
        
    }
    // counter created
    @objc func counter() {
        // when time is over triggered clear method
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear


    }
    func playSound(pressedButton: String) {
        
        //  create URL session
        //  change a name tittle to pressedButton
        let url = Bundle.main.url(forResource: pressedButton, withExtension: "wav")
        
        //  url became optional, so I have to unwrap url, I use guard (it's shortage way)
        guard url != nil else {
            return
        }
        // Create the audio player and play the a sound from url session
        // transfer to variable URL session, add try, and add do - carch block
        // also I have to add exclamation mark to url
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.play()
            
        } catch {
            print("error popped up, let's RFM again")
        }
    }
    
    
}

