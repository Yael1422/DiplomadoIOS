//
//  ViewController.swift
//  musicAlbum
//
//  Created by Gandhi Yael Puente Lopez on 18/10/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func labelTappedFirstAlbum(_ sender: UITapGestureRecognizer) {
        // Aquí es donde se ejecutará el código cuando se toque el label.
        // Puedes navegar a un nuevo view controller aquí.
        let nuevoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NuevoViewControllerIdentifier")
        navigationController?.pushViewController(nuevoViewController, animated: true)
    }
    
    @IBAction func labelTappedSecondAlbum(_ sender: UITapGestureRecognizer) {
        // Aquí es donde se ejecutará el código cuando se toque el label.
        // Puedes navegar a un nuevo view controller aquí.
        let nuevoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NuevoViewControllerIdentifier")
        navigationController?.pushViewController(nuevoViewController, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    

}

