import Foundation

/// You can ignore line 8, asume that the constant ``groceryList`` will contain an **Array of Strings**
/// For testing locally you can comment line 8 and remove the `//` from line 9

/// **Remember to comment line 9 and remove the `//` from line 8 before submitting your code**

let groceryList: [String] = Array(CommandLine.arguments.dropFirst())
//let groceryList: [String] = ["green beans", "milk", "black beans", "pinto beans", "apples"]


func siftBeans(fromGroceryList list: [String]) -> (beans: [String], otherGroceries: [String]) {
    var beans: [String] = []
    var otherGroceries: [String] = []

    for item in list {
        if item.hasSuffix("beans") {
            beans.append(item)
        } else {
            otherGroceries.append(item)
        }
    }

    return (beans, otherGroceries)
}

let result = siftBeans(fromGroceryList: groceryList)

// Print the array of beans
print(result.beans) // ["green beans", "black beans", "pinto beans"]

// Print the array of other groceries
print(result.otherGroceries) // ["milk", "apples"]
