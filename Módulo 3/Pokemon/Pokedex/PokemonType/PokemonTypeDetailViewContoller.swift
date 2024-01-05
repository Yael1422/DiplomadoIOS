import UIKit

class PokemonTypeDetailViewContoller: UIViewController {
    
    var type: String = ""
    var doubleDamageDealt: [String] = []
    var doubleDamageReceived: [String] = []
    var halfDamageDealt: [String] = []
    var halfDamageReceived: [String] = []
    var notAffectedBy: [String] = []
    var notEffectAgainst: [String] = []
    
    // Elementos de la vista
    
    @IBOutlet weak var pokemonTypeButton: UIButton!
    
    @IBOutlet weak var doubleDamageDeal01: UIButton!
    @IBOutlet weak var doubleDamageDeal02: UIButton!
    @IBOutlet weak var doubleDamageDeal03: UIButton!

    @IBOutlet weak var doubleDamageReceived01: UIButton!
    @IBOutlet weak var doubleDamageReceived02: UIButton!
    @IBOutlet weak var doubleDamageReceived03: UIButton!
    
    @IBOutlet weak var halfDamageDealt01: UIButton!
    @IBOutlet weak var halfDamageDealt02: UIButton!
    @IBOutlet weak var halfDamageDealt03: UIButton!
    
    @IBOutlet weak var halfDamageReceived01: UIButton!
    @IBOutlet weak var halfDamageReceived02: UIButton!
    @IBOutlet weak var halfDamageReceived03: UIButton!
    
    @IBOutlet weak var notAffectedBy01: UIButton!
    @IBOutlet weak var notAffectedBy02: UIButton!
    @IBOutlet weak var notAffectedBy03: UIButton!
    
