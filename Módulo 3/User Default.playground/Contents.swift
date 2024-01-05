import UIKit

let defaults = UserDefaults.standard

//Guardar un dato
defaults.set(5, forKey: "Entero")
defaults.setValue("5", forKey: "String")
defaults.setValue(["Uno", "Dos"], forKey: "Array")

//Recuperar un dato
let numero = defaults.object(forKey: "Entero")
let numeroDos = defaults.integer(forKey: "Entero")
defaults.integer(forKey: "String")
defaults.array(forKey: "Array")

numeroDos + 3

struct myStruct: Codable {
    var variableUno: String
    var variableDos: Int
}

let myArray = [myStruct(variableUno: "Uno", variableDos: 1), myStruct(variableUno: "Dos", variableDos: 2)]

//Guardar dato
if let encodedData = try? JSONEncoder().encode(myArray) {
    defaults.set(encodedData, forKey: "myArrayKey")
}

if let saveData = defaults.data(forKey: "myArrayKey"), let decodedArray = try? JSONDecoder().decode([myStruct].self, from: saveData) {
    print(decodedArray[0])
} else {
    
}
