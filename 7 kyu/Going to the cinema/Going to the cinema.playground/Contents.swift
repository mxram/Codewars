import Foundation

// https://www.codewars.com/kata/562f91ff6a8b77dfe900006e/train/swift

func movie(card: Double, ticket: Double, perc: Double) -> Int {
    var systemAResult: Double = 0
    var systemBResult: Double = card
    var ticketPrice: Double = ticket
    var n = 0
    
    while systemAResult <= systemBResult.rounded(.up) {
        n += 1
        ticketPrice *= perc
        systemBResult += ticketPrice
        systemAResult += ticket
    }
    
    return n
}

func movie2(card: Double, ticket: Double, perc: Double) -> Int {
    var res = 0, a = 0.0, c = card, t = ticket
    while ceil(a) <= ceil(c) {
        a = a + ticket
        t = t * perc
        c += t
        res += 1
    }
    return res
}

func movie3(card: Double, ticket: Double, perc: Double) -> Int {
    var a = 0.0, b = card, i = 0
    while a <= ceil(b) {
        i += 1
        a = ticket * Double(i)
        b += ticket * pow(perc , Double(i))
    }
    return i
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(movie(card: 500, ticket: 15, perc: 0.9), 43)
        XCTAssertEqual(movie(card: 100, ticket: 10, perc: 0.95), 24)
    }
}

SolutionTest.defaultTestSuite.run()
