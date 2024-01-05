import Foundation

class PokemonData {
    
    static let shared = PokemonData()
    
    // Principal Structure to sav epokemons
    var pokemons = [Pokemon]()
        
    private init() {
        // Bulbasaur
        pokemons.append(Pokemon(number: "001", imageName: "001.png", name: "Bulbasaur", information: "Un Pokémon de tipo Planta que parece una rana. Sus semillas brotan de su espalda", type: "Planta/Veneno", evolution: ["002","003"]))
        pokemons.append(Pokemon(number: "002", imageName: "002.png", name: "Ivysaur", information: "Un Pokémon de tipo Planta que parece una rana. Sus semillas brotan de su espalda", type: "Planta/Veneno", evolution: ["001","003"]))
        pokemons.append(Pokemon(number: "003", imageName: "003.png", name: "Venusaur", information: "Un Pokémon de tipo Planta que parece una rana. Sus semillas brotan de su espalda", type: "Planta/Veneno", evolution: ["001","002"]))
        // Fuego
        pokemons.append(Pokemon(number: "004", imageName: "004.png", name: "Charmander", information: "Un Pokémon de tipo Fuego que parece una lagartija. Su cola siempre está ardiendo", type: "Fuego", evolution: ["005","006"]))
        pokemons.append(Pokemon(number: "005", imageName: "005.png", name: "Charmeleon", information: "Un Pokémon de tipo Fuego que parece una lagartija. Su cola siempre está ardiendo", type: "Fuego", evolution: ["004","006"]))
        pokemons.append(Pokemon(number: "006", imageName: "006.png", name: "Charizard", information: "Un Pokémon de tipo Fuego que parece una lagartija. Su cola siempre está ardiendo", type: "Fuego", evolution: ["004","005"]))
        // Squirtle
        pokemons.append(Pokemon(number: "007", imageName: "007.png", name: "Squirtle", information: "Un Pokémon de tipo Agua que parece una tortuga. Su cuerpo está cubierto de una capa gruesa y resistente", type: "Agua", evolution: ["008","009"]))
        pokemons.append(Pokemon(number: "008", imageName: "008.png", name: "Wartortle", information: "Un Pokémon de tipo Agua que parece una tortuga. Su cuerpo está cubierto de una capa gruesa y resistente", type: "Agua", evolution: ["007","009"]))
        pokemons.append(Pokemon(number: "009", imageName: "009.png", name: "Blastoise", information: "Un Pokémon de tipo Agua que parece una tortuga. Su cuerpo está cubierto de una capa gruesa y resistente", type: "Agua", evolution: ["007","008"]))
        
       }
    
    func getProductos() -> [Pokemon]{
        loadProducts()
        return pokemons
    }
    
    

    func searchPokemon(searchNumber: String) -> Pokemon{
        var foundPokemon: Pokemon = Pokemon(number: "1", imageName: "001", name: "EmptyPokemon", information: "NoInfo", type: "whaa", evolution: [])
        for pokemon in pokemons {
            if(pokemon.number == searchNumber){
                foundPokemon = pokemon
            }
        }
        return foundPokemon
    }
    
    func getPokemonName(searchNumber: String) -> String{
        var pokemonName: String = ""
        for pokemon in pokemons {
            if(pokemon.number == searchNumber){
                pokemonName = pokemon.name
            }
        }
        return pokemonName
    }
    
    
    
    func saveProducts() {
        let encoder = PropertyListEncoder()
        do {
            let encodedData = try encoder.encode(pokemons)
            UserDefaults.standard.set(encodedData, forKey: "pokemonsKey")  // Cambia la clave a "pokemonsKey"
        } catch {
            print("Error al codificar los productos: \(error)")
        }
    }

    func loadProducts() {
        if let savedProductsData = UserDefaults.standard.value(forKey: "pokemonsKey") as? Data {  // Cambia la clave a "pokemonsKey"
            let decoder = PropertyListDecoder()
            do {
                pokemons = try decoder.decode([Pokemon].self, from: savedProductsData)
            } catch {
                print("Error al decodificar productos: \(error)")
            }
        }
    }
}



// Estructure for modeling a Pokemon (includes name and image string reference)
struct Pokemon: Codable{
    
    let imageName: String
    let name: String
    let number: String
    let information: String
    let type: String
    let evolution: [String] // Conjunto de pokemones a los que evoluciona
    

    
    init(number: String, imageName: String, name: String, information: String, type: String, evolution: [String]) {
        self.imageName = imageName
        self.name = name
        self.number = number
        self.information = information
        self.type = type
        self.evolution = evolution
    }

}
