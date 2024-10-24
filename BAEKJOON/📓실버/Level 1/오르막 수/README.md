```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    // dp[1][1]은 1자리수에 끝자리가 1로 끝난다는 의미
    var dp = Array(repeating: Array(repeating: 0, count: 10), count: 1002)
    for i in 0..<10 {
        dp[1][i] = 1
    }
    
    /*
     dp[2][0]은 2번째자리수의 끝자리가 0이다 오르막수이려면 1번째수가 0이어야만 한다
     따라서 dp[2][0] = dp[1][0]
     dp[2][1]은 끝자리가 1이다 오르막수려면 dp[1][0] + dp[1][1]
     dp[2][2]는 끝나지가 2이다 오르막수이려면 dp[1][0] + dp[1][1] + dp[1][2]
     */
    
    if n > 1 {
        for i in 2...n {
            for j in 0..<10 {
                for k in 0...j {
                    dp[i][j] += dp[i-1][k] % 10007
                }
            }
        }
    }
    var sum = 0
    for i in 0..<10 {
        sum += dp[n][i]
    }
    print(sum % 10007)
}

solution()
/*
 */

```
