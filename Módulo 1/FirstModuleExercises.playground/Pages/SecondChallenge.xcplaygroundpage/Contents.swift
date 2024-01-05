import Foundation

func comparison(number: Int) {
    if number > 0 {
        print("positive")
    } else if number < 0 {
        print("negative")
    } else {
        print("zero")
    }
}


comparison(number: -1)
comparison(number: 1)
comparison(number: 0)
