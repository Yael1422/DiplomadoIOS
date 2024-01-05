//
//  ViewController.swift
//  gameRockPaperScissors
//
//  Created by Diplomado on 14/10/23.
//

import UIKit

enum GameResult {
    case win
    case lose
    case tied
}

enum GameType {
    case rounds
    case points
}

class ViewController: UIViewController {
    
    @IBOutlet weak var user1Label: UILabel!
    @IBOutlet weak var user1GameLabel: UILabel!
    
    @IBOutlet weak var user2Label: UILabel!
    @IBOutlet weak var user2GameLabel: UILabel!
    
    @IBOutlet weak var ResetGameButton: UIButton!
    
    @IBAction func resetGameButtonAction(_ sender: UIButton) {
        resetGame()
    }

    
    
    var round = 0
    var counterUser = 0
    var counterCPU = 0
    var userName: String = ""
    var gameType: GameType = .rounds // Por defecto, el juego es por rondas
    var winValue = 0
    var loseValue = 0
    var scoreWinValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        user2Label.text = "\(userName): 0"
        user1Label.text = "CPU: 0"
        
    }
    
    func setPointValues(_ win: Int, _ lose: Int, _ scoreWin: Int) {
        winValue = win
        loseValue = lose
        scoreWinValue = scoreWin
    }
    
    @IBAction func gameButtonAction(_ sender: UIButton) {
        
        let user2Selection: String
        let user1Selection = randomSelectionHand()
        
        switch sender.tag {
        case 0:
            user2Selection = "👊🏻"
            user2GameLabel.text = user2Selection
        case 1:
            user2Selection = "✌🏻"
            user2GameLabel.text = user2Selection
        case 2:
            user2Selection = "✋🏻"
            user2GameLabel.text = user2Selection
        default:
            return
        }
        
        var gameResult: GameResult
        
        if user1Selection == user2Selection {
            gameResult = .tied
        } else if (user2Selection == "👊🏻" && user1Selection == "✌🏻") ||
                  (user2Selection == "✌🏻" && user1Selection == "✋🏻") ||
                  (user2Selection == "✋🏻" && user1Selection == "👊🏻") {
            gameResult = .win
        } else {
            gameResult = .lose
        }
        
        if gameType == .rounds {
            handleRoundsGame(gameResult)
        } else if gameType == .points {
            handlePointsGame(gameResult)
        }
        
        user1GameLabel.text = user1Selection
        
        updateUIWithResult(gameResult)
    }
    
    func handleRoundsGame(_ result: GameResult) {
        
        if result == .win {
            counterUser += 1
            user2Label.text = "\(userName): \(counterUser)"
        } else if result == .lose {
            counterCPU += 1
            user1Label.text = "CPU: \(counterCPU)"
        }
        
        if counterUser == 5 {
            let alert = UIAlertController(
                title: "¡Ganaste!",
                message: "Ganaste \(userName)",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
        } else if counterCPU == 5 {
            let alert = UIAlertController(
                title: "¡Perdiste :(!",
                message: "Ganó la CPU",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else if counterCPU > 5 || counterUser > 5 {
            let alert = UIAlertController(
                title: "¡Reinicia",
                message: "Reinicia el juego, acabaron las rondas",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }

    func handlePointsGame(_ result: GameResult) {
        // Lógica para el juego por puntos
        // Actualizar los valores de puntuación y mostrarlos en las etiquetas
        // Verificar si se alcanzó la puntuación ganadora y mostrar alerta si es necesario.
    }
        
    func randomSelectionHand() -> String {
        // Genera una selección aleatoria para la CPU
        let random = Int.random(in: 0...2)
        switch random {
        case 0:
            return "👊🏻"
        case 1:
            return "✌🏻"
        case 2:
            return "✋🏻"
        default:
            return ""
        }
        
    }

    func updateUIWithResult(_ result: GameResult) {
        switch result {
        case .win:
            view.backgroundColor = .green
        case .lose:
            view.backgroundColor = .red
        case .tied:
            view.backgroundColor = .brown
        }
    }
    
    func resetGame() {
        round = 0
        counterUser = 0
        counterCPU = 0
        user1Label.text = "CPU: 0"
        user2Label.text = "\(userName): 0"
        user2GameLabel.text = "" // Reinicia la selección del usuario
        user1GameLabel.text = "" // Reinicia la selección de la CPU
        view.backgroundColor = .gray // Restablece el color de fondo
    }
    
}

