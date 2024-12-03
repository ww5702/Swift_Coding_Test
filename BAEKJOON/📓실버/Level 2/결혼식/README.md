```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var edge = Array(repeating: [Int](), count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        edge[input[0]].append(input[1])
        edge[input[1]].append(input[0])
    }
    //print(edge)
    var visited = Array(repeating: false, count: n+1)
    visited[1] = true
    
    for next in edge[1] {
        visited[next] = true
        for nnext in edge[next] {
            visited[nnext] = true
        }
    }
    print(visited[2...].filter{$0}.count)
}
solution()
/*
 */

```
