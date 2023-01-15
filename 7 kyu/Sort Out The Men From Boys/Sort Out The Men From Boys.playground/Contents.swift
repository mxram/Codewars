import Foundation

// https://www.codewars.com/kata/5af15a37de4c7f223e00012d/train/swift

func menFromBoys(_ arr: [Int]) -> [Int] {
    let array = Set(arr)
    let even = array.filter { $0 % 2 == 0 }.sorted()
    let odd = array.filter { $0 % 2 != 0 }.sorted(by: >)
    return even + odd
}

func menFromBoys2(_ arr: [Int]) -> [Int] {
    let arr = Array(Set(arr))
    return arr.filter { $0 & 1 == 0 }.sorted() + arr.filter { $0 & 1 != 0 }.sorted(by: >)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(menFromBoys([7,3,14,17]), [14,17,7,3])
        XCTAssertEqual(menFromBoys([7,3,14,17]), [14,17,7,3]);
        XCTAssertEqual(menFromBoys([2,43,95,90,37]), [2,90,95,43,37]);
        XCTAssertEqual(menFromBoys([20,33,50,34,43,46]), [20,34,46,50,43,33]);
        XCTAssertEqual(menFromBoys([82,91,72,76,76,100,85]), [72,76,82,100,91,85]);
        XCTAssertEqual(menFromBoys([2,15,17,15,2,10,10,17,1,1]), [2,10,17,15,1]);
        XCTAssertEqual(menFromBoys([-32,-39,-35,-41]), [-32,-35,-39,-41]);
        XCTAssertEqual(menFromBoys([-64,-71,-63,-66,-65]), [-66,-64,-63,-65,-71]);
        XCTAssertEqual(menFromBoys([-94,-99,-100,-99,-96,-99]), [-100,-96,-94,-99]);
        XCTAssertEqual(menFromBoys([-53,-26,-53,-27,-49,-51,-14]), [-26,-14,-27,-49,-51,-53]);
        XCTAssertEqual(menFromBoys([-17,-45,-15,-33,-85,-56,-86,-30]), [-86,-56,-30,-15,-17,-33,-45,-85]);
        XCTAssertEqual(menFromBoys([12,89,-38,-78]), [-78,-38,12,89]);
        XCTAssertEqual(menFromBoys([2,-43,95,-90,37]), [-90,2,95,37,-43]);
        XCTAssertEqual(menFromBoys([82,-61,-87,-12,21,1]), [-12,82,21,1,-61,-87]);
        XCTAssertEqual(menFromBoys([63,-57,76,-85,88,2,-28]), [-28,2,76,88,63,-57,-85]);
        XCTAssertEqual(menFromBoys([49,818,-282,900,928,281,-282,-1]), [-282,818,900,928,281,49,-1]);
    }
}

SolutionTest.defaultTestSuite.run()
