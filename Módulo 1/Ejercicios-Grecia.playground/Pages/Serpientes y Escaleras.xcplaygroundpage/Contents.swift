import Foundation

var pos = 0
let final = 24
let ladders = [2:10, 9:11, 8:17, 5:16]
let snakes = [21:10, 18:7, 16:3, 23:15]


while pos < final {
    var dice = Int.random(in: 1...6)
    print("Te ha salido en el dado el número \(dice)")
    pos += dice
    
    
    if let ladderDestination = ladders[pos] {
        print("Subiste por una escalera en la posición \(pos) y llegaste a la posición \(ladderDestination).")
        pos = ladderDestination
    } else if let snakeDestination = snakes[pos] {
        print("Caíste en una serpiente en la posición \(pos) y retrocediste a la posición \(snakeDestination).")
        pos = snakeDestination
    } else {
        print("Avanzaste \(dice) casillas y estás en la posición \(pos).")
    }
}

print("¡Llegaste a la posición final \(final)! ¡Ganaste!")
