import Foundation

// https://www.codewars.com/kata/58649884a1659ed6cb000072/train/swift

enum Light: String {
    case green, yellow, red
}

func update_light(_ current: String) -> String {
    guard let light = Light(rawValue: current) else { fatalError() }
    
    let nextLight: Light
    switch light {
    case .green: nextLight = .yellow
    case .yellow: nextLight = .red
    case .red: nextLight = .green
    }
    return nextLight.rawValue
}
// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(update_light("red"), "green")
    }
}

SolutionTest.defaultTestSuite.run()
