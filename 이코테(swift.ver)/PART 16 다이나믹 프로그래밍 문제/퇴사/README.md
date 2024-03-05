역순으로 풀이해야 더 쉽게 풀이할 수 있었다.   
날짜가 넘어가는 경우의 수 때문에   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var value = Array(repeating: Array(repeating: 0, count: 2), count: n+1)
    var dp = Array(repeating: 0, count: 1001)
    for i in 1...n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        value[i] = input
        dp[i] = input[1]
    }
    
    for i in stride(from: n, through: 1, by: -1) {
        if value[i][0] + i <= n + 1 {
            dp[i] = max(dp[i+1], dp[i + value[i][0]] + value[i][1])
        } else {
            dp[i] = dp[i+1]
        }
    }
    print(dp.max()!)
}
solution()
                     

/*
7
3 10
5 20
1 10
1 20
2 15
4 40
2 200
 
10
1 1
1 2
1 3
1 4
1 5
1 6
1 7
1 8
1 9
1 10
 
 */


```
