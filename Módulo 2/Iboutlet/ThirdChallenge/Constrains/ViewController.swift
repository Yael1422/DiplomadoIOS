import UIKit

class ViewController: UIViewController {

    @IBAction func textFieldAction(_ sender: UITextField) {
        activeButton()
        //print(sender.text)
    }
    
    @IBAction func passwordViewAction(_ sender: UIButton) {
        TextFieldPassword.isSecureTextEntry.toggle()
    }
    
    @IBOutlet weak var TextFieldUserName: UITextField!
    @IBOutlet weak var TextFieldPassword: UITextField!
    @IBOutlet weak var buttonAspect: UIButton!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        if (TextFieldPassword.text == "Yael_Marzo" && TextFieldUserName.text == "Diplomado2024"){
           
            performSegue(withIdentifier: "openAccount", sender: nil)
            //prepare(for: UIStoryboardSegue, sender: nil)
        } else {
            let alert = UIAlertController(title: "Credenciales incorrectas", message: "Por favor, ingresa el usuario o contraseña correctos.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? SecondViewController {
            destinationViewController.name = TextFieldUserName.text!
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activeButton()
        TextFieldPassword.isSecureTextEntry = true
       
    }
    
    func activeButton(){
        if (TextFieldPassword.text == "" || TextFieldUserName.text == ""){
            buttonAspect.isEnabled = false
            buttonAspect.backgroundColor = .red
        } else{
            buttonAspect.isEnabled = true
            buttonAspect.backgroundColor = .green
        }
    }

}
