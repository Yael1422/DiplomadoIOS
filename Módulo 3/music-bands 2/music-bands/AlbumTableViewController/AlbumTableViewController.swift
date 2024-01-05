//
//  AlbumTableViewController.swift
//  music-bands
//
//  Created by Diplomado on 04/11/23.
//

import UIKit

class AlbumTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var numberArtist: Int = 0
    var model = TableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension AlbumTableViewController: UITableViewDataSource{
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getAlbumsCountArray(numberArtist: numberArtist)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let album = model.getAlbum(number: numberArtist, index: indexPath)

        cell.textLabel?.text = album.nameAlbum
        cell.detailTextLabel?.text = "Año: " + album.age

        // Cargar la imagen original
        if let originalImage = UIImage(named: album.imageAlbum) {
            // Definir el nuevo tamaño deseado
            let newSize = CGSize(width: 130, height: 130)

            // Escalar la imagen al nuevo tamaño
            UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
            originalImage.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            // Asignar la imagen escalada a la celda
            cell.imageView?.image = scaledImage
        }

        return cell

         
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    
}



extension AlbumTableViewController: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        150.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 200
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let albumView = SongTableViewController()
        albumView.numberArtist = numberArtist
        albumView.numberAlbum = indexPath.row
        navigationController?.pushViewController(albumView, animated: true)
    }
    
    
}

