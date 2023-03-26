import Foundation

// https://www.codewars.com/kata/5842df8ccbd22792a4000245/train/swift

func expandedForm(_ num: Int) -> String {
    String(num)
        .reversed()
        .compactMap { $0.wholeNumberValue }
        .enumerated()
        .map { String(Int(Double($0.1) * pow(Double(10), Double($0.0)))) }
        .filter { $0 != "0" }
        .reversed()
        .joined(separator: " + ")
}

func expandedForm2(_ num: Int) -> String {
    "\(num)"
        .reversed()
        .enumerated()
        .filter { $1 != "0" }
        .reversed()
        .map { "\($1)" + String(repeating: "0", count: $0) }
        .joined(separator: " + ")
}

func expandedForm3(_ num: Int) -> String {
    let digits = String(num)
    let maxZeros = digits.count - 1
    let parts = digits
        .enumerated()
        .filter { $0.element != "0" }
        .map { String($0.element) + String(repeating: "0", count: maxZeros - $0.offset) }
    
    return parts.joined(separator: " + ")
}

func expandedForm4(_ num: Int) -> String {
    var result: [String] = []
    "\(num)".enumerated().forEach({
        if $1 != "0" {
            result.append("\($1)" + String(repeating: "0", count: "\(num)".count - $0 - 1))
        }
    })
    return result.joined(separator: " + ")
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static let testValues = [
        (12, "10 + 2"),
        (42, "40 + 2"),
        (70304, "70000 + 300 + 4")
    ]
    
    static var allTests = [
        ("Simple Tests", tests),
    ]
    
    func tests() {
        for test in SolutionTest.testValues {
            XCTAssertEqual(expandedForm(test.0), test.1)
        }
    }
}

SolutionTest.defaultTestSuite.run()
