최단 경로를 찾는 문제이다.   
bfs로 풀이하니 메모리 초과 발생   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var edges = Array(repeating: [(Int,Int)](), count: n+1)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        edges[input[0]].append((input[1],input[2]))
        edges[input[1]].append((input[0],input[2]))
    }
    //print(edges)
    
    
    var dis = Array(repeating: Int.max, count: n+1)
    dis[1] = 0
    
    func bfs() {
        var q: [(Int,Int)] = []
        q.append((1,0))
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            let position = now.0
            let cost = now.1
            idx += 1
            
            for next in edges[position] {
                if dis[next.0] > cost + next.1 {
                    dis[next.0] = cost + next.1
                    q.append((next.0,cost + next.1))
                }
            }
        }
    }
    
    bfs()
    print(dis[n])
}
solution()
/*
 */

```
