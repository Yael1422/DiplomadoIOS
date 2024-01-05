//
//  MyTableViewCell.swift
//  Tablas
//
//  Created by Diplomado on 27/10/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var mySubTitle: UILabel!
    @IBOutlet weak var myTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