    @IBOutlet weak var notAffectedAgainst01: UIButton!
    @IBOutlet weak var notAffectedAgainst02: UIButton!
    @IBOutlet weak var notAffectedAgainst03: UIButton!
    
    
    override func viewDidLoad() {
        pokemonTypeButton.setTitle(type, for: .normal)
        pokemonTypeButton.tintColor = getTypeColor(type: type)

        // Cambios en los elementos de doble daño a
        doubleDamageDeal01.setTitle(doubleDamageDealt[0], for: .normal)
        doubleDamageDeal01.tintColor = getTypeColor(type: doubleDamageDealt[0])
        doubleDamageDeal02.setTitle(doubleDamageDealt[1], for: .normal)
        doubleDamageDeal02.tintColor = getTypeColor(type: doubleDamageDealt[1])
        if(halfDamageDealt.count > 2){
            doubleDamageDeal03.setTitle(doubleDamageDealt[2], for: .normal)
            doubleDamageDeal03.tintColor = getTypeColor(type: doubleDamageDealt[2])
        }else{ // En caso de que no sea posible para uno
            doubleDamageDeal03.isHidden = true
        }
        

        doubleDamageReceived01.setTitle(doubleDamageReceived[0], for: .normal)
        doubleDamageReceived01.tintColor = getTypeColor(type: doubleDamageReceived[0])
        doubleDamageReceived02.setTitle(doubleDamageReceived[1], for: .normal)
        doubleDamageReceived02.tintColor = getTypeColor(type: doubleDamageReceived[1])
        if(doubleDamageReceived.count > 2){
            doubleDamageReceived03.setTitle(doubleDamageReceived[2], for: .normal)
            doubleDamageReceived03.tintColor = getTypeColor(type: doubleDamageReceived[2])
        }else{
            doubleDamageReceived02.isHidden = true
        }

        halfDamageDealt01.setTitle(halfDamageDealt[0], for: .normal)
        halfDamageDealt01.tintColor = getTypeColor(type: halfDamageDealt[0])
        halfDamageDealt02.setTitle(halfDamageDealt[1], for: .normal)
        halfDamageDealt02.tintColor = getTypeColor(type: halfDamageDealt[1])
        if(halfDamageDealt.count > 2){
            halfDamageDealt03.setTitle(halfDamageDealt[2], for: .normal)
            halfDamageDealt03.tintColor = getTypeColor(type: halfDamageDealt[2])
        }else{
            halfDamageDealt03.isHidden = true
        }

        halfDamageReceived01.setTitle(halfDamageReceived[0], for: .normal)
        halfDamageReceived01.tintColor = getTypeColor(type: halfDamageReceived[0])
        halfDamageReceived02.setTitle(halfDamageReceived[1], for: .normal)
        halfDamageReceived02.tintColor = getTypeColor(type: halfDamageReceived[1])

        if(halfDamageDealt.count > 2){
            halfDamageReceived03.setTitle(halfDamageReceived[2], for: .normal)
            halfDamageReceived03.tintColor = getTypeColor(type: halfDamageReceived[2])
        }else{
            halfDamageReceived02.isHidden = true
        }

        
        notAffectedBy01.setTitle(notAffectedBy[0], for: .normal)
        notAffectedBy01.tintColor = getTypeColor(type: notAffectedBy[0])
        notAffectedBy02.setTitle(notAffectedBy[1], for: .normal)
        notAffectedBy02.tintColor = getTypeColor(type: notAffectedBy[1])

        if(halfDamageDealt.count > 2){
            notAffectedBy03.setTitle(notAffectedBy[2], for: .normal)
            notAffectedBy03.tintColor = getTypeColor(type: notAffectedBy[2])

        }else{
            notAffectedBy03.isHidden = true
        }


        notAffectedAgainst01.setTitle(notEffectAgainst[0], for: .normal)
        notAffectedAgainst01.tintColor = getTypeColor(type: notEffectAgainst[0])
        notAffectedAgainst02.setTitle(notEffectAgainst[1], for: .normal)
        notAffectedAgainst02.tintColor = getTypeColor(type: notEffectAgainst[1])

        if(notEffectAgainst.count > 2){
            notAffectedAgainst03.setTitle(notEffectAgainst[2], for: .normal)
            notAffectedAgainst03.tintColor = getTypeColor(type: notEffectAgainst[2])
        }else{
            notAffectedAgainst03.isHidden = true
        }

        
    
        super.viewDidLoad()
    }
    
    
    func setPokemonTypeElements(pokemonTypeInfo: PokemonType){
        self.type = pokemonTypeInfo.type
        self.doubleDamageDealt = pokemonTypeInfo.doubleDamageDealt
        self.doubleDamageReceived = pokemonTypeInfo.doubleDamageReceived
        self.halfDamageDealt = pokemonTypeInfo.halfDamageDealt
        self.halfDamageReceived = pokemonTypeInfo.halfDamageReceived
        self.notAffectedBy = pokemonTypeInfo.notAffectedBy
        self.notEffectAgainst = pokemonTypeInfo.notEffectAgainst
        
    }
    
    // 
    func getTypeColor(type: String) -> UIColor {
        let colorDictionary: [String: UIColor] = [
            "fuego":  UIColor(red: 252.0/255.0, green: 139.0/255.0, blue: 66.0/255.0, alpha: 1.0),
            "agua":   UIColor(red: 59.0/255.0, green: 126.0/255.0, blue: 206.0/255.0, alpha: 1.0),
            "planta": UIColor(red: 84.0/255.0, green: 179.0/255.0, blue: 77.0/255.0, alpha: 1.0),
            "tierra": UIColor(red: 205.0/255.0, green: 100.0/255.0, blue: 52.0/255.0, alpha: 1.0),
            "roca":   UIColor(red: 190.0/255.0, green: 171.0/255.0, blue: 121.0/255.0, alpha: 1.0),
            "hielo":  UIColor(red: 100.0/255.0, green: 199.0/255.0, blue: 178.0/255.0, alpha: 1.0),
            "bicho,": UIColor(red: 129.0/255.0, green: 187.0/255.0, blue: 32.0/255.0, alpha: 1.0),
            "veneno": UIColor(red: 116.0/255.0, green: 62.0/255.0, blue: 141.0/255.0, alpha: 1.0),
            "electrico": UIColor(red: 241.0/255.0, green: 205.0/255.0, blue: 44.0/255.0, alpha: 1.0),
            "volador": UIColor(red: 84.0/255.0, green: 98.0/255.0, blue: 139.0/255.0, alpha: 1.0)
        ]
        let lowercaseType = type.lowercased()
        if let color = colorDictionary[lowercaseType] {
            return color
        } else {
            return UIColor.systemBlue
        }
    }
    
}
