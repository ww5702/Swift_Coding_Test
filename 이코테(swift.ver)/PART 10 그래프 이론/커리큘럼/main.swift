import Foundation
struct Deque<T> {
    private var elements = [T]()
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        if elements.isEmpty {
            return nil
        } else {
            return elements.removeFirst()
        }
    }
    
    mutating func dequeueBack() -> T? {
        if elements.isEmpty {
            return nil
        } else {
            return elements.removeLast()
        }
    }
    
    mutating func isEmpty() -> Bool {
        if elements.count <= 0 { return true }
        else { return false }
    }
}
func solution() {
    let v = Int(readLine()!)!
    var indegree = Array(repeating: 0, count: v+1)
    var graph = [[Int]](repeating: [], count: v + 1)
    var time = Array(repeating: 0, count: v+1)
    
    for i in 1..<v+1 {
        let data = readLine()!.split(separator: " ").map{Int($0)!}
        time[i] = data[0]
        for x in data[1..<data.count-1] {
            indegree[i] += 1
            graph[x].append(i)
        }
    }
    print("graph \(graph)")
    func topology_sort() {
        var result = time
        var q = Deque<Int>()
        for i in 1..<v+1 {
            if indegree[i] == 0 {
                q.enqueue(i)
            }
        }
        print("indegree \(indegree)")
        print("time \(time)")
        print("result \(result)")
        while !q.isEmpty() {
            let now = q.dequeue()
            for i in graph[now!] {
                result[i] = max(result[i], result[now!]+time[i])
                print("\(i) result \(result)")
                indegree[i] -= 1
                if indegree[i] == 0 {
                    q.enqueue(i)
                }
            }
        }
        
        for i in 1..<v+1 {
            print(result[i])
        }
    }
    
    topology_sort()
}
solution()
