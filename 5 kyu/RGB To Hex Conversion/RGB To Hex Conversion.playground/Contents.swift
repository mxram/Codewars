import Foundation

// https://www.codewars.com/kata/513e08acc600c94f01000001/train/swift

func rgb(_ r: Int, _ g: Int, _ b: Int) -> String {
    [r, g, b].map { String(format: "%02X", max(min($0, 255), 0)) }.joined()
}
// MARK: Others

func rgb2(_ r: Int, _ g: Int, _ b: Int) -> String {
  return String(format: "%02X%02X%02X", UInt8(clamping: r), UInt8(clamping: g), UInt8(clamping: b))
}

func rgb3(_ r: Int, _ g: Int, _ b: Int) -> String {
    let convert = { (number: Int) -> String in
        let number = String(UInt8(clamping: number), radix: 16)
        return number.count == 1 ? "0\(number)" : number
    }
    return "\(convert(r))\(convert(g))\(convert(b))".uppercased()
}

extension Int {
  /// Returns hex code value of the number in range [00, FF].
  ///
  /// Discussion: Each value is treated as UInt8, making each
  ///  negative value resulting in `"00"` and each value higher
  ///  than 255 resulting in `"FF"`.
  public var hexCode: String {
    guard self > 0 else { return "00" }
    guard self < 255 else { return "FF" }
    return String(format:"%02X", self)
  }
}

func rgb4(_ r: Int, _ g: Int, _ b: Int) -> String {
  return "\(r.hexCode)\(g.hexCode)\(b.hexCode)"
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual("FFFFFF", rgb(255,255,255))
        XCTAssertEqual("FFFFFF", rgb(255,255,300))
        XCTAssertEqual("000000", rgb(0,0,0))
        XCTAssertEqual("9400D3", rgb(148,0,211))
        XCTAssertEqual("9400D3", rgb(148,-20,211))
        XCTAssertEqual("90C3D4", rgb(144,195,212))
        XCTAssertEqual("D4350C", rgb(212,53,12))
    }
}

SolutionTest.defaultTestSuite.run()
