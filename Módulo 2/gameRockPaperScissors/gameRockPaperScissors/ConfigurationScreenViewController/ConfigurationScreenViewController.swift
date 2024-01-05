import UIKit


protocol ConfigurationScreenDelegate: AnyObject {
    func didSelectRounds(_ rounds: Int)
}


class ConfigurationScreenViewController: UIViewController {
    
    var selectedRounds: Int = 1
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var gameSementedControl: UISegmentedControl!
    
    
    @IBOutlet weak var roundLabel: UILabel!
    
    
    @IBOutlet weak var roundSplider: UISlider!
   
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
          
        case 1:
            pointStack.alpha = 1
            pointStack.isHidden = false
            roundLabel.alpha = 0
            roundSplider.alpha = 0
       
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
        selectedRounds = Int(roundSplider.value)
        roundLabel.text = "Rondas: \(selectedRounds)"
    }
    
    
    @IBAction func continueButtonAction(_ sender: UIButton) {
        
        guard let gameViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as? ViewController else { return }
                    
        gameViewController.title = "Game"
        gameViewController.userName = nameTextField.text ?? ""
            
        if gameSementedControl.selectedSegmentIndex == 0 {
            gameViewController.round = selectedRounds
            gameViewController.round = Int(roundSplider.value)
            gameViewController.gameType = .rounds
        } else if gameSementedControl.selectedSegmentIndex == 1 {
            let winValue = Int(winTextField.text ?? "") ?? 0
            let loseValue = Int(loseTextField.text ?? "") ?? 0
            let scoreWinValue = Int(scoreWinTextField.text ?? "") ?? 0
            gameViewController.setPointValues(winValue, loseValue, scoreWinValue)
            gameViewController.gameType = .points
        }
            
        navigationController?.pushViewController(gameViewController, animated: true)
    
    }
    

    
    
}
