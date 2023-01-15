import Foundation

// https://www.codewars.com/kata/5a00e05cc374cb34d100000d/train/swift

func reverseSeq(n: Int) -> [Int] {
    (1...n).reversed()
}
    
func reverseSeq2(n: Int) -> [Int] {
  var numbers: [Int] = []
  var i = n
  while i > 0 {
      numbers.append(i)
      i -= 1
  }
    
  return numbers
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual( [5,4,3,2,1], reverseSeq(n: 5))
    }
}

SolutionTest.defaultTestSuite.run()
