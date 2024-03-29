# 깊이 우선 탐색 Depth - First - Search   
말 그대로 깊이 우선 탐색이다.   
   
<img width="495" alt="스크린샷 2023-11-20 오후 9 15 35" src="https://github.com/ww5702/Swift_Coding_Test/assets/60501045/3933dddb-2f50-404a-b981-056e54c7e537">   
   
위 그림대로 탐색노드의 인접 노드의 자식 노드들을 모두 탐색하고, 다시 돌아가서 탐색노드의 다른 인접노드로 향하는 방식이다.   
보통 큐하나와 스택 하나로 구성이 된다.   
방문한 VisitedQueue as Q(FIFO)   
방문해야 할 needVisitStack as S(LIFO)이다.   
위 사진을 그래프로 표기하면 이와 같다.   
1 - 2 8   
2 - 3 6 7   
8 - 9   
3 - 4 5   
6 - 2   
7 - 2   
9 - 8   
4 - 3   
5 - 4   
   
스택의 마지막 값을 추출해서 visiedQueu에 해당 값이 있는지 확인한다.   
만약 이미 방문했던 노드라면 추출값을 버리고 Stack에서 다음값을 뽑는다.   
위 과정을 visiedQueue에 없는 값이 나올때 까지 반복하는데   
이러다 stack이 비게 된다면 탐색이 끝나게 된다.   

   
이제 1부터 탐색을 시작한다고 하자   
Q   
S - 1   
방문했던 노드가 아니기에 visitedQueue에 넣는다.   
그리고 연결된 간선들을 stack에 넣는다.   
Q - 1   
S - 2 8   
다시 위의 과정을 반복   
8을 추출하던 2를 추출하던 사실 상관없다.   
어떤 인접 노드부터 탐색할지는 순서가 없기 때문이다.   
Q - 1 8   
S - 2 9   
8을 뽑고 방문한 사실이 없기에 8을 Q을 넣고 8의 자식노드를 stack에 넣는다.   
Q - 1 8 9   
S - 2 8   
9를 뽑고 방문한 사실이 없기에 9를 Q에 넣고 9의 선택노드인 8을 넣는다.   
Q - 1 8 9   
S - 2 1   
Q - 1 8 9   
S - 2   
선택노드인 8과 8의 부모노드인 1은 전부 방문했던 노드이기에 pass   
Q - 1 8 9 2   
S - 3 6 7   
2를 뽑고 방문한 사실이 없기에 2를 Q에 넣고 2의 자식노드인 3 6 7을 stack에 넣는다.   
Q - 1 8 9 2 7   
S - 3 6 2   
Q - 1 8 9 2 7   
S - 3 6   
Q - 1 8 9 2 7 6   
S - 3   
7은 자식노드가 없었기에 바로 Q에 넣고, 6또한 자식노드가 없어 pass   
Q - 1 8 9 2 7 6 3   
S - 4 5   
3을 뽑고 방문한 사실이 없기에 3을 Q에 넣고 3의 자식노드인 4 5 를 stack에 넣는다.   
최종 : Q - 1 8 9 2 7 6 3 5 4

코드 구현   
```
func dfs(_ graph: [String:[String]], _ start: String) -> [String] {
   var visited: [String] = []
   var needVisited: [String] = [start]
   // stack이 빌때까지
   while !needVisited.isEmpty {
      // 마지막 값을 제거하고, 방문한 노드가 아니라면 추가  
      let node = needVisited.removeLast()
      if visited.contains(node) { continue }
   
      visited.append(node)
      needVisited += graph[node] ?? []
      
   }
   return visited
}
```
노드 수(V), 간선 수(E)    
시간 복잡도는 O(V+E) 이다.   
