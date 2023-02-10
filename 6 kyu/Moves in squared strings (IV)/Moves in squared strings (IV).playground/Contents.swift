import Foundation

// https://www.codewars.com/kata/56dbf59b0a10feb08c000227/train/swift

let separator = "\n"

func oper(_ fct: (String) -> String, _ s: String) -> String {
    fct(s)
}

func diagComponents(_ s: String) -> [String] {
    let strings = s.components(separatedBy: separator).reversed()
    var result = Array(repeating: "", count: strings.count)
    for string in strings {
        string.enumerated().forEach {
            result[$0.offset] += String($0.element)
        }
    }
    return result.reversed()
}

func rotDiagComponents(_ s: String) -> [String] {
    diagComponents(s).map { String($0.reversed()) }
}

func diag2Sym(_ s: String) -> String {
    diagComponents(s).joined(separator: separator)
}

func rot90Counter(_ s: String) -> String {
    diagComponents(s)
        .map { String($0.reversed()) }
        .joined(separator: separator)
}

func selfieDiag2Counterclock(_ s: String) -> String {
    s.components(separatedBy: separator)
        .enumerated()
        .map {
            $0.element + "|" + diagComponents(s)[$0.offset] + "|" + rotDiagComponents(s)[$0.offset]
        }
        .joined(separator: separator)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("oper diag2Sym", testExample1),
        ("oper rot90Counter", testExample2),
        ("oper selfieDiag2Counterclock", testExample3),
    ]

    func testing1(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(diag2Sym, s), expected)
    }
    func testing2(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(rot90Counter, s), expected)
    }
    func testing3(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(selfieDiag2Counterclock, s), expected)
    }

    func testExample1() {
        testing1("LmvLyg\nDKELBm\nylJhui\nXRXqHD\nzlisCT\nhPqxYb", "bTDimg\nYCHuBy\nxsqhLL\nqiXJEv\nPlRlKm\nhzXyDL")
        testing1("sUFjCG\nSHEMPB\nDXJnPY\npORQDN\noVkKuG\nxkxBHU",
            "UGNYBG\nHuDPPC\nBKQnMj\nxkRJEF\nkVOXHU\nxopDSs")
    }
    func testExample2() {
        testing2("EcGcXJ\naaygcA\nNgIshN\nyOrCZE\neBEqpm\nNkxCgw", "JANEmw\nXchZpg\ncgsCqC\nGyIrEx\ncagOBk\nEaNyeN")
        testing2("iMUS\nsqdd\nAoHs\nCJTa", "Sdsa\nUdHT\nMqoJ\nisAC")
    }
    func testExample3() {
        testing3("NJVGhr\nMObsvw\ntPhCtl\nsoEnhi\nrtQRLK\nzjliWg",
            "NJVGhr|gKilwr|rwliKg\nMObsvw|WLhtvh|hvthLW\ntPhCtl|iRnCsG|GsCnRi\nsoEnhi|lQEhbV|VbhEQl\nrtQRLK|jtoPOJ|JOPotj\nzjliWg|zrstMN|NMtsrz")
        testing3("JAAn\nsrpa\nFngg\nmrVJ",
            "JAAn|Jgan|nagJ\nsrpa|VgpA|ApgV\nFngg|rnrA|Arnr\nmrVJ|mFsJ|JsFm")
    }
}

SolutionTest.defaultTestSuite.run()
