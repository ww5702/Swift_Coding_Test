구현으로 풀이해봤지만 당연히 시간초과   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (input[0],input[1])
    var list: [(Int,Int)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        list.append((input[0],input[1]))
    }
    list.sort(by: {$0.0 < $1.0})
    var visited = Array(repeating: false, count: n)
    //print(list)
    var bag: [Int] = []
    for _ in 0..<k {
        bag.append(Int(readLine()!)!)
    }
    bag.sort(by:<)
    var result = 0
    // 작은 무게 순으로 해당 무게 안에서 가장 값이 큰 것
    for i in 0..<k {
        let weight = bag[i]
        var maxCost = 0
        var idx = 0
        for j in 0..<n {
            // 무게가 넘어갈때까지
            if list[j].0 > weight { break }
            
            if list[j].1 > maxCost && !visited[j] {
                maxCost = list[j].1
                idx = j
            }
        }
        visited[idx] = true
        result += maxCost
        //print(maxCost, idx)
    }
    print(result)
}

solution()
/*
 5 30
 10 20
 15 10
 15
 5
 
 30 0
 20 30
 
 */

```
아니길 바랬지만 우선순위큐로 구하는 것이었다.   
해당 가방의 무게까지 보석들을 전부 넣고   
들어간 보석들중 가장 가치가 높은 보석을 빼서 더해준다.   
하지만 3%에서 런타임에러가 걸리는데   
만약 가방의 무게가 보석의 무게보다 더 낮을때 아무것도 넣을 수 없어서 발생한다.   
따라서 nil이라면 0을 더해주는 예외사항을 더해준다.   

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
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (input[0],input[1])
    var list: [(Int,Int)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        list.append((input[0],input[1]))
    }
    list.sort(by: {$0.0 < $1.0})
    //print(list)
    var bag: [Int] = []
    for _ in 0..<k {
        bag.append(Int(readLine()!)!)
    }
    bag.sort(by:<)
    var result = 0
    var maxPQ = Heap<Int>{$0 > $1}
    var idx = 0
    // 작은 무게 순으로 해당 무게 안에서 가장 값이 큰 것
    for i in 0..<k {
        let weight = bag[i]
        while idx < list.count && list[idx].0 <= weight {
            maxPQ.insert(list[idx].1)
            idx += 1
        }
        //print(maxPQ)
        result += maxPQ.last != nil ? maxPQ.delete()! : 0
        //print(result)
    }
    print(result)
}

solution()
/*
 3 2
 5 30
 10 20
 15 10
 15
 5
 
 30 0
 20 30
 
 */

```

