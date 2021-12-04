//
//  Option.swift
//  RockPaperScissors
//
//  Created by Klaudia Synarska on 02/12/2021.
//

import Foundation

enum Option: String {
    case rock = "🪨"
    case paper = "📜"
    case scissors = "✂️"
    
    static var all: [Option] {
        return [.rock, .paper, .scissors]
    }
}

extension Option: Comparable {
    static func < (lhs: Option, rhs: Option) -> Bool {
        switch (lhs, rhs) {
        case (.scissors, .rock), (.paper, .scissors), (.rock, .paper):
            return true
        default:
            return false
        }
    }
}
