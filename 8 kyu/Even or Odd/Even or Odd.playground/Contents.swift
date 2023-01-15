import Foundation

// Even or Odd
// https://www.codewars.com/kata/53da3dbb4a5168369a0000fe/train/swift

func evenOrOdd(_ number:Int) -> String {
    number % 2 == 0 ? "Even" : "Odd"
}

// MARK: - Solution 2: -




// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        XCTAssertEqual(evenOrOdd(2), "Even")
        XCTAssertEqual(evenOrOdd(0), "Even")
        XCTAssertEqual(evenOrOdd(7), "Odd")
        XCTAssertEqual(evenOrOdd(1), "Odd")
        XCTAssertEqual(evenOrOdd(-4),"Even")
        XCTAssertEqual(evenOrOdd(-3),"Odd")
    }
}

SolutionTest.defaultTestSuite.run()
