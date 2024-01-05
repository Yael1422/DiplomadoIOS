//
//  ViewController.swift
//  MyFirstApp22sep2023
//
//  Created by Diplomado on 22/09/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var photoTypeSwitch: UISwitch!
    
    @IBOutlet weak var titleTextField: UITextField!{
        didSet{
            titleTextField.delegate = self
        }
    }
    
    @IBAction func photoTypeSwitchValueChange(_ sender: UISwitch) {
        
        sender.isOn ? nextButton.setTitle("Cats", for: .normal):nextButton.setTitle("Dogs", for: .normal)
    }
    
    @IBOutlet weak var switchStateTitle: UISwitch!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var titleTextFieldEditingChanged: UILabel!
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton){
        print(photoTypeSwitch.isOn)
        
        if sender.tag == 0 {
            segueToInfo()
        }else{
            segueToPhotos()
        }
    }
    
    func segueToInfo () {
        let infoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoViewController")
        infoViewController.title = "Info"
                navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    func segueToPhotos () {
        guard let photosViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageStackViewController") as? ImageStackViewController else { return }
        photosViewController.showCat = photoTypeSwitch.isOn
        if (switchStateTitle.isOn == true){
            photosViewController.title = titleTextFieldEditingChanged.text
        }
        navigationController?.pushViewController(photosViewController, animated: true)
    }
    
    
    @IBAction func titleTextFielEditingChanged(_ sender: UITextField) {
        
        titleTextFieldEditingChanged.text = sender.text
    }
 
    
    
    
    
    @IBAction func SwitchLabel(_ sender: UISwitch) {
        if !sender.isOn{
            titleTextFieldEditingChanged.text = "custom title not selected"
        }else{
            titleTextFieldEditingChanged.text = titleTextField.text
        }
    }
    
    
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        print("1")
//    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("2")
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("3")
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("4")
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("5")
//    }
}





extension MainViewController: UITextFieldDelegate{
    
    
   
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (switchStateTitle.isOn == false){
            return false
        }
        
        
        if string == "" {return true}
        if string.rangeOfCharacter(from: .alphanumerics) == nil && string != " " {
            return false
        }else{
            return (textField.text?.count ?? 0) + string.count - range.length <= 10
        }
    }
    
}
// "custom title not selected"
