import Foundation

// https://www.codewars.com/kata/54dc6f5a224c26032800005c/train/swift

func stockList(_ listOfArt: [String], _ listOfCat: [String]) -> String {
    guard !listOfArt.isEmpty, !listOfArt.isEmpty else {
        return ""
    }
    var listOfArt = listOfArt.map {
        ($0.first?.description ?? "", Int($0.components(separatedBy: " ").last ?? "") ?? 0)
    }

    return listOfCat.map { letter in
        (letter, listOfArt.filter { $0.0 == letter }.map { $0.1 }.reduce(0, +))
    }.map { "(\($0.0) : \($0.1))" }.joined(separator: " - ")
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("stockList", testExample),
    ]

    func testing(_ listOfArt: [String], _ listOfCat: [String], _ expected: String) {
        let ans = stockList(listOfArt, listOfCat)
        XCTAssertTrue(ans == expected, "should return \(expected), got \(ans)")
    }
     
    func testExample() {
        let b = ["BBAR 150", "CDXE 515", "BKWR 250", "BTSQ 890", "DRTY 600"]
        let c = ["A", "B", "C", "D"]
        let res = "(A : 0) - (B : 1290) - (C : 515) - (D : 600)"
        testing(b, c, res)
    }
}

SolutionTest.defaultTestSuite.run()
