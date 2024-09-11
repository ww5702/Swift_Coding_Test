```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var (start, end) = (0,1)
    var sum = 1
    var result = 0
    
    while start <= end {
        if sum == n {
            //print(start,end,sum)
            result += 1
            if end <= n {
                end += 1
                sum += end
            } else {
                sum -= start
                start += 1
            }
        } else if sum > n {
            sum -= start
            start += 1
        } else if sum < n {
            if end <= n {
                end += 1
                sum += end
            }
        }
    }
    print(result)
}

solution()
/*
 */

```
