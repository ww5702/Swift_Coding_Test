첫 제출   
dfs문제이다.    
먼저 Dictionary 배열을 통해 그래프를 만들어준다.   
그 후 전력망을 차례대로 끊어내면서 완전탐색으로 끊어졌을때 순환을 돌리며 개수를 구한다.   
모든 그래프를 탐색한 뒤 최소값을 return해준다.   
```
import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var route: [Int : [Int]] = [:]
    
    // 그래프 만들기
    for wire in wires {
        // 첫 추가가 아니라면 append로 연결
        if route[wire[0]] != nil {
            route[wire[0]]!.append(wire[1])
        } else {
            route[wire[0]] = [wire[1]]
        }
        
        if route[wire[1]] != nil {
            route[wire[1]]!.append(wire[0])
        } else {
            route[wire[1]] = [wire[0]]
        }
    }
    //print(route)
    var result = wires.count
    for i in route {
        for j in i.value {
            // 전력망 끊기
            route[i.key] = route[i.key]!.filter({ $0 != j })
            route[j] = route[j]!.filter({ $0 != i.key })
            
            //print(route)
            
            // 끊어진 노드들로부터 출발하여 각 송전탑 개수 계산
            let distance = abs(dfs(route, i.key).count - dfs(route, j).count)
            
            // 최저라면 result에 반영
            result = distance < result ? distance : result
            
            // 다시 전력망 연결
            route[i.key]?.append(j)
            route[j]?.append(i.key)
        }
    }
    return result
}

func dfs(_ arr: [Int: [Int]], _ n: Int) -> [Int] {
        var visitedQueue: [Int] = []
        var needVisitStack: [Int] = [n]
        
        while !needVisitStack.isEmpty {
            let node: Int = needVisitStack.removeLast()
            if visitedQueue.contains(node) { continue }
            
            visitedQueue.append(node)
            needVisitStack += arr[node] ?? []
        }
    return visitedQueue
}
```
