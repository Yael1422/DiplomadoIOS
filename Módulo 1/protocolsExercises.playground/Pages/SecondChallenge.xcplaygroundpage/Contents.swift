import Foundation

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }

    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

/// Add here your new type that conforms to ``TabularDataSource``

struct Book {
    let title: String
    let author: String
    let averageReviews: Double
}

struct BookCollection: TabularDataSource, CustomStringConvertible {
    let name: String
    var books = [Book]()

    var description: String {
        return "Book Collection: \(name)"
    }
    
    init(name: String){
        self.name = name
    }
    
    mutating func add(_ book: Book) {
        books.append(book)
    }
    
    var numberOfRows: Int { books.count }
    var numberOfColumns: Int { return 3 }

    func label(forColumn column: Int) -> String {
        let columnHeader: String
        switch column {
        case 0:
            columnHeader = "Title"
        case 1:
            columnHeader = "Author"
        case 2:
            columnHeader = "Average Reviews"
        default: fatalError("Invalid column header index!")
        }
        return columnHeader
    }

    func itemFor(row: Int, column: Int) -> String {
        let book = books[row]

        switch column {
        case 0: return book.title
        case 1: return book.author
        case 2: return String(book.averageReviews)
        default: fatalError("Invalid column for person!")
        }
    }
}


func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    print(dataSource)
    var headerRow = "|"
    var columnWidths = [Int](repeating: 0, count: dataSource.numberOfColumns) // Initialize with zeros

    for columnIndex in 0..<dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: columnIndex)
        let columnHeader = "\(columnLabel) |"
        headerRow += columnHeader

        for rowIndex in 0..<dataSource.numberOfRows {
            let item = dataSource.itemFor(row: rowIndex, column: columnIndex)
            if item.count > columnWidths[columnIndex] {
                columnWidths[columnIndex] = item.count
            }
        }
    }

    print(headerRow)

    for index in 0..<dataSource.numberOfRows {
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



var bookCollection = BookCollection(name: "Fear")
bookCollection.add(Book(title: "It", author: "Stephen King", averageReviews: 3.5))
bookCollection.add(Book(title: "It", author: "Stephen King", averageReviews: 4))
bookCollection.add(Book(title: "It", author: "Stephen King", averageReviews: 89.12))

printTable(bookCollection)
