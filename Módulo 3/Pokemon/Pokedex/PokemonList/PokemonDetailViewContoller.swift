import UIKit

class PokemonDetailViewContoller: UIViewController {

    // Atributos de la vista
    var pokemonNameValue: String = ""
    var pokemonNumberValue: String = ""
    var pokemonImageValue: String = ""
    var pokemonInfoValue: String = ""
    var poekmonEvolution01Value: String = ""
    var pokemonEvolution02Value: String = ""
    var pokemonTypeValue: String = ""
    var selectedEvolution: String = ""
    
    
    // Elementos de la vista
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonNumber: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonInfo: UITextView!
    @IBOutlet weak var poekmonEvolution01: UIImageView!
    @IBOutlet weak var pokemonEvolution02: UIImageView!
    @IBOutlet weak var pokemonType: UIButton!
    
    // Botón de Favoritos
    @IBOutlet weak var addToFavoritePressed: UIButton!
    
    
    // Dos evoluciones
    @IBOutlet weak var pokemonEvolutionButton01: UIButton!
    @IBOutlet weak var pokemonEvolutionButton02: UIButton!

    // Si se presiona se deben de hacer cambios
    @IBAction func pokemonEvolutionPressed01(_ sender: UIButton) {
        selectedEvolution = poekmonEvolution01Value
        let newPokemon = PokemonData.shared.searchPokemon(searchNumber: selectedEvolution)
        setView(newName: newPokemon.name, newNumber: newPokemon.number, newImage: newPokemon.imageName, newInfo: newPokemon.information, newEvolution: newPokemon.evolution, newType: newPokemon.type)

    }
    
    @IBAction func pokemonEvolutionPressed02(_ sender: UIButton) {
        selectedEvolution = pokemonEvolution02Value
        let newPokemon = PokemonData.shared.searchPokemon(searchNumber: selectedEvolution)
        setView(newName: newPokemon.name, newNumber: newPokemon.number, newImage: newPokemon.imageName, newInfo: newPokemon.information, newEvolution: newPokemon.evolution, newType: newPokemon.type)
    }
    
    @IBAction func addToFavoritePressed(_ sender: UIButton) {
        let currentPokemon = Pokemon(
            number: pokemonNumberValue,
            imageName: pokemonImageValue,
            name: pokemonNameValue,
            information: pokemonInfoValue,
            type: pokemonTypeValue,
            evolution: [poekmonEvolution01Value, pokemonEvolution02Value]
        )

        // Verifica si el Pokémon ya está en la lista de favoritos
        if !FavoriteData.shared.getFavorites().contains(where: { $0.number == currentPokemon.number }) {
            FavoriteData.shared.addFavorite(number: currentPokemon.number)
            FavoriteData.shared.saveFavoriteData()
            
            // Crea una instancia de UIAlertController
            let alertController = UIAlertController(title: "!Pokemon agregado a favoritos!", message: nil, preferredStyle: .alert)

            // Agrega un botón de "OK" a la alerta
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)

            // Muestra la alerta en la pantalla
            present(alertController, animated: true, completion: nil)
            
        } else {
            // Crea una instancia de UIAlertController
            let alertController = UIAlertController(title: "!El pokemon ya existe en favoritos!", message: nil, preferredStyle: .alert)

            // Agrega un botón de "OK" a la alerta
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)

            // Muestra la alerta en la pantalla
            present(alertController, animated: true, completion: nil)
        }
    }


    override func viewDidLoad() {
        pokemonName.text = pokemonNameValue
        pokemonNumber.text = pokemonNumberValue
        pokemonImage.image = UIImage(named: pokemonImageValue)
        pokemonInfo.text = pokemonInfoValue
        poekmonEvolution01.image = UIImage(named: poekmonEvolution01Value)
        pokemonEvolution02.image = UIImage(named: pokemonEvolution02Value)
        pokemonType.setTitle(pokemonTypeValue, for: .normal)
        pokemonType.tintColor  = getTypeColor(type: pokemonTypeValue)
        super.viewDidLoad()
    }
    
    func setView(newName: String, newNumber: String, newImage: String, newInfo: String, newEvolution: [String], newType: String){
        pokemonName.text = newName
        pokemonNumber.text = newNumber
        pokemonImage.image = UIImage(named: newImage)
        pokemonInfo.text = newInfo
        poekmonEvolution01.image = UIImage(named: newEvolution[0])
        pokemonEvolution02.image = UIImage(named: newEvolution[1])
        pokemonType.setTitle(newType, for: .normal)
        pokemonType.tintColor  = getTypeColor(type: newType)
        pokemonEvolutionButton01.setTitle(PokemonData.shared.getPokemonName(searchNumber: newEvolution[0]), for: .normal)
        pokemonEvolutionButton02.setTitle(PokemonData.shared.getPokemonName(searchNumber: newEvolution[1]), for: .normal)

        
    }
    
    func setPokemonDescriptionView(newName: String, newNumber: String, newImage: String, newInfo: String, newEvolution: [String], newType: String){
        self.pokemonNameValue = newName
        self.pokemonNumberValue = newNumber
        self.pokemonImageValue = newImage
        self.pokemonInfoValue = newInfo
        self.poekmonEvolution01Value = newEvolution[0]// Son los nombres de las imagenes
        self.pokemonEvolution02Value = newEvolution[1]
        self.pokemonTypeValue = newType
    }
    
    func getTypeColor(type: String) -> UIColor {
        print(type)
        var color: UIColor
        switch type.lowercased() {
        case "planta/veneno":
            color = UIColor(red: 83.0/255.0, green: 179.0/255.0, blue: 77.0/255.0, alpha: 1.0)
        case "fuego":
            color = UIColor(red: 251.0/255.0, green: 138.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        case "agua":
            color = UIColor(red: 62.0/255.0, green: 125.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        default:
            color = UIColor.black
        }
        return color
    }
}
