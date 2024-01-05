import Foundation

func multiply(number: Int) {
    for i in 1...10 {
        let result = number * i
        print("\(number) * \(i) = \(result)")
    }
}

multiply(number: 5)
