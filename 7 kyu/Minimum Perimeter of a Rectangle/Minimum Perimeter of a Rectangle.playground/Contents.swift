import Foundation

// https://www.codewars.com/kata/5826f54cc60c7e5266000baf/train/swift

func minimumPerimeter(_ area: Int64) -> Int64 {
    var l = Int64(sqrt(Double(area)))
    while !area.isMultiple(of: l) {
        l -= 1
    }
    return 2 * (l + area / l)
}

func minimumPerimeter2(_ area: Int64) -> Int64 {
    let closestFactor = Int64(sqrt(Double(area)).rounded(.up))
    for i in (1...closestFactor).reversed() {
        if area.isMultiple(of: i) {
            print(closestFactor, i, area)
            return 2 * (i + area / i)
        }
    }
    return 0
}

// MARK: Tests
import XCTest

class SolutionTest: XCTestCase {
    
    func doTest(n: Int64, expected: Int64) {
        let actual = minimumPerimeter(n)
        XCTAssertEqual(actual, expected)
    }

    func test() {
        doTest(n: 45, expected: 28)
        doTest(n: 30, expected: 22)
        doTest(n: 81, expected: 36)
        doTest(n: 89, expected: 180)
        doTest(n: 10000019, expected: 20000040)
        doTest(n: 982451653, expected: 1964903308)
    }
}

SolutionTest.defaultTestSuite.run()
