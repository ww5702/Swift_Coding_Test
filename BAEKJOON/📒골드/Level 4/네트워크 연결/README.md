최저비용으로 한 사이클 연결 -> 크루스칼   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var graph: [(Int,Int,Int)] = []
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        graph.append((input[0],input[1],input[2]))
    }
    graph.sort(by: {$0.2 < $1.2})
    var parent = [Int](0...n)
    
    func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if (a != b) {
            parent[b] = a
        }
    }
    
    var cnt = 0
    var result = 0
    
    for i in 0..<m {
        if cnt == n-1 { break }
        let (start, end, cost) = graph[i]
        if find(start) != find(end) {
            cnt += 1
            union(start, end)
            result += cost
        }
    }
    
    print(result)
    
}


solution()
/*
 */

```
