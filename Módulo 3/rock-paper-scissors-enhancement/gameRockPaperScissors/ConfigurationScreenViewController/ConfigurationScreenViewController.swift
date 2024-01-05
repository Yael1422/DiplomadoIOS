//
//  ConfigurationScreenViewController.swift
//  gameRockPaperScissors
//
//  Created by Diplomado on 14/10/23.
//

import UIKit

class ConfigurationScreenViewController: UIViewController {
    

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var gameSementedControl: UISegmentedControl!
    
    // stack round
    
    
    @IBOutlet weak var roundLabel: UILabel!
    
    
    @IBOutlet weak var roundSplider: UISlider!
    
    // stack point
    
    @IBOutlet weak var pointStack: UIStackView!
    @IBOutlet weak var winTextField: UITextField!
    @IBOutlet weak var loseTextField: UITextField!
    @IBOutlet weak var scoreWinTextField: UITextField!
    
    @IBOutlet weak var continueButton: UIButton!
    
    var state = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointStack.alpha = 0
        roundSplider.minimumValue = 1
        roundSplider.maximumValue = 5
        continueButton.isHidden = true
        roundLabel.text = "Rounds: 1"
        

        // Do any additional setup after loading the view.
    }

    
    

    @IBAction func gameSementedControlAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            pointStack.alpha = 0
            pointStack.isHidden = true
            
            roundLabel.alpha = 1
            
            roundSplider.alpha = 1
            //roundSplider.isHidden = true
            //print("---1")
          
        case 1:
            pointStack.alpha = 1
            pointStack.isHidden = false
            roundLabel.alpha = 0
            
            roundSplider.alpha = 0
            //roundSplider.isHidden = false
            //print("---2")
       
        default:
            
            pointStack.alpha = 0
            pointStack.isHidden = true
            
            roundLabel.alpha = 1
            
            roundSplider.alpha = 1
            
        }
        
        
    }
    
    @IBAction func infoViewAction(_ sender: Any) {
        
        //print("action")
        let infoViewController = InfoViewController()
        infoViewController.messageString = infoString
        present(infoViewController, animated: true)
        
    }
    
    @IBAction func nameTextFieldAction(_ sender: UITextField) {
        if ((nameTextField.text?.isEmpty) != nil){
            
            continueButton.isHidden = false
        }
        
        if(nameTextField.text?.count ?? 0 < 1){
            continueButton.isHidden = true
        }
        
    }
    
    
    
    @IBAction func roundSpliderAction(_ sender: UISlider) {
        let numberValue = Int(roundSplider.value)
        roundLabel.text = "Rounds: \(numberValue)"
        
    }
    
    
    @IBAction func continueButtonAction(_ sender: UIButton) {
        
        //print(gameSementedControl.selectedSegmentIndex)
        
        if(gameSementedControl.selectedSegmentIndex == 0){
            //print("por rondas")
            //print(roundSplider.value)
            
            
            guard let gameViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as? ViewController else { return }
                    
            gameViewController.title = "Game"
            gameViewController.gameSelectionState = .rounds
            gameViewController.name = nameTextField.text ?? "Error Name"
            gameViewController.round = Int(roundSplider.value)
            
            
                    
            
           
           navigationController?.pushViewController(gameViewController, animated: true)
            
            
            
        }
        
        if(gameSementedControl.selectedSegmentIndex == 1){
            
            
            
            //print("por partidas")
            //print(winTextField.text)
            guard let gameViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as? ViewController else { return }
                    
            gameViewController.title = "Game"
            gameViewController.gameSelectionState = .points
            gameViewController.name = nameTextField.text ?? "Error Name"
            
            
            
            gameViewController.round = Int(scoreWinTextField.text ?? "0") ?? 0
            gameViewController.addition = Int(winTextField.text ?? "0") ?? 0
            gameViewController.subtract = Int(loseTextField.text ?? "0") ?? 0
            
            
            
            
           
           navigationController?.pushViewController(gameViewController, animated: true)
            
        }
        
        
    }
    

}
