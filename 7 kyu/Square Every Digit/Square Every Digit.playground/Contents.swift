import Foundation

// https://www.codewars.com/kata/546e2562b03326a88e000020/train/swift

func squareDigits(_ num: Int) -> Int {
    let string = String(num)
    var newString = ""
    for c in string {
        let cNum = c.wholeNumberValue ?? 0
        let squared: Int = cNum * cNum
        newString.append("\(squared)")
    }
    
    return Int(newString) ?? 0
}

// MARK: - Others
func squareDigits2(_ num: Int) -> Int {
    let a = "\(num)".compactMap { $0.wholeNumberValue ?? 0 }
    let b = a.compactMap { "\($0 * $0)" }.joined()
    return Int(b) ?? 0
}

func squareDigits3(_ num: Int) -> Int {
    Int(String(num).compactMap { $0.wholeNumberValue }.compactMap { String($0 * $0) }.joined()) ?? 0
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(squareDigits(9119), 811181)
        XCTAssertEqual(squareDigits(0), 0)
    }
}

SolutionTest.defaultTestSuite.run()
