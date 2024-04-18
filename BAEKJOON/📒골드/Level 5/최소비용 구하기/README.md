처음엔 단순히 bfs로 풀이했으나 시간초과가 발생하였다.   
따라서 최소힙을 구현하여 작은 코스트 순서대로 진행해야 시간초과가 발생하지 않는다.   

```
import Foundation
struct Heap<T: Comparable> {
    var heap = [T]()

    private func isEmpty() -> Bool {
        heap.count <= 1
    }

    private func getParent(_ index: Int) -> T {
        heap[index / 2]
    }

    private func getLeftChild(_ index: Int) -> T {
        heap[index * 2]
    }

    private func getRightChild(_ index: Int) -> T {
        heap[index * 2 + 1]
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
        let last = heap.removeLast()
        let size = heap.count - 1

        guard !isEmpty() else { return item }

        var (parent, child) = (1, 2)

        while child <= size {
            if size > child, getLeftChild(parent) > getRightChild(parent) {
                    child += 1
            }

            if last <= heap[child] { break }
            heap[parent] = heap[child]
            parent = child
            child *= 2
        }
        heap[parent] = last
        return item
    }
}
struct City: Comparable {
    static func < (lhs: City, rhs: City) -> Bool {
        lhs.cost < rhs.cost
    }

    init(_ city: Int, _ cost: Int) {
        self.city = city
        self.cost = cost
    }

    let city: Int
    let cost: Int
}

func solution(){
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var graph = [Int:[City]]()
    Array(1...n).forEach { graph[$0] = [] }
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]]!.append(City(input[1], input[2]))
    }
    //print(graph)
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (start, end) = (input[0],input[1])
    var dis = Array(repeating: Int.max, count: n+1)
    dis[start] = 0
    dijkstra()
    
    func dijkstra() {
        var visited = [Bool](repeating: false, count: n+1)
        var q = Heap<City>()
        q.push(City(start, 0))
        
        while let cur = q.pop() {
            let (now, cost) = (cur.city, cur.cost)
            guard !visited[now] else {continue}
            visited[now] = true
            
            if let edges = graph[now] {
                for next in edges {
                    let (nextCity, nextCost) = (next.city, next.cost)
                    guard !visited[nextCity] else { continue }
                    
                    if dis[nextCity] > cost + nextCost {
                        dis[nextCity] = cost+nextCost
                        q.push(City(nextCity, dis[nextCity]))
                    }
                }
            }
        }
        
    }
    
    print(dis[end])
    
}
solution()

```
