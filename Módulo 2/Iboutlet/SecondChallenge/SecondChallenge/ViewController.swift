//
//  ViewController.swift
//  SecondChallenge
//
//  Created by Diplomado on 30/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configura los valores iniciales de los sliders y la vista de color.
        redSlider.value = 0.0
        greenSlider.value = 0.0
        blueSlider.value = 0.0
        updateColorView()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        // Actualiza el valor de las etiquetas y la vista de color cuando se cambia un slider.
        updateColorView()
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // Restablece los sliders y la vista de color a sus valores iniciales.
        redSlider.value = 0.0
        greenSlider.value = 0.0
        blueSlider.value = 0.0
        updateColorView()
    }

    func updateColorView() {
        // Actualiza el color de fondo de la vista según los valores de los sliders.
        let redValue = CGFloat(redSlider.value)
        let greenValue = CGFloat(greenSlider.value)
        let blueValue = CGFloat(blueSlider.value)
        
        redLabel.text = String(format: "%.2f", redValue)
        greenLabel.text = String(format: "%.2f", greenValue)
        blueLabel.text = String(format: "%.2f", blueValue)
        
        colorView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }

}

