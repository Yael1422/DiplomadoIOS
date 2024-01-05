import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    let singleton1 = PokemonData.shared
    var productos = [Pokemon]()
    var filteredProductos = [Pokemon]() // Nuevo arreglo para almacenar los resultados filtrados

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        productos = singleton1.getProductos()
        filteredProductos = productos // Inicializar el arreglo filtrado con todos los productos
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        singleton1.saveProducts()
    }

    @IBAction func searchInputChanged(_ sender: UITextField) {
        let resultados = productos.filter { $0.name.lowercased().contains(sender.text!.lowercased()) }
        filteredProductos = resultados
        tableView.reloadData()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredProductos.count // Usar el arreglo filtrado en lugar de productos
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.configure(with: filteredProductos[indexPath.row])
        return cell
    }

    // Altura de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }

    // Cuando se presiona la celda se realiza el Segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Se presionó la celda en la posición \(indexPath.row)")
        performSegue(withIdentifier: "showPokemonCard", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPokemonCard" {
            if let destinationVC = segue.destination as? PokemonDetailViewContoller {
                // Configura los datos que quieres pasar al detalle
                if let indexPath = tableView.indexPathForSelectedRow {
                    let selectedPokemon = filteredProductos[indexPath.row]
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

//---- SearchBar
extension FirstViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print(searchText)
        if searchText == "" {
            filteredProductos = productos
        } else {
            let resultados = productos.filter { pokemon in
                let namePlusNumber = pokemon.name + String(pokemon.number)
                return namePlusNumber.lowercased().contains(searchText.lowercased())
            }
            filteredProductos = resultados
        }
        tableView.reloadData()
    }
}
