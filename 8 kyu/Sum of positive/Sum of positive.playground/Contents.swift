import Foundation

// Sum of positive
// https://www.codewars.com/kata/5715eaedb436cf5606000381

func sumOfPositives1(_ numbers: [Int]) -> Int {
    var sum = 0
    for number in numbers {
        if number > 0 {
            sum += number
        }
    }
    
    return sum
}

// MARK: - Others

func sumOfPositives(_ numbers: [Int]) -> Int {
    numbers.reduce(0) { $0 + ($1 > 0 ? $1 : 0) }
}

func sumOfPositives2(_ numbers: [Int] ) -> Int {
    return numbers.filter { $0 > 0 }.reduce(0, +)
}

func sumOfPositives3(_ numbers: [Int] ) -> Int {

    return numbers.reduce (0) {$0 + max($1, 0)}
}


// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        XCTAssertEqual(sumOfPositives([1,2,3,4,5]), 15);
        XCTAssertEqual(sumOfPositives([1,-2,3,4,5]), 13);
        XCTAssertEqual(sumOfPositives([-1,2,3,4,-5]), 9);
        XCTAssertEqual(sumOfPositives([]), 0);
    }
}

SolutionTest.defaultTestSuite.run()
