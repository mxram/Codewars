import Foundation

// https://www.codewars.com/kata/57a0e5c372292dd76d000d7e/train/swift

func repeatStr(_ n: Int, _ string: String) -> String {
    String(repeating: string, count: n)
}

func repeatStr2(_ n: Int, _ string: String) -> String {
    var result = ""
    (1...n).forEach { _ in
        result += string
    }
    return result
}

// MARK: - Others



// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        XCTAssertEqual(repeatStr(5, "Hello"), "HelloHelloHelloHelloHello")
    }
}

SolutionTest.defaultTestSuite.run()
