문제를 보고 트리를 떠올려야 한다.   
해당 그래프를 트리 형식으로 만든 뒤   
어디서 시작하던 리프노드를 찾아 내려간다.   
하위 노드가 리프노드라면 1, 아니라면 0이다.   
그리고 cnt가 1이상이라면 해당 등대는 켜줘야하는 등대인것이다.   

  
예제 2번을 예시로 들었을때      
해당 그래프는   
```
        1
    2  4  3  5
  9            6
10            7  8
```
위와 같이 연결되있는 트리가 된다.   
그렇다면 1에서 시작해서 2->9->10까지 가고 9로 돌아와 9를 키고,   
5 -> 6 -> 7,8 까지 간 다음 5를 키고   
1을 켜주는 구조이다.   

```
import Foundation

func solution(_ n:Int, _ lighthouse:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: [], count: n+1)
    var result = 0
    for i in 0..<n-1 {
        let now = lighthouse[i]
        graph[now[0]].append(now[1])
        graph[now[1]].append(now[0])
    }
    //print(graph)
    
    func dfs(_ cur: Int, _ before: Int) -> Int{
        // 리프 노드이다
        //print("시작", cur, before)
        if graph[cur].count == 1 && graph[cur][0] == before {
            //print("리프노드이다", cur)
            return 1
        }
        
        var cnt = 0
        for i in 0..<graph[cur].count {
            let next = graph[cur][i]
            if next == before { continue }
            cnt += dfs(next, cur)
        }
        //print("하위노드의 개수", cnt, cur, before)
        
        if cnt == 0 { return 1 }
        
        result += 1
        return 0
    }
    
    dfs(1, 0)
    return result
}
// 7 4 1 2 5
//     3
//     6
```
