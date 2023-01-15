import Foundation

// https://www.codewars.com/kata/52fba66badcd10859f00097e/train/swift

// Solution 1
func disemvowel(_ s: String) -> String {
    let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    return String(s.filter { !vowels.contains($0) })
}

// Solution 2
// Don't forget to remove the number!
func disemvowel2(_ s: String) -> String {
    s.replacingOccurrences(of: "[aeiou]", with: "", options: [.regularExpression,.caseInsensitive])
}

// Solution 3
// Don't forget to remove the number!
func disemvowel3(_ s: String) -> String {
    return s.replacingOccurrences(of: "[AEIOUaeiou]", with: "", options: .regularExpression)
}

// Solution 4
// Don't forget to remove the number!
func disemvowel4(_ s: String) -> String {
    return String(s.filter{ !Set("aeiouAEIOU").contains($0) })
}

// MARK: - Tests

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.400 (0.402) seconds
class SolutionTest: XCTestCase {
    private let text1 = "This website is for losers LOL!"
    private let expected1 = "Ths wbst s fr lsrs LL!"
    
    private let text2 = "No offense but,\nYour writing is among the worst I've ever read"
    private let expected2 = "N ffns bt,\nYr wrtng s mng th wrst 'v vr rd"
    
    private let text3 = "What are you, a communist?"
    private let expected3 = "Wht r y,  cmmnst?"
    
    func test1() {
        XCTAssertEqual(disemvowel(text1), expected1)
        XCTAssertEqual(disemvowel(text2), expected2)
        XCTAssertEqual(disemvowel(text3), expected3)
    }
    
    func test2() {
        XCTAssertEqual(disemvowel2(text1), expected1)
        XCTAssertEqual(disemvowel2(text2), expected2)
        XCTAssertEqual(disemvowel2(text3), expected3)
    }
    
    func test3() {
        XCTAssertEqual(disemvowel3(text1), expected1)
        XCTAssertEqual(disemvowel3(text2), expected2)
        XCTAssertEqual(disemvowel3(text3), expected3)
    }
    
    func test4() {
        XCTAssertEqual(disemvowel4(text1), expected1)
        XCTAssertEqual(disemvowel4(text2), expected2)
        XCTAssertEqual(disemvowel4(text3), expected3)
    }
}

SolutionTest.defaultTestSuite.run()
