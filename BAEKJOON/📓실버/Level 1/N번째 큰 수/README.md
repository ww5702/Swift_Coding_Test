최대힙을 사용했지만 시간초과   

```
import Foundation
struct Heap<T> {
    var elements: [T]
    var sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.elements = []
        self.sort = sort
    }
    
    var isEmpty: Bool { return elements.count <= 1 }
    var count: Int { return elements.count - 1 }
    
    var first: T? {
        if isEmpty { return nil }
        return elements[1]
    }
    
    var last: T? {
        if isEmpty { return nil }
        return elements[elements.endIndex - 1]
    }
    func parent(_ index: Int) -> Int { return index / 2}
    func leftChild(_ index: Int) -> Int { return index * 2}
    func rightChild(_ index: Int) -> Int { return index * 2 + 1}
    
    mutating func top() {
        var index = elements.endIndex - 1
        var parentIndex = parent(index)
        while index > 1 && sort(elements[index], elements[parentIndex]) {
            elements.swapAt(index, parentIndex)
            index = parentIndex
            parentIndex = index / 2
        }
    }
    
    mutating func down(index: Int) {
        let left = leftChild(index)
        let right = rightChild(index)
        var target = index
        
        if left < elements.endIndex && sort(elements[left], elements[target]) {
            target = left
        }
        if right < elements.endIndex && sort(elements[right], elements[target]) {
            target = right
        }
        if target != index {
            elements.swapAt(target, index)
            down(index: target)
        }
    }
    
    mutating func insert(_ element: T) {
        if elements.isEmpty {
            elements.append(element)
        }
        elements.append(element)
        top()
    }
    
    mutating func delete() -> T? {
        if isEmpty { return nil }
        let returnData = elements[1]
        elements.swapAt(1, elements.endIndex - 1)
        elements.removeLast()
        down(index: 1)
        return returnData
    }
}
func solution() {
    var minPriorityQueue = Heap<Int> { $0 < $1 }
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board[i] = input
    }
    //print(board)
    
    for i in 0..<n {
        for j in 0..<n {
            if minPriorityQueue.count >= n {
                if minPriorityQueue.first! < board[i][j] {
                    minPriorityQueue.delete()
                    minPriorityQueue.insert(board[i][j])
                }
            } else {
                minPriorityQueue.insert(board[i][j])
            }
            //print(minPriorityQueue)
        }
    }
    
    print(minPriorityQueue.first!)
}

solution()
/*
 */


```
