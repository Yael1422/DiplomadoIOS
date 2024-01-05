import Foundation

class PokemonTypeData {
    
    static let shared = PokemonTypeData()
    
    // Principal Structure to sav epokemons
    var pokemonTypes = [PokemonType]()
        
    private init() {
        // Tipo Fuego
        pokemonTypes.append(PokemonType(type: "Fuego", imageName: "type01.svg", doubleDamageDealt: ["Agua","Tierra","Roca"], doubleDamageReceived: ["Hielo","Agua","Roca"], halfDamageDealt: ["Agua","Tierra","Roca"], halfDamageReceived: ["Hielo","Agua","Roca"], notAffectedBy: ["Normal","Fuego","Siniestro"], notEffectAgainst: ["Agua","Tierra","Roca"]))
        // Tipo Agua
        pokemonTypes.append(PokemonType(type: "Agua", imageName: "type02.svg", doubleDamageDealt: ["Fuego","Tierra","Roca"], doubleDamageReceived: ["Electrico","Planta"], halfDamageDealt: ["Electrico","Planta"], halfDamageReceived: ["Fuego","Tierra","Roca"], notAffectedBy: ["Bicho","Veneno","Roca"], notEffectAgainst: ["Fuego","Tierra","Roca"]))
        // Tipo Planta
        pokemonTypes.append(PokemonType(type: "Planta", imageName: "type03.svg", doubleDamageDealt: ["Agua","Tierra","Roca"], doubleDamageReceived: ["Fuego","Volador","Hielo"], halfDamageDealt: ["Fuego","Volador","Hielo"], halfDamageReceived: ["Agua","Tierra","Roca"], notAffectedBy: ["Bicho"," Veneno","Siniestro"], notEffectAgainst: ["Fuego","Volador","Tierra"]))
        // Tipo Electrico
        pokemonTypes.append(PokemonType(type: "Electrico", imageName: "type04.svg", doubleDamageDealt: ["Agua","Tierra"], doubleDamageReceived: ["Volador","Tierra"], halfDamageDealt: ["Agua","Tierra"], halfDamageReceived: ["Volador","Tierra", ""], notAffectedBy: ["Tierra","Roca","Dragón"], notEffectAgainst: ["Volador","Tierra"]))
    
    }
    
    func getPokemonTypes() -> [PokemonType]{
        loadProducts()
        return pokemonTypes
    }
    
    func saveProducts() {
        let encoder = PropertyListEncoder()
        do{
            let encodedData = try encoder.encode(pokemonTypes)
            UserDefaults.standard.set(encodedData, forKey: "pokemonTypesKey")  // Cambia la clave a "pokemonTypesKey"
        }catch {
            print("Error al codificar los productos: \(error)")
        }
    }

    func loadProducts() {
        if let savedProductsData = UserDefaults.standard.value(forKey: "pokemonTypesKey") as? Data {  // Cambia la clave a "pokemonTypesKey"
            let decoder = PropertyListDecoder()
            do {
                pokemonTypes = try decoder.decode([PokemonType].self, from: savedProductsData)
            } catch {
                print("Error al decodificar productos: \(error)")
            }
        }
    }
}

// Estructure for modeling a Pokemon (includes name and image string reference)
struct PokemonType: Codable{
    
    let type: String
    let imageName: String
    let doubleDamageDealt: [String]
    let doubleDamageReceived: [String]
    let halfDamageDealt: [String]
    let halfDamageReceived: [String]
    let notAffectedBy: [String]
    let notEffectAgainst: [String]

    init(type: String, imageName: String, doubleDamageDealt: [String], doubleDamageReceived: [String], halfDamageDealt: [String], halfDamageReceived: [String], notAffectedBy: [String], notEffectAgainst: [String]) {
        self.type = type
        self.imageName = imageName
        self.doubleDamageDealt = doubleDamageDealt
        self.doubleDamageReceived = doubleDamageReceived
        self.halfDamageDealt = halfDamageDealt
        self.halfDamageReceived = halfDamageReceived
        self.notAffectedBy = notAffectedBy
        self.notEffectAgainst = notEffectAgainst
    }
}
