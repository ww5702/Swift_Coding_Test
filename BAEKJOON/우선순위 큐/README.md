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
## 1520 내리막 길
길찾기 문제라 bfs로 풀이해봤지만 시간초과   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n) = (input[0],input[1])
    var board = [[Int]]()
    for i in 0..<m {
        board.append([])
        board[i] = readLine()!.split(separator: " ").map{Int($0)!}
    }
    //print(board)
    var result = 0
    func bfs(_ x: Int, _ y: Int) {
        //print(x,y)
        if x == m-1 && y == n-1 {
            result += 1
            return
        }
        
        //상
        if x >= 1 {
            if board[x-1][y] < board[x][y] {
                bfs(x-1,y)
            }
        }
        
        //하
        if x < m-1 {
            if board[x+1][y] < board[x][y] {
                bfs(x+1,y)
            }
        }
        
        //좌
        if y >= 1 {
            if board[x][y-1] < board[x][y] {
                bfs(x,y-1)
            }
        }
        
        //우
        if y < n-1 {
            if board[x][y+1] < board[x][y] {
                bfs(x,y+1)
            }
        }
    }
    
    bfs(0,0)
    print(result)
}

solution()
```

dfs에 dp를 더해서 풀이할 수 있다.   
먼저 -1로 dp를 초기화하여 방문한 노드인지 아닌지 확인한다.   
확인한 노드가 미방문한 노드라면 0으로 정정후 상하좌우로 이동가능하고,   
이동할 수 있는 노드가 현재 노드보다 작다면 이동시킨다.   
그리고 제일 밑부터 0으로 초기화된 노드가 dp[y][x]에 저장되면서   
dp[0][0]으로 최종으로 저장된다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n) = (input[0],input[1])
    var board = [[Int]]()
    for i in 0..<m {
        board.append([])
        board[i] = readLine()!.split(separator: " ").map{Int($0)!}
    }
    //print(board)
    
    var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)
    
    let dy = [0,1,0,-1]
    let dx = [1,0,-1,0]
    
    func dfs(_ y: Int, _ x: Int) -> Int {
        if y == (m-1) && x == (n-1) { return 1 }
        
        if dp[y][x] == -1 {
            dp[y][x] = 0
            for dir in 0..<4 {
                let ny = y + dy[dir]
                let nx = x + dx[dir]
                //print(ny,nx)
                if (0 <= ny && ny <= m-1 && 0 <= nx && nx <= n-1) 
                    && board[y][x] > board[ny][nx] {
                    dp[y][x] += dfs(ny,nx)
                }
            }
        }
        //print(dp)
        return dp[y][x]
    }
    print(dfs(0,0))

}

solution()

```
## 2629 양팔저울
dp로 풀이하는 방식은 맞지만   
2차원 배열로 풀이한다.   
500g의 추 30개가 행으로   
추의 개수가 열로 들어간다.   
즉, 1개의 추로 만들수있는 무게가 행렬1에 들어가고    
2개의 추로 만들 수 있는 무게가 행렬2에 들어가고 이런 방식이다.   
만들 수 있는 무게는 3가지 경우이다.   
1. 추의 무게에 추가하기
2. 구슬쪽에 무게 추가하기
3. 어느곳도 추가하지 않기
이 모든 공식으로 적용시키면 n개의 추를 다 썼을때 만들 수 있는 무게가 나온다.
해당 값들을 출력해준다.
   
   
로 풀이했으나 계속해서 실패가 출력된다.   
이유가 모르겠어서 일단 코멘트 후 넘긴다.   
```
import Foundation
func solution() {
    let value = Int(readLine()!)!
    let list: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    let input = Int(readLine()!)!
    let check: [Int] = readLine()!.split(separator: " ").map{Int($0)!}

    // 추를 추가하지 않았을 경우
    // 추를 구슬쪽에 추가
    // 추를 무게쪽에 추가
    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: 15001), count: list.count+1)
    
    func checkOk(_ idx: Int, _ weight: Int) {
        guard !dp[idx][weight] else { return }
        
        dp[idx][weight] = true
        
        // 무게를 다 썼다.
        guard idx < list.count else { return }
        
        
        checkOk(idx+1, weight + list[idx])
        checkOk(idx+1, weight)
        checkOk(idx+1, abs(weight - list[idx]))
    }
    checkOk(0, 0)
    var result: [String] = []
    for i in 0..<input {
        if dp[list.count-1][check[i]] {
            result.append("Y")
        } else {
            result.append("N")
        }
    }
    print(result.joined(separator: " "))
}

solution()

```
## 2293 동전 1
해당 알고리즘은 밑의 경우를 이해만 할 수 있다면 쉽게 풀이 할 수 있다.   
  1  2  3  4  5     
1 1  1  1  1  1   
2 0  1  1  2  2   
총 1  2  2  3  3   
이렇게 경우의 수가 존재한다.   
1로 1 2 3 4 5원을 만드는 경우는 한가지씩 있다.   
2원으로 1은 만들 수 없고   
2는 0에서 2원을 더한 1가지가 있다.   
3은 1에서 2를 더해 1가지가 있고   
4는 1을 2개인 경우와 2가 하나인 경우에서 2를 더해 만들 수 있다.   
즉, 총 값인 dp[2]의 값을 그대로 dp[4]에 더한다는 의미이다.   

stride를 쓴 이유는 5원의 값어치의 동전은 4원까지는 쓸모가 없는 동전이기때문이다.   
stride안에 pow조건문을 사용하지 않으면 dp의 값이 2^31 값을 넘기는 경우가 있어   
런타임 에러가 발생한다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let(n,k) = (input[0],input[1])
    var coins: [Int] = []
    for _ in 0..<n {
        coins.append(Int(readLine()!)!)
    }
    var dp: [Int] = Array(repeating: 0, count: k+1)
    dp[0] = 1
    /*
     동전을 만드는 경우
     1 2 5원일때
     6원 = 5원+1원, 4원+2원, 1원+5원
     */
    
    for i in 0..<n {
        for j in stride(from: coins[i], through: k, by: 1) {
            // dp값이 2^31을 넘어가는 경우
            if dp[j]+dp[j-coins[i]] >= Int(pow(2.0, 31.0)) {
                dp[j] = 0
            } else {
                dp[j] += dp[j-coins[i]]
            }
            
            //print(dp)
        }
    }
    print(dp[k])
}

solution()

```
## 7579 앱

```

```
