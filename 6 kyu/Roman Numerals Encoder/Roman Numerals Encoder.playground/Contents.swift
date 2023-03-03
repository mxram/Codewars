import Foundation

// https://www.codewars.com/kata/51b62bf6a9c58071c600001b/train/swift

func solution(_ number: Int) -> String {
    let numbers: [Int: Character] = [1: "I",
                                     5: "V",
                                     10: "X",
                                     50: "L",
                                     100: "C",
                                     500: "D",
                                     1000: "M"]
    let transform: (Int) -> [Int] = {
        var result = [Int]()
        
        switch $0 {
        case 4:
            result = [1, 5]
        case 5:
            result = [5]
        case 9:
            result = [1, 10]
        default:
            let units = Array(repeating: 1, count: $0 % 5)
            if $0 < 4 {
                result.insert(contentsOf: units, at: 0)
            } else {
                result.append(5)
                result.append(contentsOf: units)
            }
        }
        return result
    }
    
    return number.description
        .compactMap { $0.wholeNumberValue }
        .map(transform)
        .reversed()
        .enumerated()
        .map {
            let c = Int(pow(Double(10), Double($0.0)))
            return $0.1.map { $0 * c }
        }
        .filter { !$0.isEmpty }
        .reversed()
        .flatMap { $0 }
        .compactMap { numbers[$0] }
        .map { String($0) }
        .joined()
}

func solution2(_ number: Int) -> String {
    var n = number, result = ""
    let dict = [(1000, "M"),
                (900, "CM"),
                (500, "D"),
                (400, "CD"),
                (100, "C"),
                (90, "XC"),
                (50, "L"),
                (40, "XL"),
                (10, "X"),
                (9, "IX"),
                (5, "V"),
                (4, "IV"),
                (1, "I")]
    dict.forEach {
        while n >= $0 {
            result += $1
            n -= $0
        }
    }
    return result
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("testOneThroughTen", testOneThroughTen),
        ("testBigNumbers", testBigNumbers),
    ]

    func testOneThroughTen() {
        XCTAssertEqual(solution(1), "I")
        XCTAssertEqual(solution(2), "II")
        XCTAssertEqual(solution(3), "III")
        XCTAssertEqual(solution(4), "IV")
        XCTAssertEqual(solution(5), "V")
        XCTAssertEqual(solution(6), "VI")
        XCTAssertEqual(solution(7), "VII")
        XCTAssertEqual(solution(8), "VIII")
        XCTAssertEqual(solution(9), "IX")
        XCTAssertEqual(solution(10), "X")
    }
    
    func testBigNumbers() {
        XCTAssertEqual(solution(100), "C")
        XCTAssertEqual(solution(444), "CDXLIV")
        XCTAssertEqual(solution(1000), "M")
        XCTAssertEqual(solution(1954), "MCMLIV")
        XCTAssertEqual(solution(1990), "MCMXC")
        XCTAssertEqual(solution(1999), "MCMXCIX")
        XCTAssertEqual(solution(2000), "MM")
        XCTAssertEqual(solution(2008), "MMVIII")
        XCTAssertEqual(solution(3000), "MMM")
        XCTAssertEqual(solution(3900), "MMMCM")
        XCTAssertEqual(solution(3914), "MMMCMXIV")
    }
}

SolutionTest.defaultTestSuite.run()
