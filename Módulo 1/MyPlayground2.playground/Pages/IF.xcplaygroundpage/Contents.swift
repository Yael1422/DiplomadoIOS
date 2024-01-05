import UIKit

let animal = "dog"
let number = 2

if animal == "dog" {
    print("It´s a dog!!")
} else {
    print("Not a dog :(")
}


if animal != "dog" {
    print("Not a dog :(")
} else {
    print("It´s a dog!!")
}


if !(animal == "dog") {
    print("Not a dog :(")
} else {
    print("It´s a dog!!")
}


if animal.count <= 4 {
    print("Less than 4 letters")
} else {
    print("Too many letters 😱😩")
}


if animal == "dog" || animal == "cat" {
    print("Common pet")
} else {
    print("What is it?!")
}


if animal == "dog" && animal == "cat" {
    print("Common pet")
} else {
    print("What is it?!")
}


if animal == "dog" {
    print("It´s a dog")
} else if number == 2 {
    print("Number 2!!")
} else {
    print("It´s not a dog")
}


number == 2 ? print("It´s 2!") : print("some toher number")

var value = number == 2 ? "It´s 2!" : "Some other number"


/*
Ejercicio
*/

var weather = "lluvia"
//let weather = "nieve"
let time = 20
//let time = 13

var dark = Array(0...6) + Array(19...23)
var light = 7...18

if weather == "lluvia" {
    print("🌧️")
} else if weather == "nieve" {
    print("🌨️")
}

if light ~= time {
    print("Usar bloqueador")
} else {
    print("No usar bloqueador")
}
