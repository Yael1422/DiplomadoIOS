import UIKit

class ThirdController: UIViewController,  UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!

    let singleton1 = FavoriteData.shared
    var favoritePokemons = [Pokemon]()
    var addBarText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        singleton1.loadFavorites()
        
        favoritePokemons = singleton1.getFavorites()
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadFavoritesTable), name: NSNotification.Name(rawValue: "reloadFavoritesTable"), object: nil)
    }
    
    // Función para recargar la tabla de favoritos
    @objc func reloadFavoritesTable() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.configure(with: favoritePokemons[indexPath.row])
        return cell
    }
    
    // Altura de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPokemonCard", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPokemonCard" {
            if let destinationVC = segue.destination as? PokemonDetailViewContoller {
                // Configura los datos que quieres pasar al detalle
                if let indexPath = tableView.indexPathForSelectedRow {
                    let selectedPokemon = favoritePokemons[indexPath.row]
                    destinationVC.setPokemonDescriptionView(newName: selectedPokemon.name,
                                                             newNumber: selectedPokemon.number,
                                                             newImage: selectedPokemon.imageName,
                                                             newInfo: selectedPokemon.information,
                                                             newEvolution: selectedPokemon.evolution,
                                                             newType: selectedPokemon.type)
                }
            }
        }
    }
}
