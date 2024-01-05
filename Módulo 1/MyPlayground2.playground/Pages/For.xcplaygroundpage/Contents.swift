import Foundation

for i in 1...5 {
    print(i)
}

print("\n\n\n")
/*===========================================================*/

let numbers = [1,3,5,7]

for number in 0...numbers.count {
    print(number)
}

print("\n\n\n")
/*===========================================================*/

let intervals = stride(from: 0, to:20, by:5) //No incluye el 20
let intervals2 = stride(from: 0, through:20, by:5) //Incluye el 20

for intervalo in intervals{
    print(intervalo)
}

print("\n\n\n")
/*===========================================================*/

let pokemon = ["Fire": "Charmander", "Water": "Mudkip", "Grass": "Turtwig", "Electric": "Pikachu"]

for (type, name) in pokemon {
    print("I like \(name) of type \(type) ")
}

print("\n\n\n")

for poke in pokemon {
    print("I like \(poke.value) of type \(poke.key) ")
}

/*===========================================================*/

let names: Set = ["James", "Dean", "Sam", "Steve", "Chris"]
print("\n For-in loop with counter as index")
var index = 0
for _ in names {
    print(index)
    index += 1
}
print("\n\n\n")


print("\n For-in loop enumerated")
for (index2, name) in names.enumerated() {
    print(index2, name)
}
print("\n\n\n")


for (index, pokemon) in pokemon.enumerated() {
    print("\(index), \(pokemon)")
}
print("\n\n\n")


for (index, (type, name)) in pokemon.enumerated() {
    print("\(index), \(type) \(name)")
}
print("\n\n\n")


for (index, name) in names.enumerated() {
    if index % 2 == 0 {
        print(name)
    }else {
        break
    }
}
print("\n\n\n")


for (index, name) in names.enumerated() {
    if index % 2 == 0 {
        continue
    }
    print(name)
}
print("\n\n\n")


for (index, name) in names.enumerated() where index % 2 == 0{
    print(name)
}
print("\n\n\n")


for poke in pokemon where poke.key == "Fire" {
    print(poke.value)
}
print("\n\n\n")
