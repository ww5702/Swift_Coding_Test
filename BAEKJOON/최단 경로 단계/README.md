# 그래프의 간선에 가중치가 없으면 BFS로 최단거리를 찾을 수 있습니다. 가중치가 있다면 어떨까요?	
# GOAT
https://csacademy.com/app/graph_editor/   
해당 사이트로 그래프를 그려볼 수 있다.   
물론 가중치도.   

## 1753 최단경로
다익스트라 문제이다.   
최소 힙을 구현해야하고, Node 구조체를 구현해야 한다.   
Node에 값들을 넣을떄에는 오름차순 함수를 미리 넣어줌으로써   
코스트의 오름차순으로 정렬하여 저장한다.   

```
import Foundation
struct Heap <T: Comparable> {
    var heap = [T]()
    
    private func getParent(_ index: Int) -> T {
        heap[index / 2]
    }
    
    private func getLeftChild(_ index: Int) -> T {
        heap[index * 2]
    }
    
    private func getRightChild(_ index: Int) -> T {
        heap[index * 2 + 1]
    }
    
    func isEmpty() -> Bool {
        heap.count <= 1
    }
    
    mutating func push(_ data: T) {
        if isEmpty() { heap.append(data) }
        var index = heap.count
        heap.append(data)
        
        while index > 1 {
            let parent = getParent(index)
            guard parent > data else { break }
            heap[index] = parent
            index /= 2
        }
        heap[index] = data
    }
    mutating func pop() -> T? {
        guard !isEmpty() else { return nil }
        let item = heap[1]
        let data = heap.removeLast()
        let size = heap.count - 1
        
        guard !isEmpty() else { return item }
        var (parent, child) = (1, 2)
        while child <= size {
            if child < size && getLeftChild(parent) > getRightChild(parent) {
                child += 1
            }
            guard data > heap[child] else { break }
            heap[parent] = heap[child]
            parent = child
            child *= 2
        }
        heap[parent] = data
        return item
    }
}

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost < rhs.cost
    }
    
    init(node: Int, cost: Int) {
        self.node = node
        self.cost = cost
    }
    
    let node: Int
    let cost: Int
}
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (v,e) = (input[0],input[1])
    let k = Int(readLine()!)!
    var graph = [Int:[Node]]()
    for i in 1...v {
        graph[i] = []
    }
    for _ in 0..<e {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]]!.append(Node(node: input[1], cost: input[2]))
    }
    //print(graph)
    var result: [Int] = Array(repeating: Int.max, count: v+1)
    
    func dijkstra(_ start: Int){
        var q = Heap<Node>()
        var visited = Array(repeating: false, count: v+1)
        result[start] = 0
        q.push(Node(node: start, cost: 0))
        
        while !q.isEmpty() {
            //print(result)
            let cur = q.pop()
            let node = cur!.node
            let cost = cur!.cost
            if !visited[node] {
                visited[node] = true
                let edge = graph[node]
                for next in edge! {
                    //print(next)
                    if result[next.node] > next.cost + cost {
                        result[next.node] = next.cost + cost
                        q.push(Node(node: next.node, cost: result[next.node]))
                    }
                }
            }
        }
    }
    
    dijkstra(k)
    for i in 1...v {
        print(result[i] == Int.max ? "INF" : result[i])
    }
}
solution()

```
## 1504 특정한 최단 경로
특정한 경유지를 지나쳐서 1부터 n까지의 최단 거리를 구하는 문제이다.   
단순히 1 - 경유지1    
경유지1 - 경유지2     
경유지2 - n까지의 최단거리를 전부 구해서 더하면 끝나는 문제인줄 알았으나   
5 4   
1 4 1   
1 3 1   
3 2 1   
2 5 1    
3 4   
의 경우 최단거리를 구하면 7이지만   
진짜 정답은 5이다.   
1에서 4까지 1   
1에서 5까지 가면서 경유지1(3)을 동시에 지날수있으므로 4   
따라서   
3가지 경우를 구해주는것은 맞으나 최소 거리를 비교해줘야한다.   
1. 1 - 경유지1 + 경유지1 - 경유지2 + 경유지2 - n   
2. 1 - 경유지2 + 경유지2 - 경유지1 + 경유지1 - n
   
