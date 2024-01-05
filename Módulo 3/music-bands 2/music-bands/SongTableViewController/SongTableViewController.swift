import UIKit

class SongTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var numberArtist: Int = 0
    var numberAlbum: Int = 0
    var model = TableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SongTableViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getSongCountArray(numberArtist: numberArtist, numberAlbum: numberAlbum)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let songTitle = model.getSongTitle(number1: numberArtist, number2: numberAlbum, index: indexPath)
        let songDuration = model.musicCollection[numberArtist].Albums[numberAlbum].songs[indexPath.row].duration

        cell.textLabel?.text = songTitle
        cell.detailTextLabel?.text = "Duración: " + songDuration
        cell.imageView?.image = UIImage(systemName: "music.note.list")

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    
}

extension SongTableViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
