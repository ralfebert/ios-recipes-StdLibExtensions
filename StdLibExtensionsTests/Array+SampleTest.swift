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
        let range = 1...49
        print("single random element: ", range.sample!)
        print("multiple random elements: ", range.sample(6))

        let names = ["Alice", "Bob", "Carol", "Dave", "Eve", "Frank", "Grace", "Heidi"]
        print("single random element: ", names.sample!)
        print("multiple random elements: ", names.sample(3))
        print("array in random order: ", names.shuffled)

        let set = Set(names)
        print("single random element: ", set.sample!)
        print("multiple random elements: ", set.sample(3))

    }
    
    func testClosedRangeSample() {
        let range = -3...3
        let allValues = Set(range)
        var sampledValues = Set<Int>()
        (1...10000).forEach { (_) in
            sampledValues.insert(range.sample!)
        }
        XCTAssertEqual(allValues, sampledValues)
    }
    
    func testOpenRangeSample() {
        let range = 0..<5
        let allValues = Set(range)
        var sampledValues = Set<Int>()
        (1...10000).forEach { (_) in
            sampledValues.insert(range.sample!)
        }
        XCTAssertEqual(allValues, sampledValues)
    }
    
    func testSliceSample() {
        let allValues = ["Alice", "Bob", "Carol", "Dave", "Eve", "Frank", "Grace", "Heidi"]
        let slice = allValues[1...3]
        let sliceValues = Set(slice)
        var sampledValues = Set<String>()
        (1...10000).forEach { (_) in
            sampledValues.insert(slice.sample!)
        }
        XCTAssertEqual(sliceValues, sampledValues)
    }

    func testSetSample() {
        let allValues = Set(["Bob", "Alice", "Carol"])
        var sampledValues = Set<String>()
        (1...10000).forEach { (_) in
            sampledValues.insert(allValues.sample!)
        }
        XCTAssertEqual(allValues, sampledValues)
    }
    
}
