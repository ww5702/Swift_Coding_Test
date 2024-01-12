# 벨만포드 알고리즘 
벨만포드 알고리즘은 다익스트라 알고리즘의 단점을 해결한 알고리즘이다.   
다익스트라 알고리즘은 간선들의 거리가 음수라면 최소거리를 찾을 때도 있고 못찾을 때도 있다.   
또한 벨만 포드 알고리즘은 Greedy 해결법이 아닌 dp를 사용한다.   
물론 플로이드 워셜 알고리즘을 통해 음수의 거리들을 속에서 최단거리를 찾을 수도 있다.   
하지만 플로이드 워셜 알고리즘은 O(n^3)이기에 노드의 크기가 500 이상이라면 시간초과가 나게된다.   

## 해결법
최단거리를 dist[]배열에 저장할 때, 항상 dist[cur] + cost[next] < dist[next]이라면   
최단거리는 dist[cur]이다.   
dist[v] <= dist[cur] + w(current,v)이라는 것이다.   
시작점 s-v까지 가는 최단거리는 s-next까지 가는 최단거리에 current-v까지의 가중치를 더한 값보다 클 수 없다.   
   
<img width="224" alt="스크린샷 2024-01-12 오후 5 36 48" src="https://github.com/ww5702/Swift_Coding_Test/assets/60501045/6518067b-bd40-4e12-9133-349a68fa8646">
   
    
위의 그림을 예시로 알아보자.        
우리는 V-1번 반복하게 된다.   
즉, 3번의 간선정보를 통해 최단거리를 찾을 수 있다.   
1에서부터 시작한다고 가정하고 시작값에는 최단거리 0, 그외의 값들에는 INF를 넣는다.   
***
초기값   
1 2 3 4   
0 I I I   
***
1번 실행   
1 2 3 4   
0 4 I 5   
***
2번 실행   
1 2 3 4   
0 4 8 5   
***
3번 실행   
1 2 3 4   
0 -2 8 5   
***
가 된다.   
   
코드로 구현한다면 이와 같다.   
```
import Foundation
func solution(){
    let INF = Int.max
    let vertexN = 4
    
    var graph = [Int: [(Int,Int)]]()
    for _ in 0..<vertexN {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph.updateValue([(input[1],input[2])], forKey: input[0])
        
    }
    print(graph)
    
    var edgeList = [(Int,Int,Int)]()
    var dist = Array(repeating: INF, count: vertexN+1)
    
    for item in graph {
        for value in item.value {
            edgeList.append((item.key,value.0,value.1))
        }
    }
    func bellmanFord(_ start: Int) -> Bool {
        dist[start] = 0
        
        //n번 실시
        for i in 0..<vertexN {
            for j in 0..<edgeList.count {
                let cur = edgeList[j].0
                let next = edgeList[j].1
                let weight = edgeList[j].2
                if dist[cur] != INF && dist[next] > dist[cur]+weight {
                    dist[next] = dist[cur]+weight
                    if i == vertexN-1 {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    bellmanFord(1)
    print(dist)
}
solution()


```
