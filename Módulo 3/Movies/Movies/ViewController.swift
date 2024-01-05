import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var table: UITableView!
    
    var movies: [[Movie]] = []
    
    var count = 0;


    override func viewDidLoad() {
        super.viewDidLoad()
        let comedias = [Movie(title: "Hasta La Madre", genre: "Comedia", imageName: "hastaLaMadre"),
                            Movie(title: "Hazme El Favor", genre: "Comedia", imageName: "hazmeElFavor"),
                            Movie(title: "Ghosted", genre: "Comedia" , imageName: "ghosted")]
        
        let musicales = [Movie(title: "Scrooge", genre: "Musicales", imageName: "scrooge"),
                            Movie(title: "Una Vida Maravillosa", genre: "Musicales", imageName: "unaVidaMaravillosa"),
                            Movie(title: "La Ursurpadora", genre: "Musicales", imageName: "ursurpadora")]
        
        let thrillers = [Movie(title: "Juego Limpio", genre: "Thriller", imageName: "juegoLimpio"),
                           Movie(title: "Los Extraños", genre: "Thriller", imageName: "losExtraños"),
                           Movie(title: "Emancipation", genre: "Thriller", imageName: "emancipation")]
        
        movies = [comedias, musicales, thrillers]
        
        table.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    } 

    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.configure(with: movies[count])
        count += 1;
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0
    }
 

}
