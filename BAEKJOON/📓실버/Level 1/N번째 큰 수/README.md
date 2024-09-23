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
file입출력까지 사용해야 통과가 된다.   

```
import Foundation
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

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
    let fileIO = FileIO()
    let n = fileIO.readInt()

    for i in 0..<n {
        for j in 0..<n {
            let number = fileIO.readInt()
            
            if minPriorityQueue.count >= n {
                if minPriorityQueue.first! < number {
                    minPriorityQueue.delete()
                    minPriorityQueue.insert(number)
                }
            } else {
                minPriorityQueue.insert(number)
            }
        }
    }
    //print(board)
    
    print(minPriorityQueue.first!)
}

solution()
/*
 */


```
