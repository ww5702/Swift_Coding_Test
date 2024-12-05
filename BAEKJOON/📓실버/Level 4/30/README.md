dfs로 풀이하면 메모리초과   

```
import Foundation
func solution(){
    let arr = readLine()!.map{String($0)}
    //print(arr)
    
    var visited = Array(repeating: false, count: arr.count)
    var answer = -1
    
    func dfs(_ depth: Int, _ num: String)  {
        if depth == arr.count {
            let result = Int(num)!
            if result % 30 == 0 {
                answer = max(result, answer)
            }
            return
        }
        
        for i in 0..<arr.count {
            if !visited[i] {
                visited[i] = true
                dfs(depth+1, num+arr[i])
                visited[i] = false
            }
        }
    }
    
    for i in 0..<arr.count {
        visited[i] = true
        dfs(1, String(arr[i]))
        visited[i] = false
    }
    print(answer)
}
solution()
/*
 */

```
