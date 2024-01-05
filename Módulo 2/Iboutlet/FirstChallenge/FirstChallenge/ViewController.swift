//
//  ViewController.swift
//  FirstChallenge
//
//  Created by Diplomado on 30/09/23.
//

import UIKit

class ViewController: UIViewController {

    var lampIsOn = false
        
    @IBOutlet weak var lampOnImage: UIImageView!
    @IBOutlet weak var lampOffImage: UIImageView!
    @IBOutlet weak var lampButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLampState(isOn: false)
    }
    
    @IBAction func onOffButton(_ sender: UIButton) {
        // Cambia el estado de la lámpara al hacer clic en el botón
        lampIsOn.toggle()
        
        // Actualiza la interfaz de usuario según el estado actual
        setLampState(isOn: lampIsOn)
    }
    
    func setLampState(isOn: Bool) {
        if isOn {
            // La lámpara está encendida, cambia el fondo a blanco
            view.backgroundColor = .white
            lampButton.setTitle("💡 Apagar", for: .normal)
            lampOnImage.isHidden = false  // Muestra la imagen de lámpara encendida
            lampOffImage.isHidden = true
        } else {
            // La lámpara está apagada, cambia el fondo a negro
            view.backgroundColor = .black
            lampButton.setTitle("💡 Encender", for: .normal)
            lampOnImage.isHidden = true  // Muestra la imagen de lámpara encendida
            lampOffImage.isHidden = false
        }
    }


}

