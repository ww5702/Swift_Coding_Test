# 대표적인 그래프 종류 중 하나인 트리를 다뤄 봅시다.	
## 11725 트리의 부모 찾기
bfs로 접근하여 풀이하였다.   
이미 루트노드에서 출발하므로 만약 방문한 순간 0이라면   
해당 노드가 부모 노드인것이다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var graph = [[Int]](repeating: [Int](repeating: 0, count: 0), count: n+1)
    for _ in 0..<n-1 {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    var visited = Array(repeating: 0, count: n+1)
    //print(graph)
    
    func bfs(_ start: Int) {
        var q: [Int] = []
        q.append(start)
        var idx = 0
        
        visited[start] = -1
        while q.count > idx {
            let cur = q[idx]
            idx += 1
            for node in graph[cur] {
                if visited[node] == 0 {
                    visited[node] = cur
                    q.append(node)
                }
            }
        }
    }
    bfs(1)
    for i in 2...n {
        print(visited[i])
    }
}
solution()

```
## 1167 트리의 지름
가장 길이가 긴 지름을 구하기 위해서는 일단 가장 밑에 있는 노드를 찾아야한다.   
따라서 깊이우선탐색 dfs를 사용하여 가장 밑 노드를 찾아준다(lastnode)   
그리고 lastnode에서 맨 위로 다시 dfs를 사용한다.   

```
import Foundation
func solution(){
    let v = Int(readLine()!)!
    var graph = Array(repeating: [(Int,Int)](), count: v+1)
    for _ in 1...v {
        let arr = readLine()!.split(separator:" ").map{Int(String($0))!}
        var idx = 1
        while true {
            if arr[idx] == -1 { break }
            graph[arr[0]].append((arr[idx],arr[idx+1]))
            idx += 2
        }
    }
    //print(graph)
    var visited = Array(repeating: false, count: v+1)
    var lastNode = 0
    var length = 0
    
    func dfs(_ node: Int, _ depth: Int) {
        visited[node] = true
        if length < depth {
            length = depth
            lastNode = node
        }
        
        for i in graph[node] {
            if !visited[i.0] {
                dfs(i.0, depth + i.1)
            }
        }
    }
    dfs(1,0)
    //print(lastNode, length)
    length = 0
    visited = Array(repeating: false, count: v+1)
    dfs(lastNode, 0)
    print(length)
}
solution()
```
## 1967 트리의 지름
dfs,bfs 아무거나 상관없는 문제이다.   
일단 1에서 시작하여 가장 멀리 떨어진 노드를 구한다.   
해당 노드에서 다시 출발하여 각각의 떨어진 길이를 구한다.   
해당 길이중 가장 거리가 먼 노드까지의 거리가 트리의 지름이다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var graph = Array(repeating: [(Int,Int)](), count: n+1)
    for _ in 0..<n-1 {
        let arr = readLine()!.split(separator:" ").map{Int(String($0))!}
        graph[arr[0]].append((arr[1],arr[2]))
        graph[arr[1]].append((arr[0],arr[2]))
    }
    //print(graph)
    var visited = Array(repeating: 0, count: n+1)
    
    func bfs(_ start: Int) {
        var idx = 0
        var q: [(Int,Int)] = [(start,0)]
    
        while q.count > idx {
            let cur = q[idx]
            idx += 1
            
            for node in graph[cur.0] {
                if visited[node.0] == 0 {
                    visited[node.0] = cur.1 + node.1
                    q.append((node.0, visited[node.0]))
                }
            }
        }
    }
    
    
    bfs(1)
    //print(visited)
    let max = visited.max()!
    let temp = visited.firstIndex(of: max)!
    
    visited = Array(repeating: 0, count: n+1)
    bfs(temp)
    
    print(visited.max()!)
}
solution()

```
## 1991 트리 순회
주어진 트리에서 부모노드를 출력후 왼쪽 오른쪽을 방문할지   
왼쪽 방문후 부모노드 출력 오른쪽노드 방문할지   
왼쪽 오른쪽 방문 후 부모노드를 출력할지 정하면 된다.   
```
import Foundation
struct Node {
    let left: String
    let right: String
}
func solution(){
    let n = Int(readLine()!)!
    var tree: [String:Node] = [:]
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
//        print(input)
        tree[input[0]] = Node(left: input[1], right:input[2])
    }
    //print(tree)
    
    func pre(_ node: String) {
        if node == "." { return }
        print(node, terminator: "")
        pre(tree[node]!.left)
        pre(tree[node]!.right)
    }
    
    func inorder(_ node: String) {
        if node == "." { return }
        inorder(tree[node]!.left)
        print(node, terminator: "")
        inorder(tree[node]!.right)
        
    }
    
    func post(_ node: String) {
        if node == "." { return }
        post(tree[node]!.left)
        post(tree[node]!.right)
        print(node, terminator: "")
    }
    
    pre("A")
    print()
    inorder("A")
    print()
    post("A")
    
}
solution()

```
## 2263 
후위 순회의 끝값은 항상 루트노드인 점을 이용하여 풀이하는 방식이다.   
찾아낸 루트노드값을 출력해주고 left, right를 방문해준다.   
하지만 이해가 완벽하게 되지는 않았다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var inorder = readLine()!.split(separator: " ").map{Int(String($0))!}
    inorder.insert(0, at: 0)
    var postorder = readLine()!.split(separator: " ").map{Int(String($0))!}
    postorder.insert(0, at: 0)
    var index = Array(repeating: 0, count: n+1)
    for i in 1...n {
        index[inorder[i]] = i
    }
    func getPreOrder(_ instart: Int, _ inend: Int, _ poststart: Int, _ postend: Int) {
        if instart > inend || poststart > postend { return }
        
        var rootIndex = index[postorder[postend]]
        var left = rootIndex - instart
        var right = inend - rootIndex
        print(inorder[rootIndex], terminator: " ")
        
        getPreOrder(instart, rootIndex-1, poststart, poststart + left - 1)
        getPreOrder(rootIndex + 1, inend, poststart + left, postend - 1)
    }
    
    getPreOrder(1, n, 1, n)
}
solution()

