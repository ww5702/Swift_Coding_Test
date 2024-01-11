# 그래프의 간선에 가중치가 없으면 BFS로 최단거리를 찾을 수 있습니다. 가중치가 있다면 어떨까요?	
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
