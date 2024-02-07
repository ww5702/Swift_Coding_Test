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
## 2213 트리의 독립집합
그래프에서 정점의 부분 집합에 속한 모든 정점이 서로 연결되어있지 않으면   
해당 부분 집합을 독립집합이라고 한다.   
즉, 부모노드를 선택했다면 자식노드를 선택할 수 없고, 반대로 부모노드를 선택하지 않았다면, 자식노드를 선택 할 수 있다.   
따라서 dp테이블을 2차원으로 만들고, 해당 노드를 선택한 경우 누적된 독립집합의 크기와 선택하지 않은 경우 모두를 저장한다.    
1번 노드를 루트노드로 가정하고 1번노드를 선택한 경우와 안고른 경우로 나눠 최종적으로 비교해주면 된다.    
next를 2번이라고 가정했을 때
cache[2][0] = 2번 노드를 선택안했을 때 최대 값     
cache[2][1] = 2번 노드를 선택했을 때 최대 값   
이 된다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var value = [0] + readLine()!.split(separator: " ").map{Int($0)!}
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ").map{Int($0)!}
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
    var cache = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n+1)
    var route = [[[Int]]](repeating: [[Int]](repeating: [], count: 2), count: n+1)
    var visited = [Bool](repeating: false, count: n+1)
    
//    print(cache)
//    
//    print(route)
    
    func dfs(_ node: Int) {
        visited[node] = true
        
        cache[node][1] = value[node]
        route[node][1].append(node)
        
        for next in graph[node] {
            if !visited[next] {
                dfs(next)
                
                if cache[next][0] > cache[next][1] {
                    cache[node][0] += cache[next][0]
                    route[node][0].append(contentsOf: route[next][0])
                } else {
                    cache[node][0] += cache[next][1]
                    route[node][0].append(contentsOf: route[next][1])
                }
                
                cache[node][1] += cache[next][0]
                route[node][1].append(contentsOf: route[next][0])
            }
        }
        
    }
    
    dfs(1)
//    print(cache)
//    print(route)
    if cache[1][0] > cache[1][1] {
        print(cache[1][0])
        print(route[1][0].sorted(by: <).map{String($0)}.joined(separator: " "))
    } else {
        print(cache[1][1])
        print(route[1][1].sorted(by: <).map{String($0)}.joined(separator: " "))
    }
}
solution()
```
## 2533 사회망 서비스(SNS)
해당 정점과 연결되어있는 위,아래 (부모,자식) 노드들은 연결된다는 논리로 접근한다.   
2차원 배열로 만들어 해당 노드를 선택했을때, 안했을떄로 나누어 풀이한다.   
단 dp값을 지정할때 주의할 점이 있다면   
부모 노드가 얼리어답터였다고 자식노드가 아닌 경우로 계산할 경우   
부모노드   
A   
a b c    
와 같이 연결되어 있다고 할때   
부모노드 + A 이렇게 두개만 얼리어답터인 경우가 부모노드 + a,b,c 인 경우보다 더 적기 때문에   
점화식의 경우 min(cache[next][0], cache[next[1])로 계산해야 한다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ").map{Int($0)!}
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
    //print(graph)
    var cache = [[Int]](repeating: Array(repeating: 0, count: 2), count: n+1)
    var visited = [Bool](repeating: false, count: n+1)
    
    func dfs(_ node: Int) {
        visited[node] = true
        cache[node][0] = 0
        cache[node][1] = 1
        
        for next in graph[node] {
            if !visited[next] {
                dfs(next)
                cache[node][0] += cache[next][1]
                cache[node][1] += min(cache[next][0], cache[next][1])
            }
        }
    }
    
    dfs(1)
    //print(cache)
    print(min(cache[1][0], cache[1][1]))
    
}
solution()

```
