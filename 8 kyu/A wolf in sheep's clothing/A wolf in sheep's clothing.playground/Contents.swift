import Foundation

// https://www.codewars.com/kata/5c8bfa44b9d1192e1ebd3d15

func warnTheSheep(_ queue: [String]) -> String {
    let wolfIndex = queue.firstIndex(of: "wolf") ?? 0
    let sheepIndex = queue.count - wolfIndex - 1
    
    return sheepIndex > 0 ? "Oi! Sheep number \(sheepIndex)! You are about to be eaten by a wolf!" : "Pls go away and stop eating my sheep"
}

// MARK: Solution 2

func warnTheSheep2(_ queue: [String]) -> String {
    let i = Array(queue.reversed()).firstIndex(where: { $0 == "wolf" }) ?? 0
    return i == 0 ? "Pls go away and stop eating my sheep" : "Oi! Sheep number \(i)! You are about to be eaten by a wolf!"
}


// MARK: Tests

import XCTest

class Tests: XCTestCase {
    func tests() {
        XCTAssertEqual(warnTheSheep(["sheep", "sheep", "sheep", "sheep", "sheep", "wolf", "sheep", "sheep"]), "Oi! Sheep number 2! You are about to be eaten by a wolf!", "Testing for \(["sheep", "sheep", "sheep", "sheep", "sheep", "wolf", "sheep", "sheep"]).")
        XCTAssertEqual(warnTheSheep(["sheep", "wolf", "sheep", "sheep", "sheep", "sheep", "sheep"]), "Oi! Sheep number 5! You are about to be eaten by a wolf!", "Testing for \(["sheep", "wolf", "sheep", "sheep", "sheep", "sheep", "sheep"]).")
        XCTAssertEqual(warnTheSheep(["wolf", "sheep", "sheep", "sheep", "sheep", "sheep", "sheep"]), "Oi! Sheep number 6! You are about to be eaten by a wolf!", "Testing for \(["sheep", "sheep", "wolf"]).")
        XCTAssertEqual(warnTheSheep(["sheep", "wolf", "sheep"]), "Oi! Sheep number 1! You are about to be eaten by a wolf!", "Testing for \(["sheep", "wolf", "sheep"])")
        XCTAssertEqual(warnTheSheep(["sheep", "sheep", "wolf"]), "Pls go away and stop eating my sheep", "Testing for \(["sheep", "sheep", "wolf"]).")
        XCTAssertEqual(warnTheSheep(["wolf"]), "Pls go away and stop eating my sheep", "Testing for \(["wolf"]).")
    }
}

Tests.defaultTestSuite.run()
