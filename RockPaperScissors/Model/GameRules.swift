//
//  GameRules.swift
//  RockPaperScissors
//
//  Created by Klaudia Synarska on 04/12/2021.
//

import Foundation

struct Points {
    let playerPoints: Int
    let opponentPoints: Int
    let result: GameResult
}

protocol GameRules {
    func calculate(playerOption: Symbol, opponentOption: Symbol) -> Points
}

class StandardRules: GameRules {
    func calculate(playerOption: Symbol, opponentOption: Symbol) -> Points {
        if playerOption == opponentOption {
            return Points(playerPoints: 0, opponentPoints: 0, result: .tie)
        }

        if playerOption < opponentOption {
            return Points(playerPoints: 0, opponentPoints: 1, result: .lost)
        }
        
        return Points(playerPoints: 1, opponentPoints: 0, result: .win)
    }
}
