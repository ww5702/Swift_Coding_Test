import Foundation

struct Heap<Element> {
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        elements.swapAt(0, count - 1)
        let element = elements.removeLast()
        siftDown(elementAtIndex: 0)
        return element
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(forIndex: index)
        
        if index == childIndex {
            return
        }
        
        elements.swapAt(index, childIndex)
        siftDown(elementAtIndex: childIndex)
    }
    
    mutating func siftUp(elementAtIndex index: Int) {
        let parentIndex = parentIndexForElement(atIndex: index)
        
        if index > 0 && priorityFunction(elements[index], elements[parentIndex]) {
            elements.swapAt(index, parentIndex)
            siftUp(elementAtIndex: parentIndex)
        }
    }
    
    func parentIndexForElement(atIndex index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func leftChildIndexForElement(atIndex index: Int) -> Int {
        return 2 * index + 1
    }
    
    func rightChildIndexForElement(atIndex index: Int) -> Int {
        return 2 * index + 2
    }
    
    func highestPriorityIndex(forIndex index: Int) -> Int {
        let leftChildIndex = leftChildIndexForElement(atIndex: index)
        let rightChildIndex = rightChildIndexForElement(atIndex: index)
        
        if rightChildIndex < count && priorityFunction(elements[rightChildIndex], elements[leftChildIndex]) {
            return rightChildIndex
        } else if leftChildIndex < count {
            return leftChildIndex
        }
        
        return index
    }
}

func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,start) = (input[0],input[1],input[2])
    let INF = 987654321
    var graph = Array(repeating: [(Int,Int)](), count: n+1)
    var distance = Array(repeating: INF, count: n+1)
    for _ in 0..<m {
        let xyz = readLine()!.split(separator: " ").map{Int($0)!}
        let (x,y,z) = (xyz[0],xyz[1],xyz[2])
        graph[x].append((y,z))
    }
    print(graph)
    func dijkstra(start: Int) {
        var q = Heap<(Int, Int)>(priorityFunction: { $0.0 < $1.0 })
        q.enqueue((0, start))
        distance[start] = 0
        
        while !q.isEmpty {
            let (dist, now) = q.dequeue()!
            
            if distance[now] < dist {
                continue
            }
            
            for i in graph[now] {
                let cost = dist + i.1
                
                if cost < distance[i.0] {
                    distance[i.0] = cost
                    q.enqueue((cost, i.0))
                }
            }
        }
    }
    dijkstra(start: start)
    var count = 0
    var max_distance = 0
    for d in distance {
        if d != INF {
            count += 1
            max_distance = max(max_distance,d)
        }
    }
    print(count - 1, max_distance)
}
solution()
