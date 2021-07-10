//
//  QuestionBrain.swift
//  Quiz App
//
//  Created by MacBook on 10.07.2021.
//

import Foundation

struct QuestionBrain {
    
    var questionNumber = 0
    var progress: Float = 1
    
    let quiz = [
        Questions(ask: "Four + Two is equal to Six", reply: "False"),
        Questions(ask: "Five + One is equal to Ten", reply: "False"),
        Questions(ask: "Two + Two is equal to Four", reply: "True")
    ]
    
    
    
    // set func to check user answer from View with answer in Model
    func checkAnswer(answer correctAnswer: String) -> Bool {
        if correctAnswer == quiz[questionNumber].reply {
            return true
        } else {
            return false
        }
    }
    
    func getQuestionAsk() -> String {
       // invoked quetsion from array above
       return quiz[questionNumber].ask
    }
    
    mutating func nextQuestion() {
        // it's loop for count up question in quiz array and countdown progress bar
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            progress -= 1 / Float(quiz.count)

        } else {
            questionNumber = 0
            progress = 1

        }
        print("QB: questionNumber \(questionNumber)")
        print("QB: progress \(progress)")
    }
 
    
}
