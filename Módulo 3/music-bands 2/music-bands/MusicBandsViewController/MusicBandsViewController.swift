//
//  MusicBandsViewController.swift
//  music-bands
//
//  Created by Diplomado on 03/11/23.
//

import UIKit

class MusicBandsViewController: UIViewController {
    
    var model = TableViewModel()
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "BandTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }


}



extension MusicBandsViewController: UITableViewDataSource{
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getArtistCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BandTableViewCell
        
        let artistInfo = model.getArtist(index: indexPath)
        
        cell?.imageBand.image = UIImage(named: artistInfo.imageArtist)
       
        cell?.nameLabel.text  = artistInfo.nameArtist
        cell?.dataLabel.text = "Albums: \(artistInfo.Albums.count)"
        cell?.accessoryType = .disclosureIndicator
        cell?.descriLabel.text = artistInfo.description
        
       return cell!
        
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    
}



extension MusicBandsViewController: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100.0
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(model.getTitle(index: indexPath))
        tableView.deselectRow(at: indexPath, animated: true)
        let albumView = AlbumTableViewController()
        albumView.numberArtist = indexPath.row
        navigationController?.pushViewController(albumView, animated: true)
        //present(albumView, animated: true)
    }
    
    
}

