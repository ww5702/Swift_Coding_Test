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
힙을 이용해서 정렬된 배열을 가지고 풀이하니 통과   
```
import Foundation
struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
        
    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        array.append(newElement)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && compare(array[parentIndex], array[childIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if array.isEmpty {
            return nil
        }
        if array.count == 1 {
            return array.removeLast()
        }
        
        let value = array[0]
        array[0] = array.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < array.count && compare(array[target], array[leftChildIndex]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && compare(array[target], array[rightChildIndex]) {
                target = rightChildIndex
            }
            if target == index {
                break
            }
            
            array.swapAt(target, index)
            index = target
            
        }
        
        return value
    }
}

func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var edges = Array(repeating: [(Int,Int)](), count: n+1)
    var heap = Heap<(Int,Int)> {$0.1 > $1.1}
    var dis = Array(repeating: Int.max, count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        edges[input[0]].append((input[1],input[2]))
        edges[input[1]].append((input[0],input[2]))
    }
    
    //print(edges)
    heap.enheap((1,0))
    dis[1] = 0
    
    while true {
        guard let now = heap.deheap() else { break }
        if now.1 > dis[now.0] { continue }
        
        for edge in edges[now.0] {
            if now.1 + edge.1 < dis[edge.0] {
                dis[edge.0] = now.1 + edge.1
                heap.enheap((edge.0, now.1+edge.1))
            }
        }
    }
    
    print(dis[n])
}
solution()
/*
 */

```
