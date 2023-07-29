n이 최대 1,000,000이므로 O(n^2)로는 풀이할 수 없다.  
```
import Foundation

func solution(_ n:Int) -> Int {
    var result = 0
    while true {
        result += 1
        if n % result == 1 { break }
    }
    //print(result)
    return result
}
```
