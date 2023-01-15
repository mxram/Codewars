import Foundation

// https://www.codewars.com/kata/5a9c35e9ba1bb5c54a0001ac/train/swift

func add3(_ x: Int, _ y: Int) -> Int {
    y == 0 ? x : add1(x ^ y, (x & y) << 1)
}

func add2(_ x: Int, _ y: Int) -> Int {
    x.advanced(by: y)
}

func add1(_ x: Int, _ y: Int) -> Int {
    var x = x
    var y = y
    
    while y != 0 {
        let carry = x & y
        x = x ^ y
        y = carry << 1
    }
    
    return x;
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(add1(1, 2), 3);
        XCTAssertEqual(add1(5, 19), 24);
        XCTAssertEqual(add1(23, 17), 40);
        
        XCTAssertEqual(add1(-14, -16), -30);
        XCTAssertEqual(add1(-50, -176), -226);
        XCTAssertEqual(add1(-10, -29), -39);
        
        XCTAssertEqual(add1(-13, 13), 0);
        XCTAssertEqual(add1(-27, 18), -9);
        XCTAssertEqual(add1(-90, 30), -60);
    }
}

SolutionTest.defaultTestSuite.run()
