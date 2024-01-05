import Foundation

/// Write here your ``findAll(_:_:)`` function

func findAll<T: Equatable>(_ array: [T], _ element: T) -> [Int] {
    var positions = [Int]()
    
    for (index, value) in array.enumerated() {
        if value == element {
            positions.append(index)
        }
    }
    
    return positions
}

let positionsInt = findAll([5, 3, 7, 3, 9], 3)
print(positionsInt) // Should print [1, 3] to the console

let positionsString = findAll(["Hola", "Como", "Estas", "?", "Hola", "Hola", "Hola como estas", "Hola "], "Hola")
print(positionsString)
