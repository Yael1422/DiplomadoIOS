import Foundation

enum Pet: String, CaseIterable{
    case dog = "🐶"
    case cat = "🐱"
    case mouse = "🐭"
    case parrot = "🦜"
    case turtle = "🐢"
}

let myPet = Pet(rawValue: "🐶")
let myTurtle: Pet = .turtle
let myParakeet = Pet.parrot

switch myPet {
case .dog: print("🐶")
case .cat: print("🐱")
case .mouse: print("🐭")
case .parrot: print("🦜")
case .turtle: print("🐢")
default: print(myPet?.rawValue ?? Pet.turtle.rawValue)
}

switch myPet {
case .dog: print("What a cool pet")
default: print("Meh")
}


let allCases = Pet.allCases

for pet in allCases{
    print(pet.rawValue)
}


//Ejemplo 2
enum ContactMethod {
    case email(String)
    case phone(Int)
    case mail(streetName: String, zipCode: String, streetNumber: Int)
}

var myPreferredContactMethod = ContactMethod.email("myemail@email.me")

switch myPreferredContactMethod{
case .email(let strEmail): print(strEmail)
case .phone(let num): print(num)
case .mail(streetName: let name, zipCode: let zc, streetNumber: let num): print("Address street \(name) \(num), \(zc)")
}


// Ejemplo 3    (5+4)*2
enum ArithmeticExpression{
    case number(Float)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    indirect case rest(ArithmeticExpression, ArithmeticExpression)
    indirect case division(ArithmeticExpression, ArithmeticExpression)
}


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(expression: ArithmeticExpression) -> Float {
    switch expression {
    case .number(let number): return number
    case .addition(let leftExp, let rightExp): return evaluate(expression: leftExp) + evaluate(expression: rightExp)
    case .multiplication(let leftExp, let rightExp): return evaluate(expression: leftExp) * evaluate(expression: rightExp)
    case .rest(let leftExp, let rightExp): return evaluate(expression: leftExp) - evaluate(expression: rightExp)
    case .division(let leftExp, let rightExp): return evaluate(expression: leftExp) / evaluate(expression: rightExp)
    }
}

evaluate(expression: product)


//Ejercicio 4   (6+(4*(8-1))/2)

let eight = ArithmeticExpression.number(8)
let one = ArithmeticExpression.number(1)
let six = ArithmeticExpression.number(6)
let two = ArithmeticExpression.number(2)
let res = ArithmeticExpression.rest(eight, one)
let sum2 = ArithmeticExpression.multiplication(four, res)
let div = ArithmeticExpression.division(sum2, two)
let sum3 = ArithmeticExpression.addition(six, div)

evaluate(expression: sum3)


//Ejercicio 5
class Car {
    var wheels: Int
    var color: String
    var marca: String
    init(wheels: Int, color: String, marca: String){
        self.wheels = wheels
        self.color = color
        self.marca = marca
    }
}
let myCar = Car(wheels: 4, color: "Black", marca: "Chevrolet")
myCar.color = "Blue"
let copyOfMyCar = myCar
copyOfMyCar.color = "Red"

copyOfMyCar.color
myCar.color


struct Dog {
    var name: String
    var isAdopted: Bool
}
var dante = Dog(name: "Dante", isAdopted: true)
dante.name = "Juan"

var danteClon = dante
danteClon.isAdopted = false
dante.isAdopted
danteClon.isAdopted


class Vehicle{
    var wheels: Int?
    
    init(wheels: Int){
        self.wheels = wheels
    }
}

class Scooter{
    var color: String
    
    init(color: String = "Blue"){
        self.color = color
    }
}

let myVehicle = Scooter()
