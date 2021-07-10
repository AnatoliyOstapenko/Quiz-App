//
//  QuestionBrain.swift
//  Quiz App
//
//  Created by MacBook on 10.07.2021.
//

import Foundation

struct QuestionBrain {
    
    var questionNumber = 0
    
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
    
 
    
}
