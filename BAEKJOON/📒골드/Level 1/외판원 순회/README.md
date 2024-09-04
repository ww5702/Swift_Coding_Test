dfs로 풀이했으나 시간초과   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board[i] = input
    }
    var visited = Array(repeating: false, count: n)
    var result = 16_000_000
    
    func dfs(_ depth: Int, _ cost: Int) {
        if result < cost { return }
        if (depth == n) {
            result = min(cost, result)
            return
        }
        
        for i in 0..<n {
            if !visited[i] && board[depth][i] > 0 {
                visited[i] = true
                dfs(depth+1, cost+board[depth][i])
                visited[i] = false
            }
        }
    }
    
    dfs(0, 0)
    print(result)
}


solution()
/*
 */

```
위 방법은 dfs만으로도 풀 수 있으나   
경우의수가 늘어난다면 절대 풀 수없다.   
따라서 dp와 비트마스킹을 이용해야 풀 수 있다.   
비트마스킹을 좀 더 공부해야할 것 같다.   


```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var w = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        w[i] = input
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: 1<<16), count: 16)
    
    func dfs(_ now: Int, _ visited: Int) -> Int {
        if visited == (1 << n) - 1 {
            return w[now][0] == 0 ? 16_000_000 : w[now][0]
        }
        guard dp[now][visited] == 0 else { return dp[now][visited] }
        var minCost = 16_000_000
        for i in 0..<n {
            guard w[now][i] != 0 && visited & 1 << i == 0 else { continue }
            minCost = min(minCost, dfs(i, visited | 1 << i) + w[now][i])
            dp[now][visited] = minCost
        }
        
        return minCost
    }
    print(dfs(0, 1))
}


solution()
/*
 */

```
