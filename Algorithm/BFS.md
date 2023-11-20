# 너비 우선 탐색 (Breadth - Fisrt - Search  
말 그대로 너비 우선 탐색이다.   
       
   
<img width="490" alt="스크린샷 2023-11-20 오후 10 02 19" src="https://github.com/ww5702/Swift_Coding_Test/assets/60501045/cde00c9d-c7ec-4623-85e3-c7f965f842c7">    

   
   
방식은 DFS과 똑같다고 할 수 있다.   
1 - 2 3   
2 - 4 5 6   
3 - 7   
4 - 8 9   
5 - 2   
6 - 2   
7 - 3   
8 - 4   
9 - 4   
   
```   
Q - 1
S - 2 3
---
Q - 1 2
S - 3 4 5 6
---
Q - 1 2 3
S - 4 5 6 7

등등 이 반복되다
Q - 1 2 3 4 5 6 7 8 9가 되는 것이다.
```
코드 구현   
```

func BFS(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitQueue: [String] = [start]
    
    while !needVisitQueue.isEmpty {
        let node: String = needVisitQueue.removeFirst()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitQueue += graph[node] ?? []
    }
    
    return visitedQueue
}

```
