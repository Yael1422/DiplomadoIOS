//
//  CustomTabViewController.swift
//  shoppingList
//
//  Created by Diplomado on 28/10/23.
//

import UIKit

class CustomTabViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    let model = Model()
    
    @IBAction func addButton(_ sender: UIButton) {
        
        
        if(textField.text != ""){
            model.addRow(text: textField.text ?? "")
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
}


extension CustomTabViewController: UITableViewDataSource{
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = model.getTitle(index: indexPath)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Eliminar"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let alertView = UIAlertController (title: "Eliminar", message: "¿Estás seguro que quieres eliminar el elemento de la lista de compras?", preferredStyle:.alert)
            let eliminar = UIAlertAction(title: "Eliminar", style: .destructive) { (action) in
                self.model.deleRow(index: indexPath)
                tableView.reloadData()
            }
            let cancelar = UIAlertAction (title: "Cancelar", style: .default, handler: nil)
            
            alertView.addAction(eliminar)
            alertView.addAction(cancelar)
                    
            present(alertView, animated: true, completion: nil)
            
        }
    }
}


extension CustomTabViewController: UITableViewDelegate{
        
                
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            150.0
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(model.getTitle(index: indexPath))
          
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        
    }
