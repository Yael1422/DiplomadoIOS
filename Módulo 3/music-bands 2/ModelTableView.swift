import Foundation

struct Song {
    var nameSong: String
    var duration: String
    
}


struct Album {
    var nameAlbum: String
    var imageAlbum: String
    var age: String
    var songs:[Song]
}

struct Artist {
    var nameArtist: String
    var imageArtist: String
    var description: String
    var Albums:[Album]
}

class TableViewModel{
    var musicCollection : [Artist]
    
    init() {
        let Avenged = Artist(nameArtist: "Avenged Sevenfold", imageArtist: "avengedSevenfold", description:"Banda de heavy metal", Albums: [Album(nameAlbum: "Nightmare", imageAlbum: "Nightmare", age: "2010", songs: [Song(nameSong: "Nightmare", duration: "6:14"),Song(nameSong: "Welcome to the Family", duration: "4:06"),Song(nameSong: "Danger Line", duration: "5:28")])])
        
        let Megadeth = Artist(nameArtist: "Megadeth", imageArtist: "Megadeth", description:"Banda de thrash metal", Albums: [Album(nameAlbum: "Rust In Peace", imageAlbum: "RustInPeace", age: "1990", songs: [Song(nameSong: "Holy Wars... The Punishment Due", duration: "6:36"),Song(nameSong: "Hangar 18", duration: "5:15"),Song(nameSong: "Take No Prisioners", duration: "3:29")]),Album(nameAlbum: "Peace Sells", imageAlbum: "PeaceSells", age: "1986", songs: [Song(nameSong: "Wake Up Dead", duration: "3:40"),Song(nameSong: "The Conjuring", duration: "5:04"),Song(nameSong: "Peace Sells", duration: "4:04")])
                                             
                                                                ])
        
        
        
        musicCollection = [Avenged, Megadeth]
    }
    
    
    func getArtistCountArray()-> Int{
        musicCollection.count
    }
    
    //func getAlbumsCountArray(index:IndexPath)-> Int{
    func getAlbumsCountArray(numberArtist:Int)-> Int{
        musicCollection[numberArtist].Albums.count
    }
    
    func getSongCountArray(numberArtist:Int ,numberAlbum:Int)-> Int{
        musicCollection[numberArtist].Albums[numberAlbum].songs.count
    }
    
    
    
    func getArtistTitle(index:IndexPath)-> String {
        musicCollection[index.row].nameArtist
    }
    
    func getAlbumTitle(number:Int,index:IndexPath)-> String {
        musicCollection[number].Albums[index.row].nameAlbum
    }
    
    func getSongTitle(number1:Int,number2:Int,index:IndexPath)-> String {
        musicCollection[number1].Albums[number2].songs[index.row].nameSong
    }
    
    func getArtist(index:IndexPath)-> Artist {
        musicCollection[index.row]
    }
    
    func getAlbum(number:Int,index:IndexPath)-> Album {
        musicCollection[number].Albums[index.row]
    }
}
