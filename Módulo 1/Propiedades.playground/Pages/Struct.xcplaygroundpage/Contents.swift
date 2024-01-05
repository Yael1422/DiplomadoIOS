import Foundation

struct Dog {
    var isAdopted: Bool = true
    let color: String
    
    var name: String {
        willSet(newName) {
            print("My name is \(newName)")
        }
        didSet {
            print("My old name was \(oldValue)")
        }
    }
    
    static let amountOfPaws = 4
    var paws: Int = 4
    var specialNeeds: Bool{
        paws != Self.amountOfPaws
    }
    
    func getID() -> String {
        return name + "\n" + "color: \(color)" + "\n" + "paws: \(paws)"
    }
    
    mutating func changeName (newName: String) {
        name = newName
    }
    
    static func describeADog() -> String {
        "Dogs are really cute animals!"
    }
    
    init (name: String, isAdopted: Bool, color: String) {
        self.name = name
        self.isAdopted = isAdopted
        self.color = color
    }
    
    init (adopted name: String, color: String) {
        self.name = name
        self.isAdopted = true
        self.color = color
    }
    
    init (bought name: String, color: String) {
        self.init(name: name, isAdopted: false, color: color)
    }
    
    init () {
        self.init(adopted: "Milaneso", color: "Brown")
    }
}


var anotherDog = Dog()
var myDog = Dog(name: "Milaneso", isAdopted: true, color: "Brown")
myDog.isAdopted = false
myDog.name = "Dante"
myDog.paws = 3
myDog.specialNeeds
myDog.getID()
myDog.changeName(newName: "Solovino")
Dog.amountOfPaws
Dog.describeADog()

var yourDog = Dog(adopted: "Chilaquil", color: "White")
