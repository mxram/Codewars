import Foundation

// https://www.codewars.com/kata/5a99a03e4a6b34bb3c000124/train/swift

func numPrimoral(_ number: UInt) -> UInt {
    var count = 0
    var result: UInt = 1
    var num: UInt = 2
    
    while count != number {
        if isPrime(num) {
            count += 1
            result *= num
        }
        num += 1
    }
    
    return result
}

func isPrime(_ number: UInt) -> Bool {
    number > 1 && !(2..<number).contains { number % $0 == 0 }
}

func numPrimoral2( _ number: UInt ) -> UInt {
    var n = 2
    var primes = [UInt]()
    
    while primes.count < number {
        if primes.allSatisfy({ n % Int($0) != 0 }) {
            primes.append(UInt(n))
        }
        
        n += 1
    }
    
    return primes.reduce(1, *)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(numPrimoral(3), 30);
        XCTAssertEqual(numPrimoral(4), 210);
        XCTAssertEqual(numPrimoral(5), 2310);
        XCTAssertEqual(numPrimoral(8), 9699690);
        XCTAssertEqual(numPrimoral(9), 223092870);
    }
}

SolutionTest.defaultTestSuite.run()
