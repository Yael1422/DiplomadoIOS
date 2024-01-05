import Foundation

enum OperationType {
    case addition
    case subtraction
    case multiplication
    case division
}

func operation(_ operationType: OperationType, firstNumber: Double, secondNumber: Double) {
    switch operationType {
    case .addition:
        print(firstNumber + secondNumber)
    case .subtraction:
        print(firstNumber - secondNumber)
    case .multiplication:
        print(firstNumber * secondNumber)
    case .division:
        print(firstNumber / secondNumber)
    }
}

operation(.addition, firstNumber: 3, secondNumber: 9)
operation(.subtraction, firstNumber: 8, secondNumber: 9)
operation(.multiplication, firstNumber: 5, secondNumber: 5)
operation(.division, firstNumber: 3, secondNumber: 0)
