import Foundation

//https://www.codewars.com/kata/5813d19765d81c592200001a/train/swift

func dontGiveMeFive(_ start: Int, _ end: Int) -> Int {
    (start...end).filter { !String($0).contains("5") }.count
}

// MARK: - Others



// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(8, dontGiveMeFive(1,9));
        XCTAssertEqual(12, dontGiveMeFive(4,17));
    }
}

SolutionTest.defaultTestSuite.run()
