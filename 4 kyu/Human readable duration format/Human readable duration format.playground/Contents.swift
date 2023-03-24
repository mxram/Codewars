import Foundation

// https://www.codewars.com/kata/52742f58faf5485cae000b9a/train/swift

func formatDuration(_ seconds: Int) -> String {
    guard seconds > 0 else { return "now" }
    let minutes = seconds / 60
    let hours = minutes / 60
    let days = hours / 24
    let years = days / 365
    
    var components: [String] = zip([years, days % 365, hours % 24, minutes % 60, seconds % 60],
                                   ["year", "day", "hour", "minute", "second"])
        .compactMap { (amount, unit) in
            guard amount > 0 else { return nil }
            let unit = unit + (amount > 1 ? "s" : "")
            return "\(amount) \(unit)"
    }
    if components.count > 1 {
        let last = components.removeLast()
        return components.joined(separator: ", ") + " and \(last)"
    }
    return components[0]
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    
    func test() {
        XCTAssertEqual(formatDuration(1), "1 second")
        XCTAssertEqual(formatDuration(62), "1 minute and 2 seconds")
        XCTAssertEqual(formatDuration(120), "2 minutes")
        XCTAssertEqual(formatDuration(3600), "1 hour")
        XCTAssertEqual(formatDuration(3662), "1 hour, 1 minute and 2 seconds")
    }
    
}

SolutionTest.defaultTestSuite.run()
