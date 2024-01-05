//
//  BandTableViewCell.swift
//  music-bands
//
//  Created by Diplomado on 03/11/23.
//

import UIKit

class BandTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageBand: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var descriLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
