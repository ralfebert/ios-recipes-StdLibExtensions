// Copyright 2018, Ralf Ebert
// License   https://opensource.org/licenses/MIT
// License   https://creativecommons.org/publicdomain/zero/1.0/

import Foundation

extension Array {
    
    var sample : Element? {
        guard !isEmpty else { return nil }
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }

    func sample(count : Int) -> [Element] {
        let sampleCount = Swift.min(count, self.count)
        
        var elements = self
        var samples = [Element]()
        
        while samples.count < sampleCount {
            let idx = Int(arc4random_uniform(UInt32(elements.count)))
            samples.append(elements.remove(at: idx))
        }
        
        return samples
    }

}
