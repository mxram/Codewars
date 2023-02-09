import Foundation

// https://www.codewars.com/kata/5848565e273af816fb000449/train/swift

func encryptThis(text: String) -> String {
    text.components(separatedBy: " ")
        .map { word in
            var temp = ""
            return word.enumerated().map {
                switch $0.0 {
                case 0:
                    return String($0.1.asciiValue ?? 0)
                case 1:
                    temp = String($0.1)
                    return String(word.last ?? $0.1)
                case word.count - 1:
                    return temp
                default:
                    return String($0.1)
                }
            }.joined()
        }
        .joined(separator: " ")
}

func encryptThis2(text: String) -> String {
    text.components(separatedBy: " ")
        .map {
            var a = $0.map { "\($0)" }
            a[0] = "\(a[0].first?.asciiValue ?? 0)"
            if a.count > 2 {
                a.swapAt(1, a.count - 1)
            }
            return a.joined()
        }
        .joined(separator: " ")
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(encryptThis(text: "A wise old owl lived in an oak"), "65 119esi 111dl 111lw 108dvei 105n 97n 111ka")
        XCTAssertEqual(encryptThis(text: "The more he saw the less he spoke"), "84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp")
        XCTAssertEqual(encryptThis(text: "The less he spoke the more he heard"), "84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare")
        XCTAssertEqual(encryptThis(text: "Why can we not all be like that wise old bird"), "87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri")
        XCTAssertEqual(encryptThis(text: "Thank you Piotr for all your help"), "84kanh 121uo 80roti 102ro 97ll 121ruo 104ple")
    }
}

SolutionTest.defaultTestSuite.run()
