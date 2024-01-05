import UIKit

class ListTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    var model = dataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
   
    
    
    
    @IBAction func addButton(_ sender: UIButton) {
        
        if let newText = textField.text {
            
            if(newText != "" ){
                if((newText.first?.isLetter) != nil){
                    
                    var imageText = "\(textField.text?.first?.lowercased() ?? "").circle"
                    if(UIImage(systemName: "\(textField.text?.first?.lowercased() ?? "").circle") == nil){
                        imageText = "circle"
                    }
                    
                    let newProduct = Product(name: textField.text!, nameImage: imageText)
                    model.setAddProduct(product: newProduct)
                    model.saveData()
                    tableView.reloadData()
                    
                }
            }

            
        }
        
        
    }
    
}

extension ListTableViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getCountProduct()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.default , reuseIdentifier: "cell")
        
        cell.imageView?.image = UIImage(systemName: model.getImageProduct(numberIndex: indexPath.row))
        cell.textLabel?.text = model.getNameProduct(numberIndex: indexPath.row)
        
        return cell
        
    }
    
}
