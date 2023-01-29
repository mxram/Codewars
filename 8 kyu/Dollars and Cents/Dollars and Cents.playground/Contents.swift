import Foundation

// https://www.codewars.com/kata/55902c5eaa8069a5b4000083/train/swift

func formatMoney(_ val: Double) -> String {
    .init(format: "$%.2f", val)
}

func formatMoney2(_ val: Double) -> String {
    let nf = NumberFormatter()
    nf.numberStyle = .currency
    nf.locale = .init(identifier: "en_US")
    nf.currencyGroupingSeparator = ""
    nf.minimumIntegerDigits = 1
    
    return nf.string(from: NSNumber(value: val)) ?? ""
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(formatMoney(0), "$0.00")
        XCTAssertEqual(formatMoney(3), "$3.00")
        XCTAssertEqual(formatMoney(3.1), "$3.10")
        XCTAssertEqual(formatMoney(3.10), "$3.10")
        XCTAssertEqual(formatMoney(3.100), "$3.10")
        XCTAssertEqual(formatMoney(3.1000000), "$3.10")
        XCTAssertEqual(formatMoney(39.99), "$39.99")
        XCTAssertEqual(formatMoney(314.16), "$314.16")
        XCTAssertEqual(formatMoney(123456789.166666), "$123456789.17")
    }
}

SolutionTest.defaultTestSuite.run()
