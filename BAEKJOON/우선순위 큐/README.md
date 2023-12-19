# 가장 작은/큰 원소를 뽑는 자료구조를 배워 봅시다.	
## 11279 최대 힙
우선순위 큐로 풀이하는 문제이기에 정석으로 풀이하면 다음과 같다.   

```
import Foundation
public struct Heap<T> {
    
    private var nodes = [T]()
    
    private var orderCriteria: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public var count: Int {
        return nodes.count
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    func isEmpty() -> Bool {
        return nodes.isEmpty
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 0 {
            return 0 as! T
        }
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let lastIndex = nodes.count-1
        if index != lastIndex {
            nodes.swapAt(index, lastIndex)
            shiftDown(from: index, until: lastIndex)
            shiftUp(index)
        }
        
        return nodes.removeLast()
    }
    
    private func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    private func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    
    private func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: index)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
    
}
func solution() {
    let n = Int(readLine()!)!
    var q = Heap<Int>(sort:>)
    for _ in 0..<n {
        let input = Int(readLine()!)!
        if input == 0 {
            if q.count == 0 { print(0) }
            else { print(q.remove()!) }
        } else {
            q.insert(input)
        }
    }
}

solution()

```
하지만 크기가 적어서 그런지 밑과 같은 방식으로도 풀이가 가능했다.   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var arr: [Int] = []
    for _ in 0..<n {
        let input = Int(readLine()!)!
        if input == 0 {
            if arr.count == 0 { print(0) }
            else {
                var max = 0, index = 0
                for i in 0..<arr.count {
                    if max < arr[i] {
                        max = arr[i]
                        index = i
                    }
                }
                arr[index] = 0
                print(max)
            }
        } else {
            arr.append(input)
        }
    }
}

solution()

```
## 1927 최소 힙
최대 힙과 반대인 문제이다.   
처음 heap을 불러올때 sort를 < 로 설정해주기만 하면 된다.   

```
import Foundation
public struct Heap<T> {
    
    private var nodes = [T]()
    
    private var orderCriteria: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public var count: Int {
        return nodes.count
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    func isEmpty() -> Bool {
        return nodes.isEmpty
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 0 {
            return 0 as! T
        }
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let lastIndex = nodes.count-1
        if index != lastIndex {
            nodes.swapAt(index, lastIndex)
            shiftDown(from: index, until: lastIndex)
            shiftUp(index)
        }
        
        return nodes.removeLast()
    }
    
    private func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    private func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    
    private func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: index)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
    
}
func solution() {
    let n = Int(readLine()!)!
    var q = Heap<Int>(sort:<)
    for _ in 0..<n {
        let input = Int(readLine()!)!
        if input == 0 {
            if q.count == 0 { print(0) }
            else { print(q.remove()!) }
        } else {
            q.insert(input)
        }
    }
}

solution()

```
## 11286 절댓값 힘 
dictionary로 풀이를 해보려 했지만 시간초과 발생   
다르게 풀지말고 힙으로 풀이하라는 의미이다.   
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var list: [Int:Int] = [:]
    
    for _ in 0..<n {
        let input = Int(readLine()!)!
        if input == 0 {
            if list.count == 0 { print(0) }
            else {
                var min = Int.max
                for (key,value) in list {
                    if min > abs(key) {
                        min = abs(key)
                    }
                }
                //print(list)
                if list[-min] != nil {
                    print(-min)
                    if list[-min] == 1 {
                        list.removeValue(forKey: -min)
                    } else {
                        list[-min]! -= 1
                    }
                } else {
                    print(min)
                    if list[min] == 1 {
                        list.removeValue(forKey: min)
                    } else {
                        list[min]! -= 1
                    }
                }
                //print(list)
            }
            
        } else {
            var value = list[input] ?? 0
            list[input] = value + 1
        }
        
        
    }
}

solution()

```
위 문제들과 같게 우선순위큐를 준비한다.   
다만 힙을 선언할때 sort부분을 단순하게 < / > 로 해주는것이 아닌   
조건에 따라 선언해준다.   
```
import Foundation
public struct Heap<T> {
    
    private var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public var count: Int {
        return nodes.count
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    func isEmpty() -> Bool {
        return nodes.isEmpty
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let lastIndex = nodes.count-1
        if index != lastIndex {
            nodes.swapAt(index, lastIndex)
            shiftDown(from: index, until: lastIndex)
            shiftUp(index)
        }
        
        return nodes.removeLast()
    }
    
    private func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    private func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    
    private func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: index)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
    
}
func solution() {
    let n = Int(readLine()!)!
    var heap = Heap<Int> {
        if abs($0) < abs($1) {
            return true
        } else if abs($0) == abs($1){
            return $0 < $1
        } else {
            return false
        }
    }
    for _ in 0..<n {
        let input = Int(readLine()!)!
        if input == 0 {
            if heap.count == 0 { print(0) }
            else {
                print(heap.remove()!)
            }
        } else {
            heap.insert(input)
        }
    }
}

solution()

```
