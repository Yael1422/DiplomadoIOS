import Foundation
import XCTest

class SieveTest: XCTestCase {

    func testPrimes() {
        // given
        let firstTestInput = 10
        let secondTestInput = 50
        let thirdTestInput = 85

        // when
        let firstPrimeNumbers = PrimeCalculator.calculate(upTo: firstTestInput)
        let secondPrimeNumbers = PrimeCalculator.calculate(upTo: secondTestInput)
        let thirdPrimeNumbers = PrimeCalculator.calculate(upTo: thirdTestInput)

        // then
        XCTAssertEqual(firstPrimeNumbers.count, 4)
        XCTAssertEqual(secondPrimeNumbers.count, 15)
        XCTAssertEqual(thirdPrimeNumbers.count, 23)
    }
}

class PrimeCalculator {
    static func calculate(upTo maxNumber: Int) -> [Int] {
        guard maxNumber >= 2 else { return [] }
        
        var isPrime = Array(repeating: true, count: maxNumber + 1)
        isPrime[0] = false
        isPrime[1] = false
        
        var primes: [Int] = []
        
        for number in 2...maxNumber {
            if isPrime[number] {
                primes.append(number)
                
                for multiple in stride(from: number * number, through: maxNumber, by: number) {
                    isPrime[multiple] = false
                }
            }
        }
        
        print(primes) // Imprime la lista de números primos
        return primes
    }
}

SieveTest.defaultTestSuite.run()
