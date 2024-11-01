```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var hp = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
    var score = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: 100)
    for i in 1...n {
        let (h,s) = (hp[i],score[i])
        for j in 0...99 {
            if h <= j {
                dp[j][i] = max(dp[j][i-1], dp[j-h][i-1] + s)
            } else {
                dp[j][i] = dp[j][i-1]
            }
        }
    }
    print(dp[99][n])
}

solution()
/*
 */

```
