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
	
	private let model: GameModel

    @Published var playerOption: String? {
        didSet {
            model.updatePlayerOneSelection(playerOption)
        }
    }
    
    @Published var playerPoints: String = ""
    @Published var opponentPoints: String = ""
    
    var possibleOptions: [String] {
        return model.allOptions.map { option in option.rawValue }
    }
    
    func fightPressed() {
        model.makeMoveByPlayerTwo()
        model.checkResult()
        playerPoints = String(model.playerOnePoints)
        opponentPoints = String(model.playerTwoPoints)
    }
}
