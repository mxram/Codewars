import Foundation

// https://www.codewars.com/kata/55befc42bfe4d13ab1000007/train/swift

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

enum NewNodeError: Error {
    case invalidArgumentException
}

func getNth(_ head: Node?, _ index: Int) throws -> Node? {
    guard index >= 0 else {
        throw NewNodeError.invalidArgumentException
    }
    var node = head
    for _ in (0..<index) {
        node = node?.next
    }
    guard node != nil else {
        throw NewNodeError.invalidArgumentException
    }
    return node
}

// Other
func getNth2(_ head: Node?, _ index: Int) throws -> Node? {
    guard let currentNode = head, index >= 0 else {
        throw NewNodeError.invalidArgumentException
    }
    return index == 0 ? currentNode : try getNth(currentNode.next, index - 1)
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
        ("testNode", testNode),
    ]

    let list: Node? = buildOneTwoThree()
    
    func testNode() {
        XCTAssertEqual(try! getNth(list, 0)?.data, 1)
        XCTAssertEqual(try! getNth(list, 1)?.data, 2)
        XCTAssertEqual(try! getNth(list, 2)?.data, 3)
        XCTAssertThrowsError(try getNth(list, 3))
        XCTAssertThrowsError(try getNth(list, 10))
        XCTAssertThrowsError(try getNth(list, -1))
    }
}

SolutionTest.defaultTestSuite.run()
