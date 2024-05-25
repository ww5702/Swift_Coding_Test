당연하지만 큐 하나로 풀이하는건 쉽지 않다.   

```
import Foundation

func solution(){
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let k = Int(readLine()!)!
        var q: [Int] = []
        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map{String($0)}
            if input[0] == "I" {
                q.append(Int(input[1])!)
                q.sort()
            } else {
                if input[1] == "-1" {
                    if !q.isEmpty {
                        q.reverse()
                        q.removeLast()
                        q.reverse()
                    }
                } else {
                    if !q.isEmpty {
                        q.removeLast()
                    }
                }
            }
            //print(q)
        }
        
        if q.isEmpty {
            print("EMPTY")
        } else {
            if q.count == 1 {
                print(q.first!)
            } else {
                print("\(q.last!) \(q.first!)")
            }
        }
    }
}
solution()

```
따라서 힙을 구현하고 풀이해야한다.   

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

func solution(){
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let k = Int(readLine()!)!
        var minPriorityQueue = Heap<Int> { $0 < $1 }
        var maxPriorityQueue = Heap<Int> { $0 > $1 }
        var countDictionary: [Int: Int] = [:]
        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map{String($0)}
            if input[0] == "I" {
                minPriorityQueue.insert(Int(input[1])!)
                maxPriorityQueue.insert(Int(input[1])!)
                
                if countDictionary[Int(input[1])!] == nil {
                    countDictionary[Int(input[1])!] = 1
                } else {
                    countDictionary[Int(input[1])!]! += 1
                }
            } else {
                if input[1] == "-1" {
                    while !minPriorityQueue.isEmpty {
                        let minValue = minPriorityQueue.delete()!
                        if countDictionary[minValue] != nil && countDictionary[minValue]! > 0 {
                            countDictionary[minValue]! = countDictionary[minValue]! - 1
                            if countDictionary[minValue]! == 0 {
                                countDictionary[minValue] = nil
                            }
                            break
                        }
                    }
                } else {
                    while !maxPriorityQueue.isEmpty {
                        let maxValue = maxPriorityQueue.delete()!
                        if countDictionary[maxValue] != nil && countDictionary[maxValue]! > 0 {
                            countDictionary[maxValue]! = countDictionary[maxValue]! - 1
                            if countDictionary[maxValue]! == 0 {
                                countDictionary[maxValue] = nil
                            }
                            break
                        }
                    }
                }
            }
        }
        
        if countDictionary.isEmpty {
            print("EMPTY")
        } else {
            let sortedDictionary = countDictionary.sorted { $0.key > $1.key }
            print("\(sortedDictionary[0].key) \(sortedDictionary[sortedDictionary.endIndex - 1].key)")
        }
    }
}
solution()

```
