import Foundation

// https://www.codewars.com/kata/5a53a17bfd56cb9c14000003/train/swift

func disariumNumber(_ number: Int) -> String {
    let sum = String(number)
        .compactMap { $0.wholeNumberValue }
        .enumerated()
        .reduce(0) { $0 + Int(pow(Double($1.1), Double($1.0 + 1))) }
    
    return sum == number ? "Disarium !!" : "Not !!"
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(disariumNumber(89), "Disarium !!");
        XCTAssertEqual(disariumNumber(564),"Disarium !!");
        XCTAssertEqual(disariumNumber(1024), "Not !!");
        XCTAssertEqual(disariumNumber(135), "Disarium !!");
        XCTAssertEqual(disariumNumber(136586), "Not !!");
    }
}

SolutionTest.defaultTestSuite.run()
