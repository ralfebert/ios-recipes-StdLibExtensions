import XCTest
@testable import StdLibExtensions

class ArraySampleTest: XCTestCase {
    
    func testEmptyArray() {
        let emptyArray = [Int]()
        XCTAssertNil(emptyArray.sample)
        XCTAssertEqual([], emptyArray.sample(1))
        XCTAssertEqual([], emptyArray.shuffled)
    }
    
    func testSingleElement() {
        XCTAssertEqual(1, [1].sample)
        XCTAssertEqual([1], [1].sample(1))
        XCTAssertEqual([1], [1].sample(2))
        XCTAssertEqual([1], [1].shuffled)
    }

    func testMultipleElements() {
        let numbers = Array(1...49)
        let sample = numbers.sample(6)
        XCTAssertEqual(6, Set(sample).count)
        XCTAssertEqual(Set(sample), Set(numbers).intersection(sample))
        let shuffled = numbers.shuffled
        XCTAssertEqual(numbers.count, Set(shuffled).count)
        XCTAssertNotEqual(numbers, shuffled)
    }
    
    func testExample() {
        let numbers = Array(1...49)
        print("single random element: ", numbers.sample!)
        print("multiple random elements: ", numbers.sample(6))
        print("array in random order: ", numbers.shuffled)
    }

}
