//
//  TwitterViewController.swift
//  MyFirstApp22sep2023
//
//  Created by Diplomado on 29/09/23.
//

import UIKit

class TwitterViewController: UIViewController{

    private lazy var twitterTextView: UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        return textView
    }()
    
    private lazy var shareButton: UIButton = {
        let action = UIAction(title: "Share") { [weak self] _ in
            self?.shareButtonTapped()
        }
        let button = UIButton(primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //Previo iOS 14 (se debe poner @objc)
        //let button = UIButton()
        //button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        //button.setTitle("Share", for: .normal)
        return button
    }()
    
    func shareButtonTapped() {
        print(twitterTextView.text ?? "")
    }
    
    private func setElements() {
        view.addSubview(twitterTextView)
        view.addSubview(shareButton)
        NSLayoutConstraint.activate([
            twitterTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            twitterTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            twitterTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            twitterTextView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            shareButton.topAnchor.constraint(equalTo: twitterTextView.bottomAnchor, constant: 20),
            shareButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3),
            shareButton.heightAnchor.constraint(equalToConstant: 50),
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setElements()
        // Do any additional setup after loading the view.
    }

}


extension TwitterViewController: UITextViewDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "" {return true}
        if string.rangeOfCharacter(from: .alphanumerics) == nil && string != " " {
            return false
        }else{
            return (textField.text?.count ?? 0) + string.count - range.length <= 155
        }
    }
    
}
