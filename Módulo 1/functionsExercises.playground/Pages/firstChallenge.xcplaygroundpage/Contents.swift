import Foundation

/// You can ignore lines 8 to 17, asume that the constant ``name``  contains a **Named Tuple of Strings**
/// For testing locally you can comment lines 8 to 17 and remove the `//` from line 19

/// **Remember to comment line 17 and remove the `//` from line 8 to 17 before submitting your code**

let name: (first: String, middle: String?, last: String)
if CommandLine.arguments.count > 3 {
    name.first = CommandLine.arguments[1]
    name.middle = CommandLine.arguments[2]
    name.last = CommandLine.arguments[3]
} else {
    name.first = CommandLine.arguments[1]
    name.middle = nil
    name.last = CommandLine.arguments[2]
}


func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle, middleName.count > 10 else {
        print("Hey there!")
        return
    }
    print("Hey, \(name.first) \(middleName.first!). \(name.last)")
}

//let name = (first: "Alois", middle: "Rumpelstiltskin", last: "Chaz")

// print the greeting
greetByMiddleName(fromFullName: name)
