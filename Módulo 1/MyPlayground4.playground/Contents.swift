import UIKit

//Protocolos
protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}


struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}


struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department: \(name)"
    }
    
    init(name: String){
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int { people.count }
    var numberOfColumns: Int { 3 }
    
    func label(forColumn column: Int) -> String {
        let columnHeader: String
        switch column {
        case 0:
            columnHeader = "Employee name"
        case 1:
            columnHeader = "Age"
        case 2:
            columnHeader = "Years of experience"
        default: fatalError("Invalid column header index!")
        }
        return columnHeader
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column for person!")
        }
    }
    
}


func printTable (_ dataSource: TabularDataSource & CustomStringConvertible) {
    var headerRow = "|"
    var columnWidths = [Int]()
    
//    for columnLabel in columnLabels {
    for index in 0..<dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: index)
        let columnHeader = "\(columnLabel) |"
        headerRow += columnHeader
        columnWidths.append(columnLabel.count)
    }
    
    print(headerRow)
    
    for index in 0..<dataSource.numberOfRows {
        //Start output string
        var output = "|"
        for columnIndex in 0..<dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: index, column: columnIndex)
            let paddingNeeded = columnWidths[columnIndex] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            output += "\(padding)\(item) |"
        }
        
        print(output)
    }
}


var department = Department(name: "Engineering")
department.add(Person(name: "Eva", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Saleh", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Amit", age: 50, yearsOfExperience: 20))

printTable(department)

print(department)

//let operationsDataSource: TabularDataSource = Department(name: "Other department")
//let engineeringDataSource = department as TabularDataSource

//let testPerson = Person(name: "Alejandro", age: 27, yearsOfExperience: 5)
//department is TabularDataSource
