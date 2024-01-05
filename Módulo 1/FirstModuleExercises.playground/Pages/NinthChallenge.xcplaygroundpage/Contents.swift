import Foundation

struct Person {
    let name: String
    let age: Int
}

func findAgeDifference(for people: [Person]) -> String {
    guard !people.isEmpty else {
        return "The family array is empty."
    }
    
    var oldestPerson = people[0]
    var youngestPerson = people[0]
    
    for person in people {
        if person.age > oldestPerson.age {
            oldestPerson = person
        }
        if person.age < youngestPerson.age {
            youngestPerson = person
        }
    }
    
    let ageDifference = oldestPerson.age - youngestPerson.age
    return "oldest: \(oldestPerson.age), youngest: \(youngestPerson.age), ageDifference: \(ageDifference)"
}

let son = Person(name: "Juan", age: 19)
let daughter = Person(name: "Maria", age: 12)
let mother = Person(name: "Benita", age: 60)
let father = Person(name: "Camilo", age: 58)

let family = [daughter, son, mother, daughter]

print(findAgeDifference(for: family))
