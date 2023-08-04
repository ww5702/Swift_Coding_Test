false true에 따라서 absolute[s]의 값을 더하거나 빼준다.   
```
import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var sum = 0
    for s in 0..<signs.count {
        sum = !signs[s] ? sum-absolutes[s] : sum+absolutes[s]
    }
    return sum
}
```
