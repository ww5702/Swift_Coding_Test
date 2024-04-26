백트래킹 문제이다.   

```
import Foundation
func solution(){
    let t = Int(String(readLine()!))!
    var cnt = 0
    for _ in 0..<t {
        let target = Int(readLine()!)!
        cnt = 0
        dfs(target, 0)
        print(cnt)
    }
    
    
    func dfs(_ target: Int, _ sum: Int) {
        if sum == target {
            cnt += 1
        } else if sum > target {
            return
        }
        
        dfs(target, sum+1)
        dfs(target, sum+2)
        dfs(target, sum+3)
    }
    
}
solution()

```
