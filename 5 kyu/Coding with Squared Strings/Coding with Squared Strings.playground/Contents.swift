import Foundation

// https://www.codewars.com/kata/56fcc393c5957c666900024d/train/swift

let separator = "\n"
let char11 = String(unicodeScalarLiteral: "\u{F7}")

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

func code(_ s: String) -> String {
    let count = s.count
    guard count > 1 else {
        return s
    }
    var t = s
    var n = 1
    while count / n >= n {
        n += 1
    }
    t.append(String(repeating: char11,
                    count: n * n - count))
    for i in 1...n - 1 {
        t.insert(Character(separator),
                 at: t.index(t.startIndex, offsetBy: i * n + i - 1))
    }
    return diagComponents(t)
        .map { String($0.reversed()) }
        .joined(separator: separator)
}

func decode(_ s: String) -> String {
    diagComponents(s)
        .reversed()
        .joined()
        .replacingOccurrences(of: char11,
                              with: "")
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("code", testExample1),
        ("decode", testExample2),
    ]

    func testing(_ actual: String, _ expected: String) {
        XCTAssertEqual(actual, expected)
    }
    
    let data1 = "What do you remember? When I looked at his streaky glasses, I wanted " +
         "to leave him. And before that? He stole those cherries for me at midnight. We were walking " +
         "in the rain and I loved him. And before that? I saw him coming " +
         "toward me that time at the picnic, edgy, foreign."

    let data2 = "Some say the world will end in fire, Some say in ice. From what I've tasted of desire " +
        "I hold with those who favor fire. But if it had to perish twice, I think I know enough of hate" +
        " To say that for destruction ice Is also great And would suffice."

    let data1Sol =
        "÷ctg?.nadr d gdbW\n÷,i    lnis tl eh\n÷ mtIAakietboaara\n÷eeo nnigsoe st?t\n÷d wsddnh lfls   \n÷gaaa  gtfeoeehWd\n" +
        "÷ytrwbI .o rasiho\n÷, d e i rtev,se \n÷ t hflnW h e  ny\n÷fhmioo emot Is o\n÷oeemrvt eshh tIu\n÷r   eehw eaiwr  \n" +
        "÷eptc deea tmaelr\n÷iihot  rtc?.naoe\n÷gcamhhre h  tkom\n÷nntiaia meHAeyke\n÷.i ntmiwirend em"

    let data2Sol =
        "fa  h ttrheI ilS\nitifakw   s'irdo\nc cotnihftivce m\neAereocaihree,we\n.n   wedroe . i \n÷dIdT , es t Sls\n÷ seoe t.eIaFola\n" +
        "÷w s nIo   srm y\n÷oatso  Bwhtoee \n÷ulrautpuhoem nt\n÷lsuyghetold sdh\n÷doc hir  d wa e\n÷  tt niif ohyi \n÷sgihoksfawfa nw\n" +
        "÷uroaf h vi ti o\n÷fent I iotd nfr"
    
    func testExample1() {
        testing(code(data1), data1Sol)
        testing(code(data2), data2Sol)
    }
    func testExample2() {
        testing(decode(data1Sol), data1)
        testing(decode(data2Sol), data2)
    }
}

SolutionTest.defaultTestSuite.run()
