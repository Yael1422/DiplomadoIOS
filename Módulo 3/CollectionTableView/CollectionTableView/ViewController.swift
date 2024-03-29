import UIKit

class ViewController: UIViewController {

    var dataArray = ["Primero", "Segundo", "Tercero"]
    var filterArray: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBAction func sortButton(_ sender: Any) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterArray = dataArray
        tableView.dataSource = self
        searchBar.delegate = self
    }
}
    
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = filterArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        filterArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterArray = []
        
        if searchText == "" {
            filterArray = dataArray
        }
        
        for word in dataArray {
            if word.uppercased().contains(searchText.uppercased()) {
                filterArray.append(word)
            }
        }
        tableView.reloadData()
    }
}
