import UIKit

var greeting = "Hello, playground"
let constant = "Hola Mundo"

greeting = "Hola"

var miEnteroUno: Int = 1
var miDoble: Double = 3.0
var miString : String = "Hola"
var miBooleano: Bool = true

var numeroUno = 0.1
var numeroDos = 0.2

numeroUno += numeroDos

numeroUno + numeroDos
numeroUno - numeroDos
numeroUno / numeroDos
numeroUno * numeroDos
numeroUno > numeroDos
numeroUno < numeroDos
numeroUno >= numeroDos
numeroUno <= numeroDos
numeroUno == numeroDos
numeroUno != numeroDos

var miString2 : String = "Hola"
miString2 = "Adios"
var miString3 = "Yael"

miString2 + miString3

var edad = 24
"hola, soy Yael y tengo \(edad)"


//Arreglos
var array = [1,2,3,4]
var arrayDos = ["Pedro", "Paco", "Juan"]
var arrayTres: [Double] = [1.0,2.0,3.0]

array[0]
array.append(5)
array += [6,7,8,9]


//Set (No valores repetidos y son ordenados)
var miSet: Set<String> = ["Pedro", "Paco", "Juan"]
miSet.insert("Paco")
miSet.insert("Yael")
miSet.contains("Paco")


//Diccionario
var miDiccionarioUno: [String:String] = [:]
var miDiccionarioDos = ["Nombre":"Grecia", "Edad":"18"]

miDiccionarioDos["ColorFavorito"] = "Rojo"
miDiccionarioDos
miDiccionarioDos["Nombre"]


//Tuplas
var colorUno = "Rojo"
var codigo = "0#FFF"

var color = ("Rojo", "0#FFF")
color.0
color.1
color.self

var alumno = ("Dante Sanchez", 8)
var alumnoDos = (Nombre:"Dante Sanchez", Edad:8)
alumnoDos.Edad
alumnoDos.Nombre

