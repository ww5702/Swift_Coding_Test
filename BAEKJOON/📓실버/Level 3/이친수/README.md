dfs로 풀이했다가 시간초과 발생하여 dp로 풀이하였다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var cnt = 0
    func dfs(_ str: [String], _ depth: Int) {
        var str = str
        
        if depth == n {
            cnt += 1
            return
        }
        
        if str.last == "1" {
            str.append("0")
            dfs(str, depth + 1)
        } else {
            str.append("1")
            dfs(str, depth + 1)
            str.removeLast()
            str.append("0")
            dfs(str, depth + 1)
        }
    }
    
    var arr: [String] = []
    arr.append("1")
    dfs(arr, 1)
    print(cnt)
}
solution()

```

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 91)
    dp[1] = 1
    dp[2] = 1
    for i in stride(from: 3, through: n, by: 1) {
        dp[i] = dp[i-1] + dp[i-2]
    }
    print(dp[n])
}
solution()

```
