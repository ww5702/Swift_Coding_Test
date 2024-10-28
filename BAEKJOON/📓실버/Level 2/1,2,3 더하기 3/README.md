dfs로 풀이 하지만 시간초과   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let num = Int(readLine()!)!
        var result = 0
        
        func dfs(_ idx: Int, _ sum: Int) {
            if sum > num { return }
            
            if sum == num {
                result += 1
                return
            }
            
            for i in idx...3 {
                dfs(idx, sum+i)
            }
        }
        
        dfs(1, 0)
        print(result % 1,000,000,009)
    }
    
    
    
}

solution()
/*
 */


```
dp[1] = 1 / dp[2] = 2/ dp[3] = 4   
dp[4] = dp[1] + dp[2] + dp[3]이다.   
왜냐하면 dp[1]에서 3을 더하는 경우 1가지   
dp[2]에서 2를 더하는 경우 1가지   
dp[3]에서 1을 더하는 경우 1가지   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let num = Int(readLine()!)!
        var dp = Array(repeating: 0, count: num+1)
        
        for i in 1...num {
            if i == 1 {
                dp[i] = 1
            } else if i == 2 {
                dp[i] = 2
            } else if i == 3 {
                dp[i] = 4
            } else {
                dp[i] = (dp[i-3] + dp[i-2] + dp[i-1]) % 1_000_000_009
            }
        }
        
        print(dp[num])
    }
    
    
    
}

solution()
/*
 1 1 1
 1 2
 2 1
 */


```
