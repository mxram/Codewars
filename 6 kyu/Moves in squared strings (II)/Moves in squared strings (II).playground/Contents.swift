import Foundation

// https://www.codewars.com/kata/56dbe0e313c2f63be4000b25/train/swift

let separator = "\n"

func rot(_ s: String) -> String {
    s.components(separatedBy: separator).map { String($0.reversed()) }.reversed().joined(separator: separator)
}

func selfieAndRot(_ s: String) -> String {
    let selfie = s.components(separatedBy: separator).map { $0 + String(repeating: ".", count: $0.count) }
    let rot = selfie.map { String($0.reversed()) }.reversed()
    
    return (selfie + Array(rot)).joined(separator: separator)
}

func oper(_ fct: (String) -> String, _ s: String) -> String {
    fct(s)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("oper rot", testExample1),
        ("oper selfieAndRot", testExample2),
    ]

    func testing1(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(rot, s), expected)
    }
    func testing2(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(selfieAndRot, s), expected)
    }

    func testExample1() {
        testing1("fijuoo\nCqYVct\nDrPmMJ\nerfpBA\nkWjFUG\nCVUfyL",
            "LyfUVC\nGUFjWk\nABpfre\nJMmPrD\ntcVYqC\nooujif")
        testing1("rkKv\ncofM\nzXkh\nflCB", "BClf\nhkXz\nMfoc\nvKkr")
        testing1("lVHt\nJVhv\nCSbg\nyeCt", "tCey\ngbSC\nvhVJ\ntHVl")
        testing1("QMxo\ntmFe\nWLUG\nowoq", "qowo\nGULW\neFmt\noxMQ")
    }
    func testExample2() {
        testing2("xZBV\njsbS\nJcpN\nfVnP",
            "xZBV....\njsbS....\nJcpN....\nfVnP....\n....PnVf\n....NpcJ\n....Sbsj\n....VBZx")
        testing2("uLcq\nJkuL\nYirX\nnwMB",
            "uLcq....\nJkuL....\nYirX....\nnwMB....\n....BMwn\n....XriY\n....LukJ\n....qcLu")
        testing2("lVHt\nJVhv\nCSbg\nyeCt",
            "lVHt....\nJVhv....\nCSbg....\nyeCt....\n....tCey\n....gbSC\n....vhVJ\n....tHVl")
        testing2("QMxo\ntmFe\nWLUG\nowoq",
            "QMxo....\ntmFe....\nWLUG....\nowoq....\n....qowo\n....GULW\n....eFmt\n....oxMQ")
    }
}

SolutionTest.defaultTestSuite.run()
