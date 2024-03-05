Y축을 이동시키면서 dp를 실행하는데   
y가 맨위일때, 맨밑일때의 경우의 수를 따로 구분하고   
나머지 경우에는 세가지 경우의 max값을 찾아 구분한다.   
```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (n,m) = (input[0],input[1])
        var board = Array(repeating: Array(repeating: 0, count: m), count: n)
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        var idx = 0
        
        for i in 0..<value.count {
            board[idx][i%m] = value[i]
            if i % m == m-1 { idx += 1 }
        }
        for i in 0..<n {
            dp[i][0] = board[i][0]
        }
        for x in 1..<m {
            for y in 0..<n {
                if y == 0 {
                    dp[y][x] = board[y][x] + max(dp[y][x-1], dp[y+1][x-1])
                } else if y == n-1 {
                    dp[y][x] = board[y][x] + max(dp[y][x-1], dp[y-1][x-1])
                } else {
                    dp[y][x] = board[y][x] + max(dp[y-1][x-1], dp[y][x-1], dp[y+1][x-1])
                }
            }
        }
        var result = 0
        for i in 0..<n {
            result = max(result, dp[i][m-1])
        }
        print(result)
    }
}
solution()
                     

/*
2
3 4
1 3 3 2 2 1 4 1 0 6 4 7
4 4
1 3 1 5 2 2 4 1 5 0 2 3 0 6 1 2
 */


```
