import Foundation


struct Product:Codable{
    var name: String
    var nameImage: String
}


class dataModel {
    var arrayProducts:[Product]
    var arrayFilter:[Product]
    let defaults = UserDefaults.standard
    init() {
        arrayProducts = [
            
            Product(name: "box", nameImage: "cube.box.fill"),
        Product(name: "iphone", nameImage: "iphone"),
        Product(name: "ipad", nameImage: "ipad")
        
        ]
        arrayFilter = []
    }
    
    
    func getCountProduct() -> Int {
        arrayProducts.count
    }
    
    func getNameProduct(numberIndex : Int)->String{
        arrayProducts[numberIndex].name
    }
    
    func getImageProduct(numberIndex : Int)->String{
        arrayProducts[numberIndex].nameImage
    }
    
    //---- filter
    
    func getCountFilter() -> Int {
        arrayFilter.count
    }
    
    func getNameFilter(numberIndex : Int)->String{
        arrayFilter[numberIndex].name
    }
    
    func getImageFilter(numberIndex : Int)->String{
        arrayFilter[numberIndex].nameImage
    }
    
    func equalArray() {
        arrayFilter = arrayProducts
    }
    
    
    func setAddProduct(product:Product){
        arrayProducts.append(product)
    }
    
    func setRemoveProduct(numberPosition:Int){
        
        arrayProducts.remove(at: numberPosition)
    }
    
    
    func saveData(){
        if let encodedData = try? JSONEncoder().encode(arrayProducts){
            defaults.setValue(encodedData, forKey: "myArrayKey")
        }

    }
    
    func upData()  {
        if let savedData = defaults.data(forKey: "myArrayKey"), let decodeArray = try? JSONDecoder().decode([Product].self, from: savedData){
            arrayProducts = decodeArray
        }else{
            print("Error")
        }
    }
    
    
}















