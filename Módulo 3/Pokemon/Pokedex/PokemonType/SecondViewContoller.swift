import UIKit

class SecondViewContoller: UIViewController, UICollectionViewDelegate{
    
    var pokemonTypes = [PokemonType]()
    let singleton1 = PokemonTypeData.shared
    
    var searchBarInputText: String = ""
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
        pokemonTypes = singleton1.getPokemonTypes()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionView.collectionViewLayout = layout
        collectionView.register(MyCollectionViewCell.nib(),forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Se seleccionó el elemento en la posición \(indexPath.row)")
        performSegue(withIdentifier: "showPokemonTypeCard", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPokemonTypeCard" {
            if let destinationVC = segue.destination as? PokemonTypeDetailViewContoller {
                // Configura los datos que quieres pasar al detalle
                if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                    let selectedPokemon = pokemonTypes[indexPath.row]
                    destinationVC.setPokemonTypeElements(pokemonTypeInfo: selectedPokemon)
                    
                   
                }
            }
        }
    }


    

   
}





extension SecondViewContoller: UICollectionViewDataSource{
    // numberOfItems
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonTypes.count
    }
    
    // cellfor item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: pokemonTypes[indexPath.row])
        print(indexPath.row)
        return cell
    }
}

// Costumizar nuestros collection views
extension SecondViewContoller: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: 150, height: 150)
    }
}
