import Foundation

// https://www.codewars.com/kata/57873ab5e55533a2890000c7/train/swift

func correct(_ timeString: String?) -> String? {
    guard let time = timeString, !time.isEmpty else {
        return timeString
    }
    let separator = ":"
    let components = time.components(separatedBy: separator).compactMap({ Int($0) })
    guard components.count == 3 else {
        return nil
    }
    let sum = components.reversed().enumerated().reduce(0, { $0 + Int(pow(Double(60), Double($1.0))) * $1.1 })
    let seconds = sum % 60
    let minutes = (sum / 60) % 60
    let hours = (sum / (60 * 60)) % 24
    
    return [hours, minutes, seconds].map { String(format: "%02d", $0) }.joined(separator: separator)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    
    static var allTests = [
        ("Test Nil", testNil),
        ("Test Empty", testEmpty),
        ("Test Invalid", testInvalid),
        ("Test Valid", testValid),
    ]

    func testNil() {
        XCTAssertNil(correct(nil))
    }
    
    func testEmpty() {
        XCTAssertEqual("", correct(""))
    }
    
    func testInvalid() {
        XCTAssertNil(correct("001122"))
        XCTAssertNil(correct("00;11;22"))
        XCTAssertNil(correct("0a:1c:22"))
    }
    
    func testValid() {
        XCTAssertEqual("09:10:01", correct("09:10:01"))
        XCTAssertEqual("12:10:10", correct("11:70:10"))
        XCTAssertEqual("20:40:39", correct("19:99:99"))
        XCTAssertEqual("00:01:01", correct("24:01:01"))
        XCTAssertEqual("04:01:01", correct("52:01:01"))
    }
    
}

SolutionTest.defaultTestSuite.run()
