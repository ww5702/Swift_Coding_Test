시간초과

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    
    var result = n
    
    func dfs(_ num: Int, _ cnt: Int) {
        if cnt >= result { return }
        
        if num == 0 {
            result = min(result, cnt)
            return
        }
        
        
        for i in stride(from: Int(sqrt(Double(num))), through: 1, by: -1) {
            dfs(num-(i*i), cnt+1)
        }
    }
    
    
    dfs(n,0)
    print(result)
}


solution()
/*
 */

```
dfs가 시간초과가 발생한다면 dp로 풀이해보기
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 100001)
    
    for i in 1...n {
        dp[i] = i
        for j in 1...i {
            if j*j > i { break }
            dp[i] = min(dp[i], dp[i-(j*j)] + 1)
        }
    }
    
    print(dp[n])
}


solution()
/*
 */

```
