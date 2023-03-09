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

func append(_ listA: Node?, _ listB: Node?) -> Node? {
    guard var node = listA else { return listB }
    while let next = node.next { node = next }
    node.next = listB
    return listA
}

func append2(_ listA: Node?, _ listB: Node?) -> Node? {
    guard let listA = listA else {
        return listB
    }
    guard let listB = listB else {
        return listA
    }
    var node = listA
    while node.next != nil {
        node = node.next!
    }
    node.next = listB
    
    return listA
}
