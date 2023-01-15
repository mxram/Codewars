import Foundation

//https://www.codewars.com/kata/5f70c883e10f9e0001c89673/train/swift

func flip(_ direction: String, _ a: [Int]) -> [Int] {
    // Do some magic
    direction == "L" ? a.sorted(by: >) : a.sorted(by: <)
}

func flip2(_ direction: String, _ a: [Int]) -> [Int] {
  return a.sorted(by: direction == "L" ? (>) : (<))
}

// MARK: - Others: -

func flip1(_ direction: String, _ a: [Int]) -> [Int] {
  switch direction {
    case "R":
        return a.sorted(by: <)
    case "L":
        return a.sorted(by: >)
    default:
        return []
    }
}


// MARK: - Tests -

import XCTest

class Tests: XCTestCase {
    func tests() {
        XCTAssertEqual(flip("R", [3, 2, 1, 2]), [1, 2, 2, 3])
        XCTAssertEqual(flip("L", [1, 4, 5, 3, 5]), [5, 5, 4, 3, 1])
    }
}

Tests.defaultTestSuite.run()
