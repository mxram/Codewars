import Foundation

// https://www.codewars.com/kata/5bb3e299484fcd5dbb002912/train/swift

func pyramid(_ balls: Int) -> Int {
    var i = 1
    var k = 1
    while k + i < balls {
        i += 1
        k += i
    }
    return i
}

func pyramid2(_ balls: Int) -> Int {
    var b = balls, n = 0
    while b > 0 {
        n += 1
        b = b - n
    }
    return b == 0 ? n : n - 1
}

func pyramid3(_ balls: Int) -> Int {
  var balls = balls
  var level = 0
  
  while balls > level {
      level += 1
      balls -= level
  }

  return level
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(pyramid(1), 1)
        XCTAssertEqual(pyramid(3), 2)
        XCTAssertEqual(pyramid(4), 2)
        XCTAssertEqual(pyramid(6), 3)
        XCTAssertEqual(pyramid(10), 4)
        XCTAssertEqual(pyramid(15), 5)
        XCTAssertEqual(pyramid(20), 5)
        XCTAssertEqual(pyramid(100), 13)
        XCTAssertEqual(pyramid(9999) , 140)
    }
}

SolutionTest.defaultTestSuite.run()
