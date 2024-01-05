import Foundation

struct Stack<Element> {
    var items = [Element]()

    mutating func push(_ element: Element) {
        items.append(element)
    }

    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil }

        return items.removeLast()
    }

    func map<U>(_ transformer: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()

        for item in items {
            mappedItems.append(transformer(item))
        }

        return Stack<U>(items: mappedItems)
    }
    
    /// Add your ``myFilter(_:)`` method here

    func myFilter(_ predicate: (Element) -> Bool) -> Stack<Element> {
        var filteredItems = [Element]()

        for item in items {
            if predicate(item) {
                filteredItems.append(item)
            }
        }

        return Stack<Element>(items: filteredItems)
    }
}


var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)
stack.push(6)

// Filtrar los números pares
var newStack = stack.myFilter { $0 % 2 == 0 }

// Imprimir los elementos filtrados
while let element = newStack.pop() {
    print(element)
}
print(newStack.pop())
