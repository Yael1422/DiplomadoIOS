//
//  HistoryViewController.swift
//  gameRockPaperScissors
//
//  Created by Diplomado on 27/10/23.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    var model = TableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    


}


extension HistoryViewController: UITableViewDataSource{
    
   
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         return model.getCountArray()
        
        
        
        //return model.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       // let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        cell?.titleLabel.text = model.getTitle(index: indexPath)
        cell?.resultLabel.text = model.getTitleSelec(index: indexPath)
        
        switch model.getState(index: indexPath) {
        case .win:
            cell?.backgroundColor = .green
            cell?.imageCell.image = UIImage(systemName: "checkmark.circle")
        case .lose:
            cell?.backgroundColor = .red
            cell?.imageCell.image = UIImage(systemName: "xmark.circle")
        case .tied:
            cell?.backgroundColor = .brown
            cell?.imageCell.image = UIImage(systemName: "circle")
        }
        
        
        
        //cell.detailTextLabel?.text = "XD"
        return cell!
         
        
        
             
           
        
            
            
        
        
        
        
        //cell?.textLabel?.text = model.getTitle(index: indexPath)
        //cell?.detailTextLabel?.text = model.getDescription(index: indexPath)
        
        
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            model.deleRow(index: indexPath)
            tableView.reloadData()
        }
    }
}
