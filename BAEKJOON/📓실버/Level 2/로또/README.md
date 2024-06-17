```
import Foundation
func solution(){
    while true {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        if input[0] == 0 { break }
        let n = input[0]
        var arr: [Int] = []
        for i in 0..<n {
            arr.append(input[i+1])
        }
        //print(arr)
        var visited = Array(repeating: false, count: n)
        
        func dfs(_ value: [Int], _ idx: Int, _ depth: Int) {
            if depth == 6 {
                print(value.map{String($0)}.joined(separator: " "))
                return
            }
            
            for i in idx..<n {
                if !visited[i] {
                    visited[i] = true
                    dfs(value+[arr[i]], i+1, depth+1)
                    visited[i] = false
                }
            }
        }
        
        dfs([], 0, 0)
        print()
    }
}
solution()
/*
 */

```
