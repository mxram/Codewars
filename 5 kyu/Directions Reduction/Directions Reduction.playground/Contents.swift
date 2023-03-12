import Foundation

// https://www.codewars.com/kata/550f22f4d758534c1100025a/train/swift

func dirReduc(_ arr: [String]) -> [String] {
    let opposite = ["NORTH": "SOUTH",
                    "SOUTH": "NORTH",
                    "EAST": "WEST",
                    "WEST": "EAST"]
    var directions = arr
    var index = 1
    while index < directions.count {
        if opposite[directions[index]] == directions[index - 1] {
            directions.removeSubrange((index - 1)...index)
            index = 1
        } else {
            index += 1
        }
    }
    return directions
}

// MARK: - Solution 2 -

/*
func dirReduc(_ arr: [String]) -> [String] {
    var result = [String]()
    let dict = ["NORTH":"SOUTH", "SOUTH":"NORTH", "WEST": "EAST", "EAST":"WEST"]
    arr.forEach {
        if result.last == dict[$0] {
            result.removeLast()
        } else {
            result.append($0)
        }
    }
    return result
}
*/


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("dirReduc", testExample),
    ]

    func testing(_ arr: [String], _ expected: [String]) {
        let ans = dirReduc(arr)
        XCTAssertTrue(ans == expected, "should return \(expected), got \(ans)")
    }
     
    func testExample() {
        var a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
        testing(a, ["WEST"])
        a = ["EAST", "EAST", "WEST", "NORTH", "WEST", "EAST", "EAST", "SOUTH", "NORTH", "WEST"]
        testing(a, ["EAST", "NORTH"])
        a = ["NORTH", "WEST", "SOUTH", "EAST"]
        testing(a, ["NORTH", "WEST", "SOUTH", "EAST"])
    }
}

SolutionTest.defaultTestSuite.run()
