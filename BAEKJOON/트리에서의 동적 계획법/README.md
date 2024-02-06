# 트리에 동적 계획법을 적용해 봅시다.	
## 15681 트리와 커리
서브트리의 정점의 수를 묻는 문제이다.   
루트노드와 연결된 간선을 끊었을 때 생성되는 트리를 서브트리라고 한다.   
r을 루트노드로 적용하여 dfs를 실행하여 각 노드마다 가지고있는 정점의 수를 구해준다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,r,q) = (input[0],input[1],input[2])
    var tree = [[Int]](repeating: [], count: n+1)
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ").map{Int($0)!}
        tree[edge[0]].append(edge[1])
        tree[edge[1]].append(edge[0])
    }
    //print(tree)
    var size = [Int](repeating: 0, count: n+1)
    func dfs(_ node: Int) {
        size[node] = 1
        
        for next in tree[node] {
            if size[next] == 0 {
                dfs(next)
                size[node] += size[next]
            }
        }
    }
    dfs(r)
    //print(size)
    for _ in 0..<q {
        let value = Int(readLine()!)!
        print(size[value])
    }
}
solution()

```
