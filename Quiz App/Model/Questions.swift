//
//  Questions.swift
//  Quiz App
//
//  Created by MacBook on 08.07.2021.
//
// Created a new swift file Question clicking on the folder Quiz App
// new file is needed to place our structure with questions
import Foundation
struct Questions {
    let ask: String
    let reply: [String]
    let correctAnswer: String
    
    init(ask: String, reply: [String], correctAnswer: String) {
        self.ask = ask
        self.reply = reply
        self.correctAnswer = correctAnswer
    }
}