또한 Int.max로 최단거리를 전부 구할경우
overflow가 발생할 수 도 있으므로 일정 숫자로 Int.max를 대체한다   
```
import Foundation
struct Heap <T: Comparable> {
    var heap = [T]()
    
    private func getParent(_ index: Int) -> T {
        heap[index / 2]
    }
    
    private func getLeftChild(_ index: Int) -> T {
        heap[index * 2]
    }
    
    private func getRightChild(_ index: Int) -> T {
        heap[index * 2 + 1]
    }
    
    func isEmpty() -> Bool {
        heap.count <= 1
    }
    
    mutating func push(_ data: T) {
        if isEmpty() { heap.append(data) }
        var index = heap.count
        heap.append(data)
        
        while index > 1 {
            let parent = getParent(index)
            guard parent > data else { break }
            heap[index] = parent
            index /= 2
        }
        heap[index] = data
    }
    mutating func pop() -> T? {
        guard !isEmpty() else { return nil }
        let item = heap[1]
        let data = heap.removeLast()
        let size = heap.count - 1
        
        guard !isEmpty() else { return item }
        var (parent, child) = (1, 2)
        while child <= size {
            if child < size && getLeftChild(parent) > getRightChild(parent) {
                child += 1
            }
            guard data > heap[child] else { break }
            heap[parent] = heap[child]
            parent = child
            child *= 2
        }
        heap[parent] = data
        return item
    }
}

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
    
    init(node: Int, cost: Int) {
        self.node = node
        self.cost = cost
    }
    
    let node: Int
    let cost: Int
}
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,e) = (input[0],input[1])
    var graph = [Int:[Node]]()
    
    for i in 1...n {
        graph[i] = []
    }
    

    for _ in 0..<e {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]]!.append(Node(node: input[1], cost: input[2]))
        graph[input[1]]!.append(Node(node: input[0], cost: input[2]))
    }
    let input2 = readLine()!.split(separator: " ").map{Int($0)!}
    let (stop1, stop2) = (input2[0],input2[1])
    
    
    
    func dijkstra(_ start: Int) -> [Int] {
        var result: [Int] = Array(repeating: 800001, count: n+1)
        var q = Heap<Node>()
        result[start] = 0
        q.push(Node(node: start, cost: 0))
        while !q.isEmpty() {
            let cur = q.pop()!
            let node = cur.node
            let cost = cur.cost
            let edge = graph[node]!
            for next in edge {
                if result[next.node] > cost + next.cost {
                    result[next.node] = cost + next.cost
                    q.push(Node(node: next.node, cost: result[next.node]))
                }
                
            }
            
        }
        return result
    }
    
    let dict1 = dijkstra(1)
    let dict2 = dijkstra(stop1)
    let dict3 = dijkstra(stop2)
//    print(dict1)
//    print(dict2)
//    print(dict3)
    let ans = min(dict1[stop1] + dict2[stop2] + dict3[n],dict1[stop2] + dict3[stop1] + dict2[n])
    if ans >= 800001 {
        print(-1)
    } else {
        print(ans)
    }
}
solution()


```
## 13549 숨박꼭질
bfs로 풀이하면서 순간이동시 시간초가 0 증가하는것으로 풀이하면 된다.   
```
import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k) = (input[0],input[1])
    
    var result: [Int] = Array(repeating: 0, count: 100001)
    var visited = Array(repeating: false, count: 100001)

    var q: [Int] = []
    var idx = 0
    
    func bfs() {
        q.append(n)
        
        while q.count > idx {
            let cur = q[idx]
            visited[cur] = true
            
            idx += 1
            
            if cur == k { break }
            
            if cur*2 < 100001 && !visited[cur*2] {
                q.append(cur*2)
                visited[cur*2] = true
                result[cur*2] = result[cur]
            }
            
            if cur-1 >= 0 && !visited[cur-1] {
                q.append(cur-1)
                visited[cur-1] = true
                result[cur-1] = result[cur]+1
            }
            
            if cur+1 < 100001 && !visited[cur+1] {
                q.append(cur+1)
                visited[cur+1] = true
                result[cur+1] = result[cur]+1
            }
            
        }
    }
    
    bfs()
    print(result[k])
}
solution()
```
## 9370 미확인 도착지
문제를 이해하는데 더 오래 걸린 문제였다.   
중간지인 g,h를 걸쳐서 도착예정지들을 방문하는데   
start - 도착예정지와   
start - g - h - 도착예정지 / start - h - g - 도착예정지가 같다면   
최단거리로 도착예정지로 갔다는 의미이므로 추가해준다.   
```
import Foundation
struct Heap <T: Comparable> {
    var heap = [T]()
    
    private func getParent(_ index: Int) -> T {
        heap[index / 2]
    }
    
    private func getLeftChild(_ index: Int) -> T {
        heap[index * 2]
    }
    
    private func getRightChild(_ index: Int) -> T {
        heap[index * 2 + 1]
    }
    
    func isEmpty() -> Bool {
        heap.count <= 1
    }
    
    mutating func push(_ data: T) {
        if isEmpty() { heap.append(data) }
        var index = heap.count
        heap.append(data)
        
        while index > 1 {
            let parent = getParent(index)
            guard parent > data else { break }
            heap[index] = parent
            index /= 2
        }
        heap[index] = data
    }
    mutating func pop() -> T? {
        guard !isEmpty() else { return nil }
        let item = heap[1]
        let data = heap.removeLast()
        let size = heap.count - 1
        
        guard !isEmpty() else { return item }
        var (parent, child) = (1, 2)
        while child <= size {
            if child < size && getLeftChild(parent) > getRightChild(parent) {
                child += 1
            }
            guard data > heap[child] else { break }
            heap[parent] = heap[child]
            parent = child
            child *= 2
        }
        heap[parent] = data
        return item
    }
}

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool{
        return lhs.cost < rhs.cost
    }
    
    
    init(node: Int, cost: Int) {
        self.node = node
        self.cost = cost
    }
    
    let node: Int
    let cost: Int
}

func solution(){
    // 즉,
    // start에서 출발하여 stop1, stop2를 걸쳐서 candidate까지 가는것이다.
    // 만약 start에서 출발하여 candidate까지 가는것보다
    // start - stop1 - stop2 - candidate가 더 최단거리라면
    // 성립
    
    let T = Int(readLine()!)!
    for _ in 0..<T {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (n,m,t) = (input[0],input[1],input[2])
        let input2 = readLine()!.split(separator: " ").map{Int($0)!}
        let (start,stop1,stop2) = (input2[0], input2[1], input2[2])
        var graph = [Int: [Node]]()
        for i in 1...n {
            graph[i] = []
        }
        
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            graph[input[0]]!.append(Node(node: input[1], cost: input[2]))
            graph[input[1]]!.append(Node(node: input[0], cost: input[2]))
        }
        //print(graph)
        
        var candidate: [Int] = []
        for _ in 0..<t {
            candidate.append(Int(readLine()!)!)
        }
        
        
        func dijkstra(_ start: Int) -> [Int] {
            var q = Heap<Node>()
            var distance = Array(repeating: Int.max, count: n+1)
            distance[start] = 0
            q.push(Node(node: start, cost: 0))
            
            while !q.isEmpty() {
                let cur = q.pop()
                let node = cur!.node
                let cost = cur!.cost
                let edge = graph[node]!
                
                for next in edge {
                    if distance[next.node] > cost + next.cost {
                        distance[next.node] = cost + next.cost
                        q.push(Node(node: next.node, cost: distance[next.node]))
                    }
                }
            }
            return distance
        }
        
        
        let list1 = dijkstra(start)
        let list2 = dijkstra(stop1)
        let list3 = dijkstra(stop2)
        
        var result: [Int] = []
        for c in candidate where list1[c] != Int.max {
            var versusB = Int.max
            if list1[stop1] != Int.max && list2[stop2] != Int.max && list3[c] != Int.max {
                versusB = list1[stop1]+list2[stop2]+list3[c]
            }
            
            var versusC = Int.max
            if list1[stop2] != Int.max && list3[stop1] != Int.max && list2[c] != Int.max {
                versusC = list1[stop2]+list3[stop1]+list2[c]
            }
            
            if list1[c] == versusB || list1[c] == versusC {
                result.append(c)
            }
        }
        
        print(result.sorted(by: <).map{String($0)}.joined(separator: " "))
    }
}
solution()


```
## 11657 타임머신
음의 간선이 있기 때문에 벨만-포드 알고리즘을 이용하는 문제이다.   
```
import Foundation
func solution(){
    let INF = Int.max
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var graph: [(Int,Int,Int)] = []
    var distance = Array(repeating: INF, count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph.append((input[0],input[1],input[2]))
    }
    
    
    func BF(_ start: Int) -> Bool {
        distance[start] = 0
        for i in 1...n {
            for j in 0..<m {
                let cur = graph[j].0
                let next = graph[j].1
                let cost = graph[j].2
                
                if distance[cur] != INF && distance[next] > distance[cur] + cost {
                    distance[next] = distance[cur] + cost
                    
                    if n == i { return true }
                }
            }
        }
        return false
    }
    
    if BF(1) {
        print(-1)
    } else {
        distance[2...].forEach{print($0 >= INF ? -1 : $0)}
    }
    
}
solution()


```
