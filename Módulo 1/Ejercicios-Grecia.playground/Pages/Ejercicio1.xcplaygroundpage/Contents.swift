import UIKit

//Crear una variable llamada "weather" que puede tener 2 posibles valores lluvia y nieve. De igual modo, crear una variable "time", con la hora del día (0-23)
//


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
