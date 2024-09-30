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
    var maxPriorityQueue = Heap<Int> { $0 > $1 }
    let nht = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,h,t) = (nht[0],nht[1],nht[2])
    var isOne = false
    for _ in 0..<n {
        maxPriorityQueue.insert(Int(readLine()!)!)
    }
    var cnt = 0
    
    for _ in 0..<t {
        //print(maxPriorityQueue, maxPriorityQueue.count)
        if maxPriorityQueue.first! < h {
            break
        }
        
        var num = maxPriorityQueue.delete()!
        if num != 1 {
            num /= 2
            cnt += 1
        }
        maxPriorityQueue.insert(num)
        
        if num == 1 {
            isOne = true
            break
        }
    }
    //print(maxPriorityQueue, maxPriorityQueue.count, maxPriorityQueue.first!)
    if isOne {
        print("NO")
        print(maxPriorityQueue.first!)
    } else {
        if maxPriorityQueue.first! < h {
            print("YES")
            print(cnt)
        } else {
            print("NO")
            print(maxPriorityQueue.first!)
        }
    }
    
}

solution()
/*
 */


```
