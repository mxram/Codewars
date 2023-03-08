import Foundation

// https://www.codewars.com/kata/55beec7dd347078289000021/train/swift

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    guard let node = head else {
        return 0
    }
    return length(node.next) + 1
}

func count(_ head: Node?, _ data: Int) -> Int {
    guard let node = head else {
        return 0
    }
    return count(node.next, data) + (node.data == data ? 1 : 0)
}

// Other
func length2(_ head: Node?) -> Int {
    guard var node = head else {
        return 0
    }
    var length = 1
    
    while node.next != nil {
        node = node.next!
        length += 1
    }
    return length
}

func count2(_ head: Node?, _ data: Int) -> Int {
    var node = head
    var count = 0
    
    repeat {
        if node?.data == data {
            count += 1
        }
        node = node?.next
    } while node != nil
    
    return count
}

func push(_ head: Node?, _ data: Int) -> Node {
    .init(data, next: head)
}

func buildOneTwoThree() -> Node {
    push(push(push(nil, 3), 2), 1)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("testLength", testLength),
        ("testCountWithNil", testCountWithNil),
        ("testCountWith3ItemList", testCountWith3ItemList)
    ]

    let list: Node? = buildOneTwoThree()

    func testLength() {
        XCTAssertEqual(length(nil), 0)
        XCTAssertEqual(length(Node(1)), 1)
        XCTAssertEqual(length(list), 3)
    }
    
    func testCountWithNil() {
        XCTAssertEqual(count(nil, 1), 0)
    }

    func testCountWith3ItemList() {
        XCTAssertEqual(count(list, 1), 1)
        XCTAssertEqual(count(list, 2), 1)
        XCTAssertEqual(count(list, 3), 1)
    }
}

SolutionTest.defaultTestSuite.run()
