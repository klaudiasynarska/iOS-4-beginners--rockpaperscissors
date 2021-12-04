//
//  GameModel.swift
//  RockPaperScissors
//
//  Created by Rafał Kwiatkowski on 29/11/2021.
//

import Foundation

protocol GameModel {
    var allOptions: [Symbol] { get }
    var playerPoints: Int { get }
    var opponentPoints: Int { get }
    var opponentSelection: Symbol? { get }
    func updatePlayerSelection(_ value: String?)
    func makeMoveByOpponent()
    func checkResult()
}

class RockPaperScissors: GameModel {
    
    var gamePhase: GamePhase = .fight
    var playerSelection: Symbol?
    var opponentSelection: Symbol?
    var playerPoints: Int = 0
    var opponentPoints: Int = 0
    
    var allOptions: [Symbol] {
        return Symbol.all
    }
    
    func updatePlayerSelection(_ value: String?) {
        if let value = value {
            playerSelection = Symbol(rawValue: value)
        } else {
            playerSelection = nil
        }
    }
    
    func makeMoveByOpponent() {
        opponentSelection = allOptions.randomElement()
    }
    
    func checkResult() {
        // calculate the result
        // and update players' points
        
        playerPoints += 1
        opponentPoints += 2
    }
}
