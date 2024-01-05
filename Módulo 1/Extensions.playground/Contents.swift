import UIKit

//Extensions
struct Car {
    let maker: String
    let model: String
    let year: Int
    
    var fuelLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1")
        }
    }
}


extension Car: CustomStringConvertible {
    var description: String {
        "\(maker) - \(model)"
    }
}


//Initializers
extension Car {
    init (maker: String, model: String) {
        self.init(maker: maker, model: model, year: 2023, fuelLevel: 1.0)
    }
}


//Nested type
extension Car {
    enum Era {
        case vintage, classic, modern
    }
    var era: Era {
        switch year {
        case ...1990:
            return .vintage
        case 1991...2000:
            return .classic
        case 2001...:
            return .modern
        default:
            return .modern
        }
    }
}


//Add method
extension Car {
    mutating func fillFuel() {
        fuelLevel = 1.0
    }
}

var firstCar = Car(maker: "Honda", model: "Civic", year: 2000, fuelLevel: 0.5)
let secondCar = Car(maker: "Nissan", model: "")

print(firstCar.fuelLevel)
firstCar.fillFuel()
print(firstCar.fuelLevel)



import Foundation

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }

    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    print(dataSource)
    var headerRow = "|"
    var columnWidths = [Int]()

    for columnIndex in 0..<dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: columnIndex)
        let columnHeader = " \(columnLabel) |"
        headerRow += columnHeader
        columnWidths.append(columnLabel.count)
        
        var maxWidth = columnLabel.count // Initialize with the label width
        
        for rowIndex in 0..<dataSource.numberOfRows {
            let item = dataSource.itemFor(row: rowIndex, column: columnIndex)
            if item.count > maxWidth {
                maxWidth = item.count
            }
        }

        columnWidths.append(maxWidth)
        
    }

    print(headerRow)

    for rowIndex in 0..<dataSource.numberOfRows {
        // Start the output string
        var output = "|"

        // Append each item in this row to the string
        for rowColumnIndex in 0..<dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: rowIndex, column: rowColumnIndex)
            let paddingNeeded = columnWidths[rowColumnIndex] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")

            output += " \(padding)\(item) |"
        }

        // Done - print it!
        print(output)
    }
}


func printTable(_ dataSource: TabularDataSource) {
    let headerRow = (0..<dataSource.numberOfColumns).map { dataSource.label(forColumn: $0) }
    let header = headerRow.joined(separator: " | ")
    print(header)

    for i in 0..<dataSource.numberOfRows {
        var row = [String]()
        for j in 0..<dataSource.numberOfColumns {
            row.append(dataSource.itemFor(row: i, column: j))
        }
        let rowString = row.joined(separator: " | ")
        print(rowString)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people: [Person] = []

    init(name: String) {
        self.name = name
    }

    mutating func add(_ person: Person) {
        people.append(person)
    }

    var numberOfRows: Int { people.count }

    var numberOfColumns: Int { 3 }

    func label(forColumn column: Int) -> String {
        let label: String

        switch column {
        case 0: label = "Employee name"
        case 1: label = "Age"
        case 2: label = "Years of experience"
        default: fatalError("Invalid column!")
        }

        return label
    }

    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]

        let item: String
        switch column {
        case 0: item = person.name
        case 1: item = String(person.age)
        case 2: item = String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }

        return item
    }

    var description: String { "Department: \(name)" }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Eva", age: 1000, yearsOfExperience: 6))
department.add(Person(name: "Saleh", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Amit", age: 50, yearsOfExperience: 20))

printTable(department)
