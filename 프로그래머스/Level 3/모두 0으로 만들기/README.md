모두 0으로 만드는 문제이다 쉽게 생각해서 트리 문제인데   
노드를 최대한 바닥 즉 자식노드로 보낸다   
자식노드가 부모노드로 바뀌고 또 해당 자식노드의 자식노드로 향하다가   
자식노드가 더 내려갈 곳이 없다면 해당 자식노드의 부모노드에 본인의 cost를 더해주고 빠져나간다.   
음수인 가중치도 있기 때문에 abs를 이용해 횟수를 저장하는 answer를 따로 구현한다   
0이 안되는 경우는 처음 a 가중치가 주어졌을때 합이 0이 안되면 절대 불가능하다.   

```
import Foundation
/*
가중치 0으로 최대한 만들기
+ - 합이 0이 아니라면 총 0을 만들 수 없다.
최저값을 찾게되므로 dfs 합치자
*/
func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
    func dfs(_ cur: Int, _ parent: Int) {
        // 초기값 0번인덱스가 탐색 시작
        // 1 3이 연결되어있으므로 
        // dfs(1,0)이 또 시작
        // 하지만 graph[1]은 0밖에 없고 해당값은 더 내려갈 곳이 없다는뜻
        // 그때 answer에 횟수를 구해주는(abs(a[child]))값을 더해주고
        // a[parent] += a[child]값을 더해준다.
        for child in graph[cur] {
            if child != parent {
                // 해당값을 부모노드로 자식노드를 대상이 있나 확인
                dfs(child,cur)
            }
        }
        // 만약 child와 parent가 같다면 더 이상 자식노드가 없다는뜻
        //print("바닥 도착",cur,parent)
        answer += abs(cost[cur])
        cost[parent] += cost[cur]
        cost[cur] = 0
        // print(cost)
        
    }
    var answer = 0
    var cost = a
    var graph = Array(repeating: [Int](), count: a.count)
    for i in 0..<edges.count {
        graph[edges[i][0]].append(contentsOf: [edges[i][1]])
        graph[edges[i][1]].append(contentsOf: [edges[i][0]])
    }
    // 만약 합이 0이 아니라면 불가
    if a.reduce(0,+) != 0 { return -1 }
    dfs(0,0)
    return answer
}
```
