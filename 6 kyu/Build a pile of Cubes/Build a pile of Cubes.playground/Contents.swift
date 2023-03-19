import Foundation

// https://www.codewars.com/kata/5592e3bd57b64d00f3000047/train/swift

func findNb(_ number: Int) -> Int {
    var volume = 0
    var n = 0
    while volume < number {
        n += 1
        volume += Int(pow(Double(n), Double(3)))
    }
    return volume == number ? n : -1
}

// MARK: Others

func findNb2(_ number: Int, _ n: Int = 1) -> Int {
    let remainder = number - (n * n * n)
    return remainder > 0 ? findNb2(remainder, n + 1) : (remainder == 0 ? n : -1)
}

func findNb3(_ number: Int) -> Int {
    var n = number, x = 0
    while n > 0 { x += 1; n -= x * x * x }
    return n == 0 ? x : -1
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(findNb(4183059834009), 2022)
        XCTAssertEqual(findNb(24723578342962), -1)
        XCTAssertEqual(findNb(135440716410000), 4824)
        XCTAssertEqual(findNb(40539911473216), 3568)
        XCTAssertEqual(findNb(26825883955641), 3218)
    }
}

SolutionTest.defaultTestSuite.run()
