//
//  ViewController.swift
//  gameRockPaperScissors
//
//  Created by Diplomado on 14/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var user1Label: UILabel!
    @IBOutlet weak var user1GameLabel: UILabel!
    
    @IBOutlet weak var user2Label: UILabel!
    @IBOutlet weak var user2GameLabel: UILabel!
    
    @IBOutlet weak var gameButtonStack: UIStackView!
    
    @IBOutlet weak var nextTurnButton: UIButton!
    @IBOutlet weak var ResetGameButton: UIButton!
    
    
    var round = 0
    var counter = 0
    var name = ""
    var gameSelectionState = gameMode.rounds
    var historiRound = [gameState]()
    var historiSelection = [(hand,hand)]()
    var addition = 0
    var subtract = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        user1GameLabel.text = "🤖"
        user2GameLabel.text = "👤"
        user1Label.text = "Rounds: \(counter)"
        user2Label.text = "Player:\(name)"
        nextTurnButton.isHidden = true
        ResetGameButton.isHidden = true
        
        
        if(gameSelectionState == .points){
            user1Label.text = "winPoints: \(addition) subtraction:\(subtract) Points: \(round)"
            
        }
    }
    
    @IBAction func gameButtonAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            
            user2GameLabel.text = "✋"
            
            let randomSelection = randomSelectionHand()
            user1GameLabel.text = randomSelection.rawValue
            
            let gameResult = Game(selection: hand(rawValue: user2GameLabel.text!)!, randomSelection: randomSelection)
            GameResultColor(resultGame:gameResult)
            
            historiRound.append(gameResult)
            historiSelection.append((hand.paper,randomSelection))
            
            
            
            
        case 1:
            
            user2GameLabel.text = "✌️"
            let randomSelection = randomSelectionHand()
            user1GameLabel.text = randomSelection.rawValue
            
            let gameResult = Game(selection: hand(rawValue: user2GameLabel.text!)!, randomSelection: randomSelection)
            GameResultColor(resultGame:gameResult)
            
            historiRound.append(gameResult)
            historiSelection.append((hand.scissors,randomSelection))
            
        case 2:
            
            user2GameLabel.text = "👊"
            let randomSelection = randomSelectionHand()
            user1GameLabel.text = randomSelection.rawValue
            
            let gameResult = Game(selection: hand(rawValue: user2GameLabel.text!)!, randomSelection: randomSelection)
            GameResultColor(resultGame:gameResult)
            
            historiRound.append(gameResult)
            historiSelection.append((hand.rock,randomSelection))
            
        default:
            user2GameLabel.text = "❌"
            user1GameLabel.text = "❌"
            
        }
        gameButtonStack.isHidden = true
        nextTurnButton.isHidden = false
        
        if( gameSelectionState ==  .rounds ){
            counter = 0
            for x in historiRound {
                if(x == .win){counter = counter + 1}
                
            }
            
            user1Label.text = "Rounds: \(counter)"
            if(counter > round){
                user2Label.text = "You won \(name)"
                ResetGameButton.isHidden = false
                nextTurnButton.isHidden = true
            }
        }
        
        if( gameSelectionState ==  .points ){
            counter = 0
            for x in historiRound {
                if(x == .win){counter = counter + addition}
                if(x == .lose){
                    if(counter > 0){
                        counter = counter - subtract
                    }
                }
                
            }
            
            user2Label.text = "Points: \(counter)"
            if(counter >= round){
                
                user2Label.text = "You won \(name)"
                ResetGameButton.isHidden = false
                nextTurnButton.isHidden = true
            }
        }
        
        
        
    }
    
    func GameResultColor(resultGame:gameState){
        switch resultGame {
        case .win:
            view.backgroundColor = .green
        case .lose:
            view.backgroundColor = .red
        case .tied:
            view.backgroundColor = .brown
            
        }
        
    }
    
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        gameButtonStack.isHidden = false
        user1GameLabel.text = "🤖"
        user2GameLabel.text = "👤"
        view.backgroundColor = .white
        
        
        
    }
    
    
    @IBAction func resetButtonAction(_ sender: UIButton) {
        gameButtonStack.isHidden = false
        user1GameLabel.text = "🤖"
        user2GameLabel.text = "👤"
        counter = 0

        user1Label.text = "Rounds: \(counter)"
                user2Label.text = "Player:\(name)"
        view.backgroundColor = .white
        historiRound.removeAll()
        ResetGameButton.isHidden = true
        
        
        
    }
    
    
    @IBAction func historyAction(_ sender: UIButton) {
        var temporalText = "History\n\n"
        if(gameSelectionState == .points){
            for x in historiRound{
                
                switch x {
                case .win:
                    temporalText += "win + \(addition)\n"
                case .lose:
                    temporalText += "lose - \(subtract)\n"
                case .tied:
                    temporalText += "tied + 0\n"
                
                }
            }
        }
        
        if(gameSelectionState == .rounds){
            for x in historiRound{
                
                switch x {
                case .win:
                    temporalText += "win \n"
                case .lose:
                    temporalText += "lose \n"
                case .tied:
                    temporalText += "tied \n"
                
                }
            }
        }
        
        performSegue(withIdentifier: "segueHistory", sender: nil)
        
        //let infoViewController = InfoViewController()
        //infoViewController.messageString = temporalText
        /*
        let histView = HistoryViewController()
        histView.model = TableViewModel()
        histView.model.equalArray(tempArray: historiRound)
        present(histView, animated: true)
        */
        //print(historiRound)
        //historiRound
        //present(infoViewController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        let  historyViewController = segue.destination as! HistoryViewController
            //historyViewController.model = TableViewModel()
            historyViewController.model.equalArray(tempArray: historiRound)
        historyViewController.model.equalArrayHans(tempArray: historiSelection)
        
        print(historyViewController.model.rowsArray)
        
        
            
        
    }
    
}



