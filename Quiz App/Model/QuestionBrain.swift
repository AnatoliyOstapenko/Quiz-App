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
    var score = 0
    
    let quiz = [
         Questions(ask: "Which is the largest organ in the human body?", reply: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                Questions(ask: "Five dollars is worth how many nickels?", reply: ["25", "50", "100"], correctAnswer: "100"),
                Questions(ask: "What do the letters in the GMT time zone stand for?", reply: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                Questions(ask: "What is the French word for 'hat'?", reply: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                Questions(ask: "In past times, what would a gentleman keep in his fob pocket?", reply: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
    ]
    
    
    
    // set func to check user answer from View with answer in Model
    mutating func checkAnswer(answer userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }

    func getQuestionAsk() -> String {
       // invoked quetsion from array above
       return quiz[questionNumber].ask
    }
    
    
    // create 3 fuctions to transfer 3 reply variants to buttons in View 
    
    func replyOne() -> String {
        return quiz[questionNumber].reply[0]
    }
    func replyTwo() -> String {
        return quiz[questionNumber].reply[1]
    }
    func replyThree() -> String {
        return quiz[questionNumber].reply[2]
    }
    
    mutating func nextQuestion() {
        // it's loop for count up question in quiz array and countdown of progress bar
        if questionNumber + 1 < quiz.count {
            progress -= 1 / Float(quiz.count)
            questionNumber += 1

        } else {
            questionNumber = 0
            progress = 1
            score = 0
        }
    
    
    }

    
    func getScore() -> Int {
        return score
    }
 
    
}
