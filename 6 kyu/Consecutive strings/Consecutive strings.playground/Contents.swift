import Foundation

// https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/swift

func longestConsec(_ strarr: [String], _ k: Int) -> String {
    if strarr.isEmpty || k > strarr.count || k <= 0 { return "" }
    let str = (0...strarr.count - k).map { strarr[$0...($0 + k - 1)].reduce("", +) }
    return str.sorted { $0.count > $1.count }.first!
}

func longestConsec2(_ strarr: [String], _ k: Int) -> String {
    var index = 0, result = ""
    while index < (strarr.count - k + 1) {
        let current = strarr[index..<index + k].joined()
        if current.count > result.count { result = current }
        index += 1
    }
    return result
}

func longestConsec3(_ strarr: [String], _ k: Int) -> String {
    let n = strarr.count
    if n == 0 || k > n || k <= 0 {
        return ""
    }
    let sums: [String] = strarr.enumerated().compactMap {
        guard $0.0 + k <= n else { return nil }
        var sum = $0.1
        for i in 1..<k {
            sum += strarr[$0.0 + i]
        }
        return sum
    }
    return sums.max(by: { $0.count < $1.count }) ?? ""
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {

    static var allTests = [
        ("longestConsec", testExample),
    ]

    func testing(_ strarr: [String], _ k: Int, _ expected: String) {
        XCTAssertEqual(longestConsec(strarr, k), expected)
    }

    func testExample() {
        testing(["zone", "abigail", "theta", "form", "libe", "zas"], 2, "abigailtheta")
        testing(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1,
            "oocccffuucccjjjkkkjyyyeehh")
        testing([], 3, "")
        testing(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2,
            "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck")
    }
    
}

SolutionTest.defaultTestSuite.run()
