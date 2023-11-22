import Foundation

// https://www.codewars.com/kata/58485a43d750d23bad0000e6/train/swift

func fizzBuzzCuckooClock(_ time: String) -> String {
    func cuckoo() -> String {
        let cuckoo = "Cuckoo"
        if minutes == 0 {
            return Array(repeating: cuckoo, count: hours).joined(separator: " ")
        } else {
            return cuckoo
        }
    }
    
    let components = time.components(separatedBy: ":").compactMap { Int($0) }
    var hours = components[0] % 12
    if hours == 0 { hours = 12 }
    let minutes = components[1]
    
    switch (minutes % 3 == 0, minutes % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (true, true):
        if minutes % 10 == 0 {
            return cuckoo()
        } else {
            return "Fizz Buzz"
        }
    default:
        return "tick"
    }
}

func fizzBuzzCuckooClock2(_ time: String) -> String {
    let a = time.components(separatedBy: ":")
    guard let hrs = Int(a[0]), let min = Int(a[1]) else { return "tick" }

    switch min {
        case 0:
            return Array(repeating: "Cuckoo", count: (hrs + 11) % 12 + 1 ).joined(separator: " ")
        case 30:
            return "Cuckoo"
        case let x where x % 15 == 0:
            return "Fizz Buzz"
        case let x where x % 3 == 0:
            return "Fizz"
        case let x where x % 5 == 0:
            return "Buzz"
        default:
            return "tick"
    }
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    
    static let basicTests = [
        ("13:34", "tick"),
        ("21:00", "Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo"),
        ("11:15", "Fizz Buzz"),
        ("03:03", "Fizz"),
        ("14:30", "Cuckoo"),
        ("08:55", "Buzz"),
        ("00:00", "Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo"),
        ("12:00", "Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo Cuckoo")
    ]

    func test() {
        for test in SolutionTest.basicTests {
            XCTAssertEqual(fizzBuzzCuckooClock(test.0), test.1, "Testing with time \(test.0)")
        }
    }
}

SolutionTest.defaultTestSuite.run()
