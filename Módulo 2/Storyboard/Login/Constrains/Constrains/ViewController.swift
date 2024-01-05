//
//  ViewController.swift
//  Constrains
//
//  Created by Manuel Sánchez on 22/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func passwordViewAction(_ sender: UIButton) {
        TextFieldPassword.isSecureTextEntry.toggle()
    }
    @IBOutlet weak var TextFieldUserName: UITextField!
    @IBOutlet weak var TextFieldPassword: UITextField!
    
    @IBOutlet weak var buttonAspect: UIButton!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "openAccount", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

