import Foundation

// https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/swift

func countDuplicates(_ s: String) -> Int {
    var letters = [Character: Int](), s = s.lowercased()
    s.forEach { letters[$0, default: 0] += 1 }
    return letters.values.filter { $0 > 1 }.count
}

/*
func countDuplicates(_ s:String) -> Int {
    Dictionary(grouping: s.lowercased(), by: { $0 }).filter { $1.count > 1 }.count
}

func countDuplicates(_ s:String) -> Int {
    return s.lowercased().reduce(into: [:]) { $0[$1, default: 0] += 1 }.filter { $0.1 > 1 }.count
}

func countDuplicates(_ s:String) -> Int {
    let map = s.lowercased().map{"\($0)"}.map{($0,1)}
    return Dictionary(map, uniquingKeysWith: +).filter{$1 > 1}.count
}
*/


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        check("abcde", 0)
        check("abcdea", 1)
        check("indivisibility", 1)
    }
    
    func check(_ s:String, _ c:Int) {
        XCTAssertEqual(countDuplicates(s), c)
    }

}

SolutionTest.defaultTestSuite.run()
