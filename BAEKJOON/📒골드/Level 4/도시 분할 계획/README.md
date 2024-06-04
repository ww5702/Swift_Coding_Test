최소신장트리 즉 크루스칼 알고리즘을 이용해 풀이하는 문제이다.   
가장 적은 비용으로 한 사이클을 만들어야 하는 문제이므로   
비용을 기준으로 정렬한뒤 가장 적은 비용으로 전체를 연결해주는 문제이다.   
그리고 가장 큰 비용을 가진 연결다리를 빼고 합을 더하면 된다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var graph = [(Int,Int,Int)]()
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph.append((input[0],input[1],input[2]))
    }
    graph.sort(by: {$0.2 < $1.2})
    //print(graph)
    
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
    //print(parent)
    
    var result: [Int] = []
    var idx = 0
    while result.count < n-1 {
        let now = graph[idx]
        idx += 1
        
        if find(now.0) != find(now.1) {
            union(now.0, now.1)
            result.append(now.2)
        }
    }
    //print(result)
    var sum = result.reduce(0, +)
    var max = result.max()!
    print(sum - max)
}
solution()

```
밑에 방식이 더 가독성이 있는 코드 같았다.   
하지만 풀이 시간은 거의 비슷했다   

```
var sum = 0
    var maxCnt = 0
    for i in 0..<m {
        let now = graph[i]
        if find(now.0) != find(now.1) {
            union(now.0, now.1)
            sum += now.2
            maxCnt = max(maxCnt, now.2)
        }
    }
    print(sum-maxCnt)
```
FileIO를 이용해 밑과 같이 입력받는다면 시간을 줄일 수는 있긴하다;   

```
let file = FileIO()


let N = file.readInt()
let M = file.readInt()

var array = [[Int]]()
for _ in 0..<M {
    let x1 = file.readInt()
    let x2 = file.readInt()
    let cost = file.readInt()
    array.append([x1,x2,cost])
}
```
