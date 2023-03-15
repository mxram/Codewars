import Foundation

// https://www.codewars.com/kata/556deca17c58da83c00002db/train/swift

func tribonacci(_ signature: [Int], _ n: Int) -> [Int] {
    let count = signature.count
    guard n > count else { return Array(signature.prefix(n)) }
    
    var result = signature
    for i in 0..<(n - count) {
        result.append(result[i] + result[i + 1] + result[i + 2])
    }
    return result
}

func tribonacci2(_ signature: [Int], _ n: Int) -> [Int] {
    guard signature.count <= n else { return signature[0..<n].map { $0 } }
    return tribonacci(signature + [signature.suffix(3).reduce(0, +)], n)
}

func tribonacci3(_ signature: [Int], _ n: Int) -> [Int] {
    guard n > 0 else { return [] }
    guard n > 3 else { return [] + signature.prefix(n) }
    var result = signature
    for _ in 3..<n {
        result.append(result.suffix(3).reduce(0, +))
    }
    return result
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(tribonacci([1,1,1], 10), [1,1,1,3,5,9,17,31,57,105])
        XCTAssertEqual(tribonacci([0,0,1], 10), [0,0,1,1,2,4,7,13,24,44])
        XCTAssertEqual(tribonacci([0,1,1], 10), [0, 1, 1, 2, 4, 7, 13, 24, 44, 81])
        XCTAssertEqual(tribonacci([1,0,0], 10), [1, 0, 0, 1, 1, 2, 4, 7, 13, 24])
        XCTAssertEqual(tribonacci([0,0,0], 10), [0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
        XCTAssertEqual(tribonacci([1,2,3], 10), [1, 2, 3, 6, 11, 20, 37, 68, 125, 230])
        XCTAssertEqual(tribonacci([3,2,1], 10), [3, 2, 1, 6, 9, 16, 31, 56, 103, 190])
        XCTAssertEqual(tribonacci([1,1,1], 1), [1])
        XCTAssertEqual(tribonacci([300,200,100], 0), [])
    }
}

SolutionTest.defaultTestSuite.run()
