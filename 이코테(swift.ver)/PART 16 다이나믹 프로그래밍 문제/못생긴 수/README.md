```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dp = Array(repeating: false, count: 1001)
    dp[1] = true
    for i in 2...1001 {
        if i % 2 == 0 {
            dp[i] = true
        } else if i % 3 == 0 {
            dp[i] = true
        } else if i % 5 == 0 {
            dp[i] = true
        }
    }
    var cnt = 0
    var result = 0
    for i in 0..<1001 {
        if dp[i] == true {
            cnt += 1
        }
        if cnt == n {
            result = i
            break
        }
    }
    print(result)
}
solution()


/*
10
 */
```
