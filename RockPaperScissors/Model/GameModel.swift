//
//  GameModel.swift
//  RockPaperScissors
//
//  Created by Rafał Kwiatkowski on 29/11/2021.
//

import Foundation

protocol GameModel {
    var allOptions: [Symbol] { get }
    var playerOnePoints: Int { get }
    var playerTwoPoints: Int { get }
    func updatePlayerOneSelection(_ value: String?)
    func makeMoveByPlayerTwo()
    func checkResult()
}

class RockPaperScissors: GameModel {
    
    var gamePhase: GamePhase = .fight
    var playerOneSelection: Symbol?
    var playerTwoSelection: Symbol?
    var playerOnePoints: Int = 0
    var playerTwoPoints: Int = 0
    
    var allOptions: [Symbol] {
        return Symbol.all
    }
    
    func updatePlayerOneSelection(_ value: String?) {
        if let value = value {
            playerOneSelection = Symbol(rawValue: value)
        } else {
            playerOneSelection = nil
        }
    }
    
    func makeMoveByPlayerTwo() {
        playerTwoSelection = allOptions.randomElement()
    }
    
    func checkResult() {
        // calculate the result
        // and update players' points
        
        playerOnePoints += 1
        playerTwoPoints += 2
    }
}
