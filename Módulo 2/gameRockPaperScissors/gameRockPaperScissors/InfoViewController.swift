//
//  InfoViewController.swift
//  gameRockPaperScissors
//
//  Created by Diplomado on 20/10/23.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var textView: UITextView = {
        let textView = UITextView()
        // importate
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        return textView
    }()
    
    private func setElement() {
        view.addSubview(textView)
       
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            textView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            textView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.8)
            
           
            
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElement()
        view.backgroundColor = .white
        textView.text = """

Reglas del Juego "Piedra, Papel o Tijera"

Objetivo del juego: El objetivo del juego es vencer a tu oponente eligiendo una de las tres opciones posibles: Piedra, Papel o Tijera.

1. Reglas básicas:
    a. La Piedra aplasta las Tijeras.
    b. Las Tijeras cortan el Papel.
    c. El Papel cubre la Piedra.
    d. Empate si ambos jugadores eligen la misma opción

2. Cómo se juega:
    a. Los jugadores eligen una de las tres opciones (Piedra, Papel o Tijera).
    d. El ganador se determina según las reglas básicas (punto 1).

3. Consejos adicionales:
    a. El juego se basa en la estrategia y la anticipación. Intenta adivinar lo que tu oponente elegirá.

4. ¡Diviértete! El juego es simple pero entretenido. ¡Disfruta y compite de manera amigable!

Realizado por:
Puente López Gandhi Yael
"""
        
        textView.isEditable = false
        
    }
}

extension InfoViewController : UITextViewDelegate{
}
