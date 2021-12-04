//
//  GameModel.swift
//  RockPaperScissors
//
//  Created by Rafał Kwiatkowski on 29/11/2021.
//

import Foundation

protocol GameModel {
    var allOptions: [Option] { get }
    var playerPoints: Int { get }
    var opponentPoints: Int { get }
    var opponentSelection: Option? { get }
    var gamePhase: GamePhase { get }

    func updatePlayerSelection(_ value: String?)
    func updateOpponentSelection()
    func checkResult()
    func reset()
}

class RockPaperScissors: GameModel {
    
    var gamePhase: GamePhase = .fight
    var playerSelection: Option?
    var opponentSelection: Option?
    var playerPoints: Int = 0
    var opponentPoints: Int = 0
    
    var allOptions: [Option] {
        return Option.all
    }
    
    init(gameRules: GameRules = StandardRules()) {
        self.gameRules = gameRules
    }
    
    private let gameRules: GameRules
    
    func updatePlayerSelection(_ value: String?) {
        if let value = value {
            playerSelection = Option(rawValue: value)
        } else {
            playerSelection = nil
        }
    }
    
    func updateOpponentSelection() {
        opponentSelection = allOptions.randomElement()
    }
    
    func checkResult() {
        guard let playerSelection = playerSelection,
              let opponentSelection = opponentSelection else {
            return
        }

        let points = gameRules.calculate(playerOption: playerSelection, opponentOption: opponentSelection)
        
        playerPoints += points.playerPoints
        opponentPoints += points.opponentPoints
        gamePhase = .result(points.result)
    }
    
    func reset() {
        gamePhase = .fight
        playerSelection = nil
        opponentSelection = nil
    }
}
