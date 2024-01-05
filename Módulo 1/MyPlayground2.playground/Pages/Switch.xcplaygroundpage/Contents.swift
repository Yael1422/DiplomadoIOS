import Foundation

let animal = "dog"

switch animal {
case "dog": print("🐶")
case "cat": print("🐱")
case "mouse": print("🐭")
case "bird": print("🦜")
default: break
}


switch animal {
case "dog", "cat": print("A mi me gustan de esos")
default: print("Meh")
}


let grade = 9

switch grade{
case ...5: print("Failed")
case 6..<9: print("Meh")
case 9: print("9 is great!!")
case 10: print("WOW")
default: print(":v")
}


let color = (255,255,2)
switch color {
case (_,_,255):
    print("Max Blue")
    fallthrough
case (_,1,_): print("Max green")
case (255,_,_): print("Max red")
default: break
}


switch color {
case let (255, g, b) where g < 255:
    print("Max red with green \(g) and blue \(b)")
case (let r, let g, 255):
    print("red: \(r), green: \(g), max blue")
case let (r,255,b):
    print("red: \(r), max green, blue: \(b)")
default: break
}

/*
 Ejercicio
 Basado en un plano cartesiano, implementar las siguientes reglas con switch:
 - Indicar si la coordenada está en el cuadrante 1,2,3 o 4
 - Indicar si la coordenada se encuentra en los ejes (imprimir el valor en el eje)
 - Indicar si la coordenada está en el origen
 */

let coordenada = (5,0)

switch coordenada {
case (0,0):
    print("Estas en el origen")
case (0,-5...5):
    print("Esta en el eje y: \(coordenada)")
case (-5...5,0):
    print("Esta en el eje x: \(coordenada)")
case (0...5,0...5):
    print("Estas en el cuadrante 1")
case (...0,0...5):
    print("Estas en el cuadrante 2")
case (...0,...0):
    print("Estas en el cuadrante 3")
case (0...5,...0):
    print("Estas en el cuadrante 4")
default:
    print("Estas fuera del rango")
}


/*Fin ejercicio*/

guard animal == "dog" else {
    fatalError("It´s not a dog 🥲")
}
