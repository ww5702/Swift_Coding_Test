백트래킹을 이용해 풀이하였다.   
```
import Foundation
func solution(){
    let n = readLine()!.split(separator: " ").map{Int($0)!}
    let (A,B) = (n[0],n[1])
    var result = Int.max
    dfs(A,0)
    
    func dfs(_ num: Int, _ cnt: Int) {
        //print(num)
        if num == B {
            result = min(result, cnt)
            return
        } else if num > B {
            return
        }
        
        dfs(num*2, cnt+1)
        let newNum = Int(String(num)+"1")!
        dfs(newNum, cnt+1)
    }
    result == Int.max ? print(-1) : print(result+1)
}
solution()

```
