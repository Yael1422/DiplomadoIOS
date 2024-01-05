//
//  ImageStackViewController.swift
//  MyFirstApp22sep2023
//
//  Created by Diplomado on 29/09/23.
//

import UIKit

class ImageStackViewController: UIViewController {
    
    var showCat = false
    var  strTitle = ""
    @IBOutlet weak var firstCaptionedImage: CaptionedImage!
    @IBOutlet weak var secondCaptionedImage: CaptionedImage!
    @IBOutlet weak var thirdCaptionedImage: CaptionedImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if showCat{
            //firstImageView.image = UIImage(named: "dog-1.jpeg")
            firstCaptionedImage.setContent(image: "cat-1", caption: "cat-1")
            secondCaptionedImage.setContent(image: "cat-2", caption: "cat-2")
            thirdCaptionedImage.setContent(image: "cat-3", caption: "cat-3")
            
        }else{
            firstCaptionedImage.setContent(image: "dog-1", caption: "dog-1")
            secondCaptionedImage.setContent(image: "dog-2", caption: "dog-2")
            thirdCaptionedImage.setContent(image: "dog-2", caption: "dog-2")
        }
    }
    
    @IBAction func segueToShare(_ sender: UIBarButtonItem) {
        let shareViewController = TwitterViewController()
        present(shareViewController, animated: true)
    }

}
