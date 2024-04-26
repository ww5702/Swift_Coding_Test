문제풀이는 쉬우나 swift로는 시간초과를 받기 너무 쉽다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var graph: [[Int]] = Array(repeating: [], count: n+1)
    //print(graph)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[1]].append(input[0])
    }
    //print(graph)
    var result = Array(repeating: 0, count: n+1)
    var maxCnt = 0
    for i in 1...n {
        result[i] = bfs(i).count
        maxCnt = max(maxCnt, result[i])
    }
    
    var answer: [Int] = []
    for i in 1...n {
        if result[i] == maxCnt {
            answer.append(i)
        }
    }
    
    print(answer.map{String($0)}.joined(separator: " "))
    
    func bfs(_ node: Int) -> [Int] {
        var q: [Int] = []
        q.append(node)
        var visited = Array(repeating: false, count: n+1)
        visited[node] = true
        var idx = 0
        
        while (q.count > idx) {
            let now = q[idx]
            idx += 1
            
            for next in graph[now] {
                q.append(next)
                visited[next] = true
            }
        }
        return q
    }
}
solution()

```
해결방법을 찾다 UInt16을 이용하면 10,000보다 작은 노드수의 시간초과를 피할 수 있다는 것을 찾게 되었고   
Q의 enqueue 와 dequeue를 이용하여 풀이할 수 있다.   
```
import Foundation
struct Queue<T> {
    var pushStack = [T]()
    var popStack = [T]()
    var isEmpty: Bool {
        return pushStack.isEmpty && popStack.isEmpty
    }
    var count: Int {
        return pushStack.count + popStack.count
    }

    mutating func enqueue(_ element: T) {
        pushStack.append(element)
    }

    mutating func dequeue() -> T? {
        if popStack.isEmpty {
            while let popped = pushStack.popLast() {
                popStack.append(popped)
            }
        }
        return popStack.popLast()
    }
}

func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var graph: [[UInt16]] = Array(repeating: [], count: n+1)
    //print(graph)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[1]].append(UInt16(input[0]))
    }
    //print(graph)
    var result: [UInt16] = Array(repeating: 0, count: n+1)
    var maxCnt = 0
    
    for i in 1...n {
        var visited = Array(repeating: false, count: n+1)
        var q = Queue<UInt16>()
        visited[i] = true
        for next in graph[i] {
            if !visited[Int(next)] {
                q.enqueue(UInt16(next))
                result[i] += 1
                visited[Int(next)] = true
            }
        }
        
        while let dequeued = q.dequeue() {
            for next in graph[Int(dequeued)] {
                if !visited[Int(next)] {
                    q.enqueue(next)
                    result[i] += 1
                    visited[Int(next)] = true
                }
            }
        }
        maxCnt = max(maxCnt, Int(result[i]))
    }
    //print(result)
    for i in 1...n {
        if (result[i] == maxCnt) {
            print(i, terminator: " ")
        }
    }
}
solution()

```
