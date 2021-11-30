//
//  GameViewModel.swift
//  RockPaperScissors
//
//  Created by Rafał Kwiatkowski on 29/11/2021.
//

import Foundation

class GameViewModel: ObservableObject {
	
	init(model: GameModel) {
		self.model = model
	}
	
	private let model: GameModel
	@Published var playerOption: String?
	
}