```
## 5639 이진 검색 트리
해당 문제를 트리에 넣고 후위탐색을 할 경우 시간초과가 난다.   
따라서 해당 전위탐색을 한 결과로 후위탐색을 실행할 줄 알아야 한다.   
문제의 전위탐색 순서인   
50 30 24 5 28 45 98 52 60에서   
50이 루트노드   
30부터 왼쪽   
98부터 오른쪽을 담당하고 있다.   
배열이 정렬되어 있지는 않지만 L < 루트 < R의 모습을 띄고 있는것을 알 수 있다.   
이럴 경우 이분탐색을 통해 R을 찾을 수 있다.   
오른쪽 노드를 찾은 뒤   
후위 탐색인 왼쪽 -> 오른쪽 -> 루트 이 순서로 진행한다.   
```
import Foundation
func solution(){
    var pre: [Int] = []
    while let input = readLine(), let n = Int(input) {
        pre.append(n)
    }
    //print(pre)
    func binarySearch(_ start: Int, _ end: Int, _ goal: Int) -> Int {
        var start = start, end = end
        
        while start < end {
            let mid = (start+end)/2
            if goal < pre[mid] {
                end = mid
            } else {
                start = mid + 1
            }
        }
        return start
    }
    
    func postOrder(_ start: Int, _ end: Int) {
        if start >= end { return }
        let index = binarySearch(start, end, pre[start])
        postOrder(start+1, index)
        postOrder(index, end)
        print(pre[start])
    }
    postOrder(0, pre.count)
}
solution()

```
## 4803 트리
간선의 갯수가 어쩌고, 총 2개가 있고 자시고   
사이클이 형성되는지 아닌지만 확인해주면 된다.   
단 prev, cur을 준비하여 전에 왔던 곳인지 아닌지 확인하고   
사이클이 형성되는 경우 false, 아니라면 true를 반환한다.   
만약 true라면 트리가 하나 있는것이다.    
```
import Foundation
func solution(){
    var cnt = 0
    while true {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (n,m) = (input[0],input[1])
        if n == 0 && m == 0 { break }
        cnt += 1
        
        var graph = [[Int]](repeating: [], count: n+1)
        var visited = Array(repeating: false, count: n+1)
        for _ in 0..<m {
            let value = readLine()!.split(separator: " ").map{Int(String($0))!}
            graph[value[0]].append(value[1])
            graph[value[1]].append(value[0])
        }
        
        func dfs(_ prev: Int, _ cur: Int) -> Bool {
            visited[cur] = true
            
            for next in graph[cur] {
                // 다음갈 노드가 이전과 같은경우 같은 경로로 오게되므로 무시
                if next == prev { continue }
                
                // 이미 방문한 노드일 경우 사이클이 생기므로 false
                if visited[next] { return false }
                
                // 사이클이 생길경우 false
                if !dfs(cur, next) {
                    return false
                }
                
            }
            
            return true
        }
        
        var tree = 0
        for node in 1...n {
            if !visited[node] {
                if dfs(0,node) {
                    tree += 1
                }
            }
        }
        if tree == 0 {
            print("Case \(cnt): No trees.")
        } else if tree == 1 {
            print("Case \(cnt): There is one tree.")
        } else {
            print("Case \(cnt): A forest of \(tree) trees.")
        }
    }
    
    
    
}
solution()

```
