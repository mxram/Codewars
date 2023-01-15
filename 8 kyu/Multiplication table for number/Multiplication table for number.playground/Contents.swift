import Foundation

// Multiplication table for number
// https://www.codewars.com/kata/5a2fd38b55519ed98f0000ce/train/swift

func multi_table(_ number: Int) -> String {
    var strings: Array<String> = Array(repeating: "", count: 10)
    for i in strings.indices {
        strings[i] = "\(i+1) * \(number) = \((i+1) * number)"
    }
    return strings.joined(separator: "\n")
}

// MARK: - Solution 2: -


func multi_table2(_ number: Int) -> String {
    (1...10)
        .map {"\($0) * \(number) = \($0 * number)"}
        .joined(separator: "\n")
}


// MARK: - Tests -


import XCTest
// XCTest Spec Example:
// TODO: replace with your own tests (TDD), these are just how-to examples to get you started

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Tests Example", testsExample),
    ]

    func testsExample() {
        XCTAssertEqual(multi_table(5),"1 * 5 = 5\n2 * 5 = 10\n3 * 5 = 15\n4 * 5 = 20\n5 * 5 = 25\n6 * 5 = 30\n7 * 5 = 35\n8 * 5 = 40\n9 * 5 = 45\n10 * 5 = 50")
        XCTAssertEqual(multi_table(1), "1 * 1 = 1\n2 * 1 = 2\n3 * 1 = 3\n4 * 1 = 4\n5 * 1 = 5\n6 * 1 = 6\n7 * 1 = 7\n8 * 1 = 8\n9 * 1 = 9\n10 * 1 = 10")
    }
}

SolutionTest.defaultTestSuite.run()
