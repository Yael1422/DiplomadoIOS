import UIKit

class ListCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet weak var tableView:UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filterArray:[Product] = []
    
    var model = dataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        model.equalArray()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model.equalArray()
        tableView.reloadData()
        collectionView.reloadData()
    }
}



extension ListCollectionViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getCountFilter()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.default , reuseIdentifier: "cell")
        
        cell.imageView?.image = UIImage(systemName: model.getImageFilter(numberIndex: indexPath.row))
        cell.textLabel?.text = model.getNameFilter(numberIndex: indexPath.row)
        
        return cell
    }
}


//--CollectionView
extension ListCollectionViewController : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.getCountProduct()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        
        cell.imageProduct.image = UIImage(systemName: model.getImageProduct(numberIndex: indexPath.row))
        cell.nameProduct.text = model.getNameProduct(numberIndex: indexPath.row)
        
        return cell
    }
}


extension ListCollectionViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alertView = UIAlertController (title: "AVISO", message: "Estas seguro que quieres borra el elemento", preferredStyle:.alert)
        //alertView.addAction(UIAlertAction (title: "OK", style: .default, handler: nil))
        let eliminar = UIAlertAction(title: "Eliminar", style: .destructive) { (action) in
            self.model.setRemoveProduct(numberPosition: indexPath.row)
            self.model.equalArray()
            collectionView.reloadData()
            self.tableView.reloadData()
            
            self.model.saveData()
        }
        let cancelar = UIAlertAction (title: "Cancelar", style: .default, handler: nil)
        
        alertView.addAction(eliminar)
        alertView.addAction(cancelar)
                
        present(alertView, animated: true, completion: nil)
    }
    
    
    
    
}

//
extension ListCollectionViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print(searchText)
        filterArray = []
        if searchText == ""{
            model.equalArray()
        }
        let dataArray = model.arrayProducts
        
        for word in dataArray{
            if word.name.uppercased().contains(searchText.uppercased()) {
                filterArray.append(word)
            }
        }
        model.arrayFilter = filterArray
        tableView.reloadData()
        
    }
    
    
}
