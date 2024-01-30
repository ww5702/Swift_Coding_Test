# 최소 비용으로 그래프의 모든 정점을 연결해 봅시다.	

## 9372 상근이의 여행
무조건 연결되어있는 비행스케쥴이다.   
따라서 n-1만 하면 정답에 도달하는 꼼수가 존재한다.   
이 이유는 갔던 경로를 또 가더라도 결과에 영향을 주지 않는 조건때문이다.   
```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (n,m) = (input[0],input[1])
        var graph: [[Int]] = Array(repeating: [], count: n+1)
        for i in 0..<m {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            graph[input[0]].append(input[1])
            graph[input[1]].append(input[0])
        }
        //print(graph)
        print(n-1)
    }
}
solution()

```
## 1197 최소 스패닝 트리
최소 신장 트리의 기본을 묻는 문제이다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    
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
    
    var parent = [Int](0...n)
    var graph: [(Int,Int,Int)] = []
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph.append((input[0],input[1],input[2]))
    }
    graph.sort(by: {$0.2 < $1.2})
//    print(graph)
    var line = 0
    var result = 0
    for i in 0..<m {
        if line == n-1 { break }
        let cur = graph[i]
        if find(cur.0) != find(cur.1) {
            union(cur.0, cur.1)
            line += 1
            result += cur.2
        }
    }
    print(result)
}
solution()

```
