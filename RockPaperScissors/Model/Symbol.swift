//
//  Symbol.swift
//  RockPaperScissors
//
//  Created by Klaudia Synarska on 02/12/2021.
//

import Foundation

enum Symbol: String {
    case rock = "🪨"
    case paper = "📜"
    case scissors = "✂️"
    
    static var all: [Symbol] {
        return [.rock, .paper, .scissors]
    }
}
