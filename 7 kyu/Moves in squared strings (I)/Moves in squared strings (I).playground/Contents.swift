import Foundation

// https://www.codewars.com/kata/56dbe0e313c2f63be4000b25/train/swift

let separator = "\n"

func horMirror(_ s: String) -> String {
    s.split(separator: separator).reversed().joined(separator: separator)
}
func vertMirror(_ s: String) -> String {
    s.split(separator: separator).map { String($0.reversed()) }.joined(separator: separator)
}

func oper(_ fct: (String) -> String, _ s: String) -> String {
    fct(s)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("oper horMirror", testExample1),
        ("oper vertMirror", testExample2),
    ]

    func testing1(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(horMirror, s), expected)
    }
    func testing2(_ s: String, _ expected: String) {
        XCTAssertEqual(oper(vertMirror, s), expected)
    }

    func testExample1() {
        testing1("lVHt\nJVhv\nCSbg\nyeCt", "yeCt\nCSbg\nJVhv\nlVHt")
        testing1("njMK\ndbrZ\nLPKo\ncEYz", "cEYz\nLPKo\ndbrZ\nnjMK")
        testing1("QMxo\ntmFe\nWLUG\nowoq", "owoq\nWLUG\ntmFe\nQMxo")
        testing1("FYvi\ndZQn\nuGef\nQoSy", "QoSy\nuGef\ndZQn\nFYvi")

    }
    func testExample2() {
        testing2("hSgdHQ\nHnDMao\nClNNxX\niRvxxH\nbqTVvA\nwvSyRu", "QHdgSh\noaMDnH\nXxNNlC\nHxxvRi\nAvVTqb\nuRySvw")
        testing2("IzOTWE\nkkbeCM\nWuzZxM\nvDddJw\njiJyHF\nPVHfSx", "EWTOzI\nMCebkk\nMxZzuW\nwJddDv\nFHyJij\nxSfHVP")
        testing2("cuQW\nxOuD\nfZwp\neqFx", "WQuc\nDuOx\npwZf\nxFqe")
        testing2("CDGIdolo\nUstXfrIg\ntMqjvxWL\nBEyuCnAm\nxsxaEERa\nxZsvOiZS\nLutlBRXE\ntxshhbqE",
            "olodIGDC\ngIrfXtsU\nLWxvjqMt\nmAnCuyEB\naREEaxsx\nSZiOvsZx\nEXRBltuL\nEqbhhsxt")

    }
}

SolutionTest.defaultTestSuite.run()
