//
//  GameViewModel.swift
//  RockPaperScissors
//
//  Created by Rafał Kwiatkowski on 29/11/2021.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {
	
	init(model: GameModel) {
		self.model = model
	}
	
    static private let opponentUnknownValue: String = "❔"

    @Published var playerOption: String? {
        didSet {
            model.updatePlayerSelection(playerOption)
        }
    }
    
    @Published var opponentOption: String = GameViewModel.opponentUnknownValue
    @Published var playerPoints: String = "Points: 0"
    @Published var opponentPoints: String = "Points: 0"
    @Published var buttonTitle: String = "Fight ⚔️"
    
    var possibleOptions: [String] {
        return model.allOptions.map { option in option.rawValue }
    }
    
    private let model: GameModel
    
    func fightPressed() {
        if case .fight = model.gamePhase {
            makeAFight()
        } else {
            reset()
        }
    }
    
    private func makeAFight() {
        model.updateOpponentSelection()
        opponentOption = model.opponentSelection?.rawValue ?? GameViewModel.opponentUnknownValue
        
        model.checkResult()

        playerPoints = formatPointsString(value: model.playerPoints)
        opponentPoints = formatPointsString(value: model.opponentPoints)
        buttonTitle = formatButtonTitle(gamePhase: model.gamePhase)
    }
    
    private func reset() {
        model.reset()
        buttonTitle = formatButtonTitle(gamePhase: model.gamePhase)
        playerOption = nil
        opponentOption = GameViewModel.opponentUnknownValue
    }
    
    private func formatPointsString(value: Int) -> String {
        return "Points: " + String(value)
    }
    
    private func formatButtonTitle(gamePhase: GamePhase) -> String {
        switch gamePhase {
        case .fight:
            return "Fight ⚔️"
        case .result(let gameResult):
            switch gameResult {
            case .win:
                return "You won 👑"
            case .tie:
                return "It's a tie 👔"
            case .lost:
                return "You lost 😭"
            }
        }
    }
}
