import Foundation

func game(_ diceRolls: [Int]) -> Int {
    var pos = 0
    let final = 24
    let ladders = [2:10, 9:11, 8:17, 5:16]
    let snakes = [21:10, 18:7, 13:3, 23:15]

    for dice in diceRolls {
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

        if pos >= final {
            break
        }
    }

    print("¡Llegaste a la posición final \(final)! ¡Ganaste!")
    return pos
}

let rolls = [2, 3, 5, 6, 5, 4]
game(rolls)
