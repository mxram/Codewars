import Foundation

// https://www.codewars.com/kata/546ba103f0cf8f7982000df4/train/swift


enum Operator {
    case ADD, SUBTRACT, MULTIPLY
    
    var transform: (Int, Int) -> Int {
        switch self {
        case .ADD:
            return (+)
        case .SUBTRACT:
            return (-)
        case .MULTIPLY:
            return (*)
        }
    }
}

func calculate(_ a: String, _ b: String, _ op: Operator) -> String {
    let a = Int(a, radix: 2) ?? 0
    let b = Int(b, radix: 2) ?? 0
    var result = 0
    
    switch op {
    case .ADD:
        result = a + b
    case .SUBTRACT:
        result = a - b
    case .MULTIPLY:
        result = a * b
    }
    return String(result, radix: 2)
}

func calculate2(_ a: String, _ b: String, _ op: Operator) -> String {
    let n1 = Int(a, radix: 2)!
    let n2 = Int(b, radix: 2)!
    let result = op.transform(n1, n2)
    
    return String(result, radix: 2)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(calculate("1", "1", .ADD), "10")
        XCTAssertEqual(calculate("1", "1", .MULTIPLY), "1")
        XCTAssertEqual(calculate("10", "10", .MULTIPLY), "100")
        XCTAssertEqual(calculate("100", "10", .SUBTRACT), "10")
    }
}

SolutionTest.defaultTestSuite.run()
