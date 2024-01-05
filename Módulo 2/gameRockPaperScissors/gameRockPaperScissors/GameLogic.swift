 //
//  GameLogic.swift
//  gameRockPaperScissors
//
//  Created by Diplomado on 21/10/23.
//

import Foundation


enum gameState {
case win
case lose
case tied
}

enum hand:String {
    case rock = "👊"
    case paper = "✋"
    case scissors = "✌️"
}

// Logica del juego
func Game(selection: hand , randomSelection: hand) -> gameState  {
    
    
    switch selection {
    case .rock:
        switch randomSelection {
        case .paper:
            return gameState.lose
        case .scissors:
            return gameState.win
            
        case .rock:
            return gameState.tied
        }
    case .paper:
        switch randomSelection {
        case .scissors:
            return gameState.lose
        case .rock:
            return gameState.win
            
        case .paper:
            return gameState.tied
        }
    case .scissors:
        switch randomSelection {
        case .rock:
            return gameState.lose
        case .paper:
            return gameState.win
            
        case .scissors:
            return gameState.tied
        }
   
    }
    
}

func randomSelectionHand() -> hand {
    let numberRandon = Int.random(in: 0..<3)
    switch numberRandon {
    case 0:
        return hand.rock
    case 1:
        return hand.paper
    case 2:
        return hand.scissors
    default:
        return hand.rock
    }
    
}



