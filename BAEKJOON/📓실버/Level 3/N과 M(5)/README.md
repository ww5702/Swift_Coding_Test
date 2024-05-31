```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var list = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
    var visited = Array(repeating: false, count: n)
    
    func dfs(_ arr: [Int], _ depth: Int) {
        if arr.count == depth {
            print(arr.map{String($0)}.joined(separator: " "))
            return
        }
        
        for i in 0..<n {
            if !visited[i] {
                visited[i] = true
                dfs(arr + [list[i]], depth)
                visited[i] = false
            }
        }
    }
    
    dfs([Int](), m)
}
solution()

```
