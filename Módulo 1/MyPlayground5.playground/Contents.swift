import UIKit

//Stack
//last in -first out
//push & pop
let someData: Any

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push (_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil }
        
        return items.removeLast()
    }
}

var intStack: Stack<Int> = Stack()
intStack.push(1)
intStack.push(2)

//print(intStack.pop())
//print(intStack.pop())
//print(intStack.pop())

var doubleStack: Stack<Double> = Stack()
doubleStack.push(2.0)
//print(doubleStack.pop())
//print(doubleStack.pop())


//map
func myMap<T, U> (_ items:[T], _ transformer: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        let transformedItem = transformer(item)
        result.append(transformedItem)
    }
    return result
}

let myStrings = ["one", "two", "three"]
let stringsLengths = myMap(myStrings) { $0.count }
//print(stringsLengths)

//Mapping a Stack

struct Stack2<Element> {
    var items = [Element]()
    
    mutating func push (_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil }
        
        return items.removeLast()
    }
    
    func myMap2<U> (_ transformer: (Element) -> (U)) -> Stack<U> {
        var result = [U]()
        for item in items {
            let transformedItem = transformer(item)
            result.append(transformedItem)
        }
        return Stack<U>(items: result)
    }
}

var intStack2 = Stack2<Int>()
intStack2.push(1)
intStack2.push(2)

var doubleStack2 = intStack2.myMap2 { $0 * 2 }

//print(intStack2.pop())
//print(intStack2.pop())

//print(doubleStack2.pop())
//print(doubleStack2.pop())


func checkIfEqual<T: Equatable> (_ first: T, _ second: T) -> Bool {
    return first == second
}

//print(checkIfEqual("one", "two"))
//print(checkIfEqual(1, 2.0))


func checkIfDescriptionsMatch <T: CustomStringConvertible, U: CustomStringConvertible> (_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}

//print(checkIfDescriptionsMatch(Int(1), UInt(1)))
//print(checkIfDescriptionsMatch(Int(1), 1.0))
//print(checkIfDescriptionsMatch(Float(1), Double(1.0)))


//protocol IteratorProtocol {
//    associatedtype Element
//    mutating func next() -> Element?
//}
//
//protocol Sequence {
//    associatedtype Iterator: IteratorProtocol
//    associatedtype Element where Element == Iterator.Element
//
//    func makeIterator() -> Iterator
//}

struct Stack3<Element>: Sequence {
    typealias Iterator = StackIterator
    typealias Element = StackIterator<Element>.Element
    
    var items = [Element]()
    
    mutating func push (_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil }
        
        return items.removeLast()
    }

    mutating func pushAll<S: Sequence> (_ sequence: S) where S.Element == Element {
        for item in sequence {
            self.push(item)
        }
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
}

struct StackIterator<T>: IteratorProtocol {
    typealias Element = T
    
    var stack: Stack3<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

var myStack = Stack3<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

let mySet: Array<Int> = [1,2,3,4]
myStack.pushAll(mySet)

for value in myStack {
    print("For in loop: got \(value)")
}
    
//var myStackIterator = StackIterator(stack: myStack)
//while let value = myStackIterator.next() {
//    print(value)
//}
