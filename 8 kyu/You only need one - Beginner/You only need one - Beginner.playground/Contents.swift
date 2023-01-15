import Foundation

// https://www.codewars.com/kata/57cc975ed542d3148f00015b/train/swift

func check<T: Equatable>(_ a: [T], _ x: T) -> Bool {
    a.contains(x)
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static let exampleStringTests = [
        (["t", "e", "s", "t"], "e" , true),
        (["what", "a", "great", "kata"], "kat" , false)
    ]
    
    static let exampleIntTests = [
        ([66, 101], 66, true),
        ([80, 117, 115, 104, 45, 85, 112, 115], 45 , true)
    ]
    
    static var allTests = [
        ("Example Tests", runExampleTests)
    ]
    
    func runExampleTests() {
        for test in SolutionTest.exampleStringTests {
            XCTAssertEqual(check(test.0, test.1), test.2)
        }
        for test in SolutionTest.exampleIntTests {
            XCTAssertEqual(check(test.0, test.1), test.2)
        }
    }
  
}

SolutionTest.defaultTestSuite.run()
