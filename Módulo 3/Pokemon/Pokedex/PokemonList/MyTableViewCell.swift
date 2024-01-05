import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    // Identificador para el elemento
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with pokemon: Pokemon){
        self.numberLabel.text = String(pokemon.number)
        self.nameLabel.text = pokemon.name
    }
    
}
