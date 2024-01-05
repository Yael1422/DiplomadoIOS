//
//  GameLogic.swift
//  gameRockPaperScissors
//
//  Created by Diplomado on 21/10/23.
//

import Foundation

enum gameMode{
    case rounds
    case points
}

enum gameState:String {
case win = "Ganaste"
case lose = "Perdiste"
case tied = "Empate"
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

var infoString = """

Información

Es un juego en el que el jugador debe elegir una de tres opciones. Piedra, papel o tijeras.

1) La piedra vence a las tijeras.
2) Las tijeras vencen al papel.
3) El papel vence a la piedra.
4) Si son iguales, es un empate.

Realizado por:

Puente López Gandhi Yael
"""

