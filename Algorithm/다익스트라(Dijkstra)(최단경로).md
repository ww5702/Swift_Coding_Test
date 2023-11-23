# 다익스트라(Dijkstra)구현 해보기
두 노드를 잇는 가장 짧은 경로 즉 최단경로를 찾아야 할 떄 주로 사용한다.   
또한 가중치가 존재하는 그래프에서 주로 사용한다.   

첫 노드를 기준으로 연결되어 있는 노드들을 추가하며 최단 거리를 갱신하는 알고리즘이다.   
A에서 출발하여 B까지 가는 최단 거리를 찾는다   
라는 의미로 해석하면 이해하기 쉽다.   
<img width="504" alt="스크린샷 2023-11-17 오후 4 01 35" src="https://github.com/ww5702/Swift_Coding_Test/assets/60501045/e06a38b2-46f9-4931-989e-3e9af24dd993">   
   
각 상황에서 본인을 제외한 최단노드를 뽑아야 하기 때문에 우선 순위 큐가 필요하다.   

## 초기화
노드의 갯수만큼 배열을 생성, 출발노드의 값은 0, 나머지 값들은 INF(무한)으로 초기화한다.   
우선순위 큐를 생성하고, 첫 노드의 가중치를 0으로 한다.   

## 값 추출, 인접한 노드 거리 계산
우선 순위 큐에서 값을 추출하고 인접한 노드들과 거리를 계산한다.   
위 그림을 예로 든다면   
A -> B : 9 + 0(A)
A -> C : 1 + 0(A)   
A -> D : 15 + 0(A)   
해당 값들이 INF로 저장된 값들보다 작기 때문에 update   
그리고 방문한 노드들을 우선순위 큐에 저장한다.   
   
해당 단계 후 변화된 배열   
A B C D  E   F   
0 9 1 15 INF INF   
우선순위 큐   
C B D   

## 윗 단계를 우선순위 큐가 빌때까지 반복
그리고 저장된 인접노드들중 가장 작은 수를 먼저 뽑아 인접한 노드들을 방문하는 윗 단계를 반복해준다.   
   
   
C -> B : 5 + 1(C)      
C -> E : 3 + 1(C)   
변화된 배열   
A B C D  E F   
0 6 1 15 4 INF   
우선순위 큐   
E B(6) B(9) D   
   
   
E -> F : 7 + 4(E)   
변화된 배열   
A B C D  E F   
0 6 1 15 4 11   
우선순위 큐   
B(6) B(9) F D   
   
   
B -> E : 10 + 6(E)   
변화된 배열(없다)   
A B C D  E F   
0 6 1 15 4 11   
변화된 배열이 없으면 우선순위 큐도 추가되지 않는다.   
우선순위 큐   
B(9) F D   
   
   
B(9)또한 변화 없다.   
다음 F로   
   

F는 인접노드가 없으므로 또 패스   
   
  
D -> E : 10 + 4(D)   
변화된 배열(없다)
A B C D  E F   
0 6 1 15 4 11   
   

최종 결과   
A B C D  E F   
0 6 1 15 4 11   

## 코드 구현
이제 위의 원리를 코드로 구현한다면 끝이다.   
각 노드가 연결된 가중치를 그래프화   

```
let graph: [String: [String: Int]] = [
    "A" : ["B": 9, "C" : 1, "D" : 15],
    "B" : ["E": 10],
    "C" : ["B": 5, "E" : 3],
    "D" : ["E": 10],
    "E" : ["F": 7],
    "F" : [:]
]
 
```


우선 순위 큐를 위한 최대 힙 추가   
```
struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        lhs.priority > rhs.priority
    }
    var node: String = ""
    var priority: Int = 0
}
```
   

다익스트라 구현하기
```

func dijkstra(graph: [String: [String: Int]], start: String) ->  [String: Int] {
    var distances: [String: Int] = [:]
    var priorityQueue = MaxHeap(NodePriority.init(node: start, priority: 0))
    
    for key in graph.keys {
        let value = key == start ? 0 : Int.max!
        distances.updateValue(value, forKey: key)
    }
    
    while !priorityQueue.isEmpty() {
        guard let popped = priorityQueue.pop() else { break }
        
        if distances[popped.node]! < popped.priority {
            continue
        }
        
        for (node, priority) in graph[popped.node]! {
            let distance = priority + popped.priority
            if distance < distances[node]! {
                distances[node] = distance
                priorityQueue.insert(NodePriority.init(node: node, priority: distance))
            }
        }
    }
    return distances
}

```
