dp 점화식을 구하기만 하면 되는 문제이다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    /*
     1 -> 1
     2 -> 3
     3 -> 5
     4 -> 10
     5 -> 20
     */
    var dp = Array(repeating: 0, count: n+1)
    
    if n == 1 {
        print(1)
    } else if n == 2 {
        print(3)
    } else {
        dp[1] = 1
        dp[2] = 3
        for i in 3...n {
            dp[i] = (dp[i-2]*2 % 10007 + dp[i-1] % 10007) % 10007
        }
        print(dp[n])
    }
    
}
solution()

```
