import Foundation

enum ArithmeticExpression{
    case number(Float)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    indirect case rest(ArithmeticExpression, ArithmeticExpression)
    indirect case division(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Float {
    switch expression {
    case .number(let number): return number
    case .addition(let leftExp, let rightExp): return evaluate(expression: leftExp) + evaluate(expression: rightExp)
    case .multiplication(let leftExp, let rightExp): return evaluate(expression: leftExp) * evaluate(expression: rightExp)
    case .rest(let leftExp, let rightExp): return evaluate(expression: leftExp) - evaluate(expression: rightExp)
    case .division(let leftExp, let rightExp): return evaluate(expression: leftExp) / evaluate(expression: rightExp)
    }
}

let eight = ArithmeticExpression.number(8)
let one = ArithmeticExpression.number(1)
let four = ArithmeticExpression.number(4)
let six = ArithmeticExpression.number(6)
let two = ArithmeticExpression.number(2)
let res = ArithmeticExpression.rest(eight, one)
let sum2 = ArithmeticExpression.multiplication(four, res)
let div = ArithmeticExpression.division(sum2, two)
let sum3 = ArithmeticExpression.addition(six, div)

//Ejercicio 4   (6+(4*(8-1))/2)

print(evaluate(expression: sum3))
