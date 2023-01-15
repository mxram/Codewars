import Foundation

// https://www.codewars.com/kata/56dbeec613c2f63be4000be6/train/swift

let separator = "\n"

func oper(_ fct: (String) -> String, _ s: String) -> String {
    fct(s)
}

func diagComponents(_ s: String) -> [String] {
    let strings = s.components(separatedBy: separator)
    var result = Array(repeating: "", count: strings.count)
    for string in strings {
        string.enumerated().forEach {
            result[$0.offset] += String($0.element)
        }
    }
    return result
}

func diag1Sym(_ s: String) -> String {
    diagComponents(s).joined(separator: separator)
}

func rot90Clock(s: String) -> String {
    diagComponents(s)
        .map { String($0.reversed()) }
        .joined(separator: separator)
}
                                   
func selfieAndDiag1(_ s: String) -> String {
    zip(s.components(separatedBy: separator), diagComponents(s))
        .map { $0 + "|" + $1 }
        .joined(separator: separator)
}

func selfieAndDiag2(_ s: String) -> String {
    s.components(separatedBy: separator)
        .enumerated()
        .map { $0.element + "|" + diagComponents(s)[$0.offset] }
        .joined(separator: separator)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("oper diag1Sym", testExample1),
        ("oper rot90Clock", testExample2),
        ("oper selfieAndDiag1", testExample3),
    ]

    func testing1(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(diag1Sym, s), expected)
    }
    func testing2(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(rot90Clock, s), expected)
    }
    func testing3(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(selfieAndDiag1, s), expected)
    }

    func testExample1() {
        testing1("wuUyPC\neNHWxw\nehifmi\ntBTlFI\nvWNpdv\nIFkGjZ",
            "weetvI\nuNhBWF\nUHiTNk\nyWflpG\nPxmFdj\nCwiIvZ");
        testing1("qAdPMX\nkRIQKU\nJeoroo\nNwVbtn\nAmQUqi\nVguxub",
            "qkJNAV\nARewmg\ndIoVQu\nPQrbUx\nMKotqu\nXUonib");
    }
    func testExample2() {
        testing2("rgavce\nvGcEKl\ndChZVW\nxNWgXR\niJBYDO\nSdmEKb",
            "Sixdvr\ndJNCGg\nmBWhca\nEYgZEv\nKDXVKc\nbORWle");
        testing2("EFAxSN\nXbJObC\nMrNVyg\nUKqDsE\nrYnAfU\nnNjADZ",
            "nrUMXE\nNYKrbF\njnqNJA\nAADVOx\nDfsybS\nZUEgCN");
    }
    func testExample3() {
        testing3("NJVGhr\nMObsvw\ntPhCtl\nsoEnhi\nrtQRLK\nzjliWg",
            "NJVGhr|NMtsrz\nMObsvw|JOPotj\ntPhCtl|VbhEQl\nsoEnhi|GsCnRi\nrtQRLK|hvthLW\nzjliWg|rwliKg");
        testing3("JAAn\nsrpa\nFngg\nmrVJ","JAAn|JsFm\nsrpa|Arnr\nFngg|ApgV\nmrVJ|nagJ");
    }
}

SolutionTest.defaultTestSuite.run()
