//
//  GameModel.swift
//  RockPaperScissors
//
//  Created by Rafał Kwiatkowski on 29/11/2021.
//

import Foundation

protocol GameModel {
	// Define common protocol
}

class RockPaperScissors: GameModel {
	// Implement model
    
    var gamePhase: GamePhase = .fight
    var playerOneSelection: Symbol?
    var playerTwoSelection: Symbol?
}
