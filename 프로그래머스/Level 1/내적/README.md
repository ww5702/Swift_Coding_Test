더 간결하게 풀 수 있는 방법을 생각해보자   
```
import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    for i in 0..<a.count {
        let value = a[i]*b[i]
        result += value
    }
    return result
}
```
