플로이드워셜 알고리즘을 사용해서 풀이한다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var graph = Array(repeating: Array(repeating: Int.max, count: n+1), count: n+1)
    for i in 1...n {
        graph[i][i] = 0
    }
    //print(graph)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]][input[1]] = min(graph[input[0]][input[1]], input[2])
    }
    
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if graph[i][k] != Int.max && graph[k][j] != Int.max {
                    graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
                }
                
            }
        }
    }
    
    for i in 1...n {
        for j in 1...n {
            print(graph[i][j] == Int.max ? 0 : graph[i][j], terminator: " ")
        }
        print()
    }
    
}
solution()


/*
cat
cut
 
sunday
saturday
 */


```
