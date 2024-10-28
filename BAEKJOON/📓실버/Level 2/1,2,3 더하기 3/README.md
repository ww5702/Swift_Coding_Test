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
        print(result)
    }
    
    
    
}

solution()
/*
 */


```
