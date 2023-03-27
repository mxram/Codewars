import Foundation

// https://www.codewars.com/kata/585d7d5adb20cf33cb000235/train/swift

func find_missing3(l sequence: [Int]) -> Int {
    let maxSteps = sequence.count
    let start = sequence[0]
    let end = sequence[sequence.count - 1]
    let constant = (end - start) / maxSteps
    let sum = sequence.reduce(0, +)
    let maxSum = Array(stride(from: start, through: end, by: constant)).reduce(0, +)
    return maxSum - sum
}

func find_missing2(l: [Int]) -> Int {
    let firstDif = l[1] - l[0]
    let secondDif = l[2] - l[1]
    if firstDif == secondDif {
        var prev = l[2]
        for i in 3...l.count - 1 {
            let current = l[i]
            if current - prev == firstDif {
                prev = current
                continue
            } else {
                return prev + firstDif
            }
        }
    } else if abs(firstDif) > abs(secondDif) {
        return l[0] + secondDif
    } else {
        return l[1] + firstDif
    }
    return 0
}

func find_missing(l: [Int]) -> Int {
    (l[0] + l[l.count - 1]) * (l.count + 1) / 2 - l.reduce(0, +)
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(find_missing(l: [1, 2, 3, 4, 6, 7, 8, 9]), 5)
        XCTAssertEqual(find_missing(l: [-1, -7, -10, -13, -16, -19, -22, -25, -28]), -4)
        XCTAssertEqual(find_missing(l: [-1, 2, 5, 8, 11, 14, 17, 20, 26]), 23)
        XCTAssertEqual(find_missing(l: [1, -2, -5, -8, -14, -17, -20, -23, -26]), -11)
        XCTAssertEqual(find_missing(l: [12, 4, -4, -12, -20, -28, -44, -52, -60]), -36)
        XCTAssertEqual(find_missing(l: [-13, 5, 14, 23, 32, 41, 50, 59, 68]), -4)
    }
}

SolutionTest.defaultTestSuite.run()
