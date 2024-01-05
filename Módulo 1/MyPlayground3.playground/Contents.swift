import Foundation

//func myAwsomePrintingFunction(name: String){
//    print("Hello \(name)! Welcome to the class")
//}
//
//myAwsomePrintingFunction(name: "Yael")



//func add(lhs: Int, rhs: Int){
//        print("\(lhs) + \(rhs) = \(lhs + rhs)")
//}
//
//add(lhs: 2, rhs: 2)



//func printWelcomeMessage(to name: String, course: String = "Diplomado iOS"){
//    print("Hello, \(name), welcome to \(course)")
//}
//
//printWelcomeMessage(to: "Yael", course: "Diplomado Android")
//printWelcomeMessage(to: "Yael")



//var error = "The process failed: "
//
//func appendErrorCode(_ code: Int, toErrorString errorString: inout String){
//    if code == 400{
//        errorString += "bad request."
//    }
//}
//
//print(error)
//appendErrorCode(400, toErrorString: &error)
//print(error)



//func welcomeMessage(to name: String) -> String {
//    return "Welcome \(name)"
//}
//
//print(welcomeMessage(to: "Yael"))



//func areaOfTriangleWith(base: Double, height: Double) -> Double {
//    let rectangle = base * height
//
//    func divide() -> Double {
//        return rectangle/2
//    }
//
//    return divide()
//}
//
//print(areaOfTriangleWith(base: 3, height: 5))



//func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]){
//    var evens = [Int]()
//    var odds = [Int]()
//
//    for number in numbers {
//        if number % 2 == 0{
//            evens.append(number)
//        } else {
//            odds.append(number)
//        }
//    }
//
//    return (evens: evens, odds: odds)
//}
//
//let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 27, 84]
//let sortedEvenAndOddNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
//print("The even numbers are: \(sortedEvenAndOddNumbers.evens)")
//print("The odds numbers are: \(sortedEvenAndOddNumbers.odds)")



//func grabMiddelName(fullName name: (first: String, middle: String?, last: String)) -> String? {
//    return name.middle
//}
//
//let middleName = grabMiddelName(fullName: (first: "Yael ", middle: "middle Name", last: "Puente"))
//
//if let middleName = middleName{
//    print(middleName)
//}



//func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String), age: Int ) {
//
//    guard let middleName = name.middle, age > 18 else {
//        print("Hey there!")
//        return
//    }
//    print("Hey, \(middleName)")
//}
//
//greetByMiddleName(fromFullName: (first: "Gandhi", middle: nil, last: "Puente"), age: 18)
//greetByMiddleName(fromFullName: (first: "Gandhi", middle: "Yael", last: "Puente"), age: 19)



func sortedEvenOddNumbers(_ numbers: [Int]) -> (even: [Int], odd: [Int]) {
    return (even: [], odd: [])
}

let myFunction: ([Int]) -> ([Int], [Int]) = sortedEvenOddNumbers
myFunction([])
