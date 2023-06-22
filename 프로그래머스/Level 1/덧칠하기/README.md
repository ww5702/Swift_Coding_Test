```
import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var section = section
    var count = 0
    
    while !section.isEmpty {
        let wall = section[0]
        for _ in 0..<m {
            guard let first = section.first else { break }
            if first < wall+m {
                let _ = section.removeFirst()
            } else {
                break
            }
        }
        count += 1
    }
    
    return count
}
```
