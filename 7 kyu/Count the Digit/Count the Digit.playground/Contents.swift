import Foundation

// https://www.codewars.com/kata/566fc12495810954b1000030/train/swift

func nbDig(_ n: Int, _ d: Int) -> Int {
    (0...n).map { String($0 * $0) }.joined().filter { String($0) == String(d) }.count
}
// MARK: Others

func nbDig2(_ n: Int, _ d: Int) -> Int {
    (0...n).map { "\($0 * $0)".filter { $0 == Character("\(d)") } }.flatMap { $0 }.count
}

func nbDig3(_ n: Int, _ d: Int) -> Int {
  var count = 0
  for x in 0...n {
    var cube = x * x
    repeat {
      if cube % 10 == d {
        count += 1
      }
      cube = cube / 10
    } while cube >= 1
  }
  return count
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(nbDig(5750, 0), 4700)
        XCTAssertEqual(nbDig(11011, 2), 9481)
        XCTAssertEqual(nbDig(12224, 8), 7733)
        XCTAssertEqual(nbDig(11549, 1), 11905)
    }
}

SolutionTest.defaultTestSuite.run()
