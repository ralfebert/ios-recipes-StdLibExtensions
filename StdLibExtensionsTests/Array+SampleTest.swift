import XCTest
@testable import StdLibExtensions

class ArraySampleTest: XCTestCase {
    
    func testEmptyArray() {
        let emptyArray = [Int]()
        XCTAssertNil(emptyArray.sample)
        XCTAssertEqual([], emptyArray.sample(count: 1))
    }
    
    func testSingleElement() {
        XCTAssertEqual(1, [1].sample)
        XCTAssertEqual([1], [1].sample(count: 1))
        XCTAssertEqual([1], [1].sample(count: 2))
    }

    func testMultipleElements() {
        let numbers = Array(1...10)
        let sample = numbers.sample(count: 3)
        XCTAssertEqual(3, Set(sample).count)
        XCTAssertEqual(Set(sample), Set(numbers).intersection(sample))
    }

}
