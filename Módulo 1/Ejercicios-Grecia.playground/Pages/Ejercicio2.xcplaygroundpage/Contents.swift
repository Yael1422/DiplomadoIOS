import Foundation

let coordenada = (0,0)

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
