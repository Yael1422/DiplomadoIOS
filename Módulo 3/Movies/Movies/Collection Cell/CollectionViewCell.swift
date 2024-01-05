//
//  CollectionViewCell.swift
//  Movies
//
//  Created by Ramón Ortiz Castañeda on 04/11/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    static let identifier = "CollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    public func configure(with model: Movie){
        self.myLabel.text = model.title
        self.myImageView.image = UIImage(named: model.imageName)
    }

}
