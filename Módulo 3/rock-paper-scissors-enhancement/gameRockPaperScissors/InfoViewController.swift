//
//  InfoViewController.swift
//  gameRockPaperScissors
//
//  Created by Diplomado on 20/10/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    var messageString = ""

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
            textView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
            
           
            
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElement()
        view.backgroundColor = .white
        textView.text = messageString
        
        
        textView.isEditable = false
        
    }
    


}


extension InfoViewController : UITextViewDelegate{
    
    
    
}
