```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: n+1)
    if n == 1 {
        print(3)
    } else if n == 2 {
        print(7)
    } else {
        dp[1] = 3
        dp[2] = 7
        for i in 3...n {
            dp[i] = (dp[i-1]*2 + dp[i-2]) % 9901
        }
        print(dp[n])
    }
}

solution()
/*
 1 = 3
 2 = 7
 3 = 17
 4 = 41
 
 */
  

```
