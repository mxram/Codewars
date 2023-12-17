import Foundation

// https://www.codewars.com/kata/57cf3dad05c186ba22000348/train/swift

func decodeResistorColors(_ bands: String) -> String {
    let colorCodes = ["black": "0", "brown": "1", "red": "2",
                      "orange": "3", "yellow": "4", "green": "5",
                      "blue": "6", "violet": "7", "gray": "8",
                      "white": "9", "gold": "5%", "silver": "10%"]
    let components = bands.components(separatedBy: " ").compactMap { colorCodes[$0] }
    guard var value = Double(components.prefix(2).joined()),
          let power = Int(components[2]) else {
        return ""
    }
    value = value * pow(Double(10), Double(power))
    
    let addition: String
    switch power {
    case 2...4:
        value /= 1000
        addition = "k"
    case 5...9:
        value /= 1000000
        addition = "M"
    default:
        addition = String()
    }
    
    let result = value.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", value) : String(value)
    let tolerance = components.count > 3 ? components[3] : "20%"
    
    return result + addition + " ohms, " + tolerance
}

func decodeResistorColors2(_ bands: String) -> String {
    let colors = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "gray", "white"]
    let tolerances = ["gold": 5, "silver": 10]
    let names = bands.components(separatedBy: " ")
    let digits = names.compactMap(colors.firstIndex)
    let ohms = Double((digits[0] * 10 + digits[1]) * Array(repeating: 10, count: digits[2]).reduce(1, *))
    let tolerance = (names.count == 4 ? tolerances[names[3]] : nil) ?? 20
    let (divisor, suffix) = ohms > 999999 ? (1_000_000, "M") : ohms > 999 ? (1_000, "k") : (1, "")
    let ohmsRounded = String(format: "%.1f", ohms / Double(divisor)).replacingOccurrences(of: ".0", with: "")
    return "\(ohmsRounded)\(suffix) ohms, \(tolerance)%"
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    static let simpleTests = [
        ("yellow violet black", "47 ohms, 20%", "A resistor under 1000 ohms and with only three bands"),
        ("yellow violet red gold", "4.7k ohms, 5%", "A resistor between 1000 and 999999 ohms, with a gold fourth band"),
        ("brown black green silver", "1M ohms, 10%", "A resistor of 1000000 ohms or above, with a silver fourth band"),
        ("brown black brown gold", "100 ohms, 5%", "A resistor 4"),
        ("red red brown", "220 ohms, 20%", "A resistor 5"),
        ("orange orange brown gold", "330 ohms, 5%", "A resistor 6"),
        ("brown black red silver", "1k ohms, 10%", "A resistor 7"),
        ("brown black yellow gold", "100k ohms, 5%", "A resistor 8"),
        ("orange orange yellow gold", "330k ohms, 5%", "A resistor 9"),
        ("red black green gold", "2M ohms, 5%", "A resistor 10")
    ]
    
    func test() {
        for test in SolutionTest.simpleTests {
            XCTAssertEqual(decodeResistorColors(test.0), test.1, test.2)
        }
    }
}

SolutionTest.defaultTestSuite.run()
