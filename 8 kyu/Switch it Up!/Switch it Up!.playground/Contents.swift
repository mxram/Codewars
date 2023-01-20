import Foundation

// https://www.codewars.com/kata/5808dcb8f0ed42ae34000031/train/swift

func switchItUp(_ number: Int) -> String {
    switch number {
    case 0:
        return "Zero"
    case 1:
        return "One"
    case 2:
        return "Two"
    case 3:
        return "Three"
    case 4:
        return "Four"
    case 5:
        return "Five"
    case 6:
        return "Six"
    case 7:
        return "Seven"
    case 8:
        return "Eight"
    case 9:
        return "Nine"
    default:
        return ""
    }
}

func switchItUp2(_ number: Int) -> String {
    switch number {
    case 0...9:
        return ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"][number]
    case _:
        return "\(number)"
    }
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(switchItUp(1), "One")
        XCTAssertEqual(switchItUp(3), "Three")
        XCTAssertEqual(switchItUp(5), "Five")
    }
}

SolutionTest.defaultTestSuite.run()
