--  ㅣㅣ --   
ㅣㅣ  --  --   
         --   
위의 3개 문양
```      
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 31)
    dp[0] = 1
    dp[2] = 3
    //dp[2] = 3
    //dp[3] = 0
    //dp[4] = 11
    // dp[4] = dp[4-2]x3 + dp[5]*2
    //dp[5] = 0
    // dp[6] = dp[6-2]x3 + dp[6-4]x2 + dp[6-6]x2
    
    for i in stride(from: 4, through: n, by: 1) {
        dp[i] = dp[i-2]*3
        for j in stride(from: 4, through: i, by: 2) {
            dp[i] += dp[i-j]*2
        }
    }
    print(dp[n])
}

solution()
/*
 
 */

```
