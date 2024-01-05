//
//  ViewController.swift
//  Tablas
//
//  Created by Diplomado on 27/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        model.addRow(text: textField.text ?? "")
        tableView.reloadData()
    }
    
    let model = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.getSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        model.getSectionTitle()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MyTableViewCell
        
//        if cell == nil {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//            cell?.backgroundColor = .gray
//            cell?.accessoryType = .disclosureIndicator
//        }
        
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
//        cell?.textLabel?.text = model.getTitle(index: indexPath)
//        cell?.detailTextLabel?.text = model.getDescription(index: indexPath)
        
        switch indexPath.section {
        case 0: cell?.backgroundColor = .blue
        case 1: cell?.backgroundColor = .systemPink
        default: cell?.backgroundColor = .orange
        }
        
        cell?.myTitle.text = model.getTitle(index: indexPath)
        cell?.mySubTitle.text = model.getDescription(index: indexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.deleteRow(index: indexPath)
            tableView.reloadData()
        }
    }
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: 80
        case 1: 100
        default: 150
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(model.getTitle(index: indexPath))
        performSegue(withIdentifier: "TableToNextView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
