import Foundation

class FavoriteData {
    
    let singleton1 = PokemonData.shared
    
    static let shared = FavoriteData()
    
    var favoritePokemon = [Pokemon]()
    
    
    // Dado un número, nos agrega el pokemon asociado a este valor
    func addFavorite(number: String) {
        var pokemons = singleton1.getProductos()
        
        // Verificar si el Pokémon ya está en la lista de favoritos
        if favoritePokemon.contains(where: { $0.number == number }) {
            print("El Pokémon ya está en la lista de favoritos.")
            return
        }
        
        for pokemon in pokemons {
            if pokemon.number == number {
                favoritePokemon.append(pokemon)
                saveFavoriteData()
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadFavoritesTable"), object: nil)
                return
            }
        }
    }
    
    func getFavorites() -> [Pokemon]{
        return favoritePokemon
    }
    
    
    func saveFavoriteData() {
        let encoder = PropertyListEncoder()
        do {
            let encodedData = try encoder.encode(favoritePokemon)
            UserDefaults.standard.set(encodedData, forKey: "favoritePokemonKey")
        } catch {
            print("Error al codificar los Pokémon favoritos: \(error)")
        }
    }

    func loadFavorites() {
        if let savedFavoritesData = UserDefaults.standard.value(forKey: "favoritePokemonKey") as? Data {
            let decoder = PropertyListDecoder()
            do {
                favoritePokemon = try decoder.decode([Pokemon].self, from: savedFavoritesData)
            } catch {
                print("Error al decodificar Pokémon favoritos: \(error)")
            }
        }
    }
}
