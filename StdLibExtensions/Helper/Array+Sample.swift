// Copyright 2018, Ralf Ebert
// Source    https://www.ralfebert.de/ios-examples/swift/array-random-sample/
// License   https://opensource.org/licenses/MIT
// License   https://creativecommons.org/publicdomain/zero/1.0/

import Darwin

extension Array {
    
    /**
     * Returns a random element of the Array or nil if the Array is empty.
     */
    var sample : Element? {
        guard !isEmpty else { return nil }
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
    
    /**
     * Returns `count` random elements from the array.
     * If there are not enough elements in the Array, a smaller Array is returned.
     * Elements will not be returned twice except when there are duplicate elements in the original Array.
     */
    func sample(_ count : Int) -> [Element] {
        let sampleCount = Swift.min(count, self.count)
        
        var elements = self
        var samples = [Element]()
        
        while samples.count < sampleCount {
            let idx = Int(arc4random_uniform(UInt32(elements.count)))
            samples.append(elements.remove(at: idx))
        }
        
        return samples
    }

    /**
     * Shuffles the elements in the Array in-place using the
     * [Fisher-Yates shuffle](https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle).
     */
    mutating func shuffle() {
        guard self.count >= 1 else { return }

        for i in (1..<self.count).reversed() {
            let j = Int(arc4random_uniform(UInt32(i + 1)))
            self.swapAt(j, i)
        }
    }
    
    /**
      * Returns a new Array with the elements in random order.
      */
    var shuffled : [Element] {
        var elements = self
        elements.shuffle()
        return elements
    }
    
}
