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
    
	private let model: GameModel

    @Published var playerOption: String? {
        didSet {
            model.updatePlayerSelection(playerOption)
        }
    }
    
    @Published var opponentOption: String = GameViewModel.opponentUnknownValue
    
    @Published var playerPoints: String = ""
    @Published var opponentPoints: String = ""
    
    var possibleOptions: [String] {
        return model.allOptions.map { option in option.rawValue }
    }
    
    func fightPressed() {
        model.makeMoveByOpponent()
        opponentOption = model.opponentSelection?.rawValue ?? GameViewModel.opponentUnknownValue
        model.checkResult()
        playerPoints = String(model.playerPoints)
        opponentPoints = String(model.opponentPoints)
    }
}
