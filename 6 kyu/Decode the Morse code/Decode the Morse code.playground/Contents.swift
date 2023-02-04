import Foundation

// https://www.codewars.com/kata/54b724efac3d5402db00065e/train/swift

let MorseCode: [String: String] = ["-.-.-.":";","-...-":"=","---":"O","----.":"9","-..-.":"/",".-...":"&","...--":"3",".--":"W","--":"M","--..":"Z",".----.":"'","-.-.--":"!","-...":"B","..-":"U",".----":"1","-.--.-":")",".-":"A","-....-":"-","...-":"V","...---...":"SOS","-.--":"Y","..":"I","--.-":"Q","-.":"N","..---":"2","-....":"6","---...":",",".-.-.":"+",".--.-.":"@","....-":"4","-----":"0",".-.-.-":".","-.-.":"C",".":"E","..-.":"F",".---":"J","-.-":"K",".-..":"L",".-.":"R","...":"S","--.":"G","---..":"8","..--..":"?","-.--.":"(",".--.":"P",".....":"5","..--.-":"_","-..":"D",".-..-.":"\"","-":"T","....":"H","--..--":",","...-..-":"$","--...":"7","-..-":"X"]

func decodeMorse(_ morseCode: String) -> String {
    morseCode
        .components(separatedBy: "   ")
        .map { $0.components(separatedBy: " ").compactMap { MorseCode[$0] }.joined() }
        .filter { !$0.isEmpty }
        .joined(separator: " ")
}

func decodeMorse2(_ morseCode: String) -> String {
    return morseCode
        .trimmingCharacters(in: .whitespaces)    // remove spaces before and after the code
        .components(separatedBy: "  ")           // split words
        .map { $0.split(separator: " ")          // split letters
            .map { MorseCode[String($0)] ?? "" } // translate letter
            .joined()}                           // join letters into words
        .joined(separator: " ")                  // join words
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Example from description", testExample),
        ("Basic Morse decoding", testBasic),
        ("More complex tests", testComplex),
    ]

    func testExample() {
        XCTAssertEqual(decodeMorse(".... . -.--   .--- ..- -.. ."), "HEY JUDE")
    }
  
    func testBasic() {
        XCTAssertEqual(decodeMorse(".-"), "A")
        XCTAssertEqual(decodeMorse(".."), "I")
        XCTAssertEqual(decodeMorse(". ."), "EE")
        XCTAssertEqual(decodeMorse(".   ."), "E E")
        XCTAssertEqual(decodeMorse("...---..."), "SOS")
        XCTAssertEqual(decodeMorse("... --- ..."), "SOS")
        XCTAssertEqual(decodeMorse("...   ---   ..."), "S O S")
    }
  
    func testComplex() {
        XCTAssertEqual(decodeMorse(" . "), "E")
        XCTAssertEqual(decodeMorse("   .   . "), "E E")
        XCTAssertEqual(decodeMorse("      ...---... -.-.--   - .... .   --.- ..- .. -.-. -.-   -... .-. --- .-- -.   ..-. --- -..-   .--- ..- -- .--. ...   --- ...- . .-.   - .... .   .-.. .- --.. -.--   -.. --- --. .-.-.-  "), "SOS! THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG.")
    }
}

SolutionTest.defaultTestSuite.run()
