특정 지점까지 가장 빠르게 도달하는 방법을 찾는 알고리즘   
# 가장 빠른 길 찾기
'최단 경로' 알고리즘은 말 그대로 가장 짧은 경로를 찾는 알고리즘이다.   
그래서 '길 찾기' 문제라고도 불린다.   
   
상황에 따라 효율적인 알고리즘이 다른데,   
'한 지점에서 다른 특정 지점까지의 최단 경로를 구해야 하는 경우'   
'모든 지점에서 다른 모든 지점까지의 최단 경로를 모두 구해야 하는 경우'   
와 같이 다양한 사례가 존재한다.   
최단 경로 문제의 경우 보통 그래프를 통해 표현하는데 각 지점은 그래프에서 '노드'로 표현되고, 지점간 연결된 도로는 '간선'으로 표현된다.   
코테에서는 최단 경로를 모두 출력하는 문제보다는 단순히 최단 거리를 출력하도록 요구하는 문제가 많이 출제된다.   
   
최단 거리 알고리즘은 '다익스트라 최단 경로 알고리즘' / '플로이드 워셜' / '벨만 포드 알고리즘' 이렇게 3개 이다.   
그 중 많이 등장하는 다익스트라, 플로이드 워셜 알고리즘 유형만 다룬다.   
이 두개만 이용해도 최단 경로 문제는 어렵지 않게 해결이 가능하다.   
앞서 배운 그리디 알고리즘과 다이나믹 프로그래밍 알고리즘이 최단 경로 알고리즘에 사용된다는 특징이 있다.   
   
## 다익스트라 최단 경로 알고리즘
그래프에서 여러 개의 노드가 있을 때, 특정한 노드에서 출발하여 다른 노드로 가는 각각의 최단 경로를 구해주는 알고리즘이다.   
다익스트라 최단 경로 알고리즘은 '음의 간선'이 없을 떄 정상적으로 작동하는데 0보다 작은 값을 가지는 간선이 없어야 한다는 의미이다.   
기본적으로 다익스트라 알고리즘은 그리디 알고리즘으로 구분된다.   
매번 가장 비용이 적은 노드를 선택하는 과정을 반복하기 때문이다.   
과정은 다음과 같다.   
1. 출발 노드 설정   
2. 최단 거리 테이블을 초기화한다.   
3. 방문하지 않은 노드 중 최단 거리가 짧은 노드를 선택한다.   
4. 해당 노드를 거쳐 다른 노드로 가는 비용을 계산하여 최단 거리 테이블을 갱신한다.   
5. 3,4 과정을 반복한다.   
각 노드에 대한 현재까지의 최단 거리 정보를 항상 1차원 리스트에 저장하며 리스트를 계속 갱신한다는 특징이 있다.   
나중에 현재 처리하고 있는 노드와 인접한 노드로 도달하는 더 짧은 경로를 찾으면 '더 짧은 경로가 있으므로 이 경로가 최단 경로야' 라고 판단하는 것이다.   
   
또한 구현하는 방법은 2가지 이다.   
   
1번. 구현하기 쉽지만 느리게 동작하는 코드   
2번. 구현하기 조금 더 까다롭지만 빠르게 동작하는 코드   
당연히 2번을 구현할 수 있을 떄 까지 연습해야 한다.   
   
<img width="430" alt="스크린샷 2023-05-25 오후 5 29 17" src="https://github.com/ww5702/Coding_Test/assets/60501045/b759a30a-9bc3-4a31-9f44-5570aa25f13a">   
   
다음과 같은 그래프가 있을 때 1번 노드가 다른 모든 노드로의 최단 거리를 계산해볼 것이다.   
우선 초기 상태에는 다른 노드로 가는 최단 거리를 '무한'으로 설정한다.   
헷갈리지 않기 위해 '987,654,321'으로도 가능하다.   
```
1 2 3 4 5 6   
0 무 무 무 무   
-----------   
이제 1번노드를 거쳐 다른 노드로 가는 비용을 계산한다.   
모든 간선을 하나씩 확인하면 된다.   
1 2 3 4 5 6   
0 2 5 1 - -   
-----------   
이후에는 가장 거리가 짧은 노드인 '4'를 선택해 다른 노드로 움직이는 경우를 계산한다.   
1 2 3 4 5 6
0 2 4 1 2 -   
4를 통과해 3으로 이동하는 거리가 4이고 1에서 바로 3으로 이동하는 거리가 5이다.   
더 적은 경로로 이동할 수 있기에 4로 갱신한다.   
또한 4를 통해 5로도 이동할 수 있기에 5도 2로 갱신한다.   
-----------   
이제는 2와 5중에 2를 선택하여 진행한다.   
1에서 2를 통과해 이동하는 경우를 계산하는 것이다.   
보통 거리가 같다면 더 작은 번호를 고른다.   
1 2 3 4 5 6   
0 2 4 1 2 -   
하지만 2를 통과해 이동했을때 경로가 더 단축되는 경우는 없기에   
그래프에 변동사항은 없다.   
-----------   
이제 5가 선택된다.   
1에서 4를 거쳐 5에서 시작되는 과정이다.   
1 2 3 4 5 6   
0 2 3 1 2 4   
3과 6의 경로가 갱신된다.   
-----------   
남은 경로 3, 6중 더 적은 3을 선택한다.   
1 4 5 3의 경로로 움직이는 과정이다.   
1 2 3 4 5 6   
0 2 3 1 2 4   
변동사항은 없다.   
-----------   
```
마지막 남은 6을 선택하여도 결과는 동일하다.   
따라서 1번노드로부터 출발했을때 각 노드별로 최단 경로로 도착하는 값은   
0 2 3 1 2 4 가 된다.   
   
이제 알고리즘을 실제 구현해보자.   
먼저 말했던 쉽게 구현하는 방법이다.   
O(V^2)의 시간복잡도를 가지는데 여기서 V는 노드의 개수를 말한다.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    let start = Int(readLine()!)!
    let INF = 987654321
    var graph = Array(repeating: [(Int,Int)](), count: n+1)
    var distance = Array(repeating: INF, count: n+1)
    var visited = Array(repeating: false, count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (a,b,c) = (input[0],input[1],input[2])
        graph[a].append((b,c))
    }
    print(graph)
    
    // 현재 distance에서 방문했던 적이 없었으면서 최단 거리인 노드는?
    func getSmallNode() -> Int {
        var min = INF
        var index = 0
        for i in 1..<n+1 {
            if distance[i] < min && !visited[i] {
                min = distance[i]
                index = i
            }
        }
        return index
    }
    
    func dijkstra(_ start: Int) {
        distance[start] = 0
        visited[start] = true
        
        for i in graph[start] {
            distance[i.0] = i.1
            // i가 1일때 2,3,4까지의 거리는 2,5,1로 입력한다는 뜻
        }
        print(distance)
        // 시작 노드를 제외한 전체 노드에 대해 최단 거리 계산
        for _ in 0..<n-1 {
            let now = getSmallNode()
            visited[now] = true
            print("현재 서있는 노드 = \(now)")
            for j in graph[now] {
                // 현재 서있는 노드까지의 거리 + 해당 노드에서 갈수있는 노드까지의 거리의 합
                // 그 거리의 합과 기존에 적혀있는 합과 비교했을때 더 작다면 더 빠르게 갈 수 있다는 뜻
                let cost = distance[now] + j.1
                if cost < distance[j.0] {
                    distance[j.0] = cost
                }
            }
        }
    }
    dijkstra(start)
    for i in 1..<n+1 {
        if i == INF {
            print("INFINITY")
        } else {
            print(distance[i])
        }
    }
}
solution()

```
복잡해 보이지만 주석과 함께 살펴본다면 그리 어렵지 않다는 것을 알 수 있다.   
앞서 말했듯이 복잡도는 O(V^2)이다. 노드의 갯수에 따라 매번 O(V)번씩 선형탐색해야하고,   
현재 노드와 연결된 노드를 매번 일일이 확인하기 떄문이다.   
따라서 5,000개 이하의 노드개수라면 이 코드로도 풀 수 있다.   
하지만 10,000개가 넘는 노드개수라면 '개선된 다익스트라 알고리즘'을 이용해야 한다.   
   
그렇다면 2번째 방법인 개선된 다익스트라 알고리즘을 구현해보자.   
개선된 알고리즘은 최악의 경우에도 시간복잡도 O(ElogV)를 보장하여 해결할 수 있다.   
V는 노드이 개수이고 E는 간선의 개수를 의미한다.   
개선된 알고리즘의 시간단축개념은 단순하다.   
위에서 풀이한 방법은 선형탐색으로 최단 거리가 짧은 노드를 찾았지만 최단 거리를 더욱 빠르게 찾는 형식으로 시간을 줄이는 것이다.   
여기서 힙(Heap) 자료구조를 사용한다.   
힙 자료구조는 특정 노드까지의 최단 거리에 대한 정보를 힙에 담아서 처리하므로   
출발 노드로부터 가장 거리가 짧은 노드를 더욱 빠르게 찾을 수 있다.   
이 과정에서 선형 시간이 아닌 로그 시간이 걸린다.   
따라서 먼저 힙에 대해 알아보자.   
   
### 힙
힙 자료구조는 우선순위 큐를 구현하기 위하여 사용하는 자료구조 중 하나이다.   
우선순위 큐는 '우선순위가 가장 높은 데이터를 가장 먼저 삭제한다는 점' 이 특징이다.   
따라서 여러 물건 데이터를 자료구조에 넣었다가 가치가 높은 물건 데이터붵 꺼내서 확인해야 하는 경우 효과적이다.   
대부분의 프로그래밍 언어에서는 우선순위 큐 라이브러리를 지원하기 때문에 우선순위 큐를 구현할 필요는 없다.   
(물론 안타깝게도 스택과 큐처럼 swift는 라이브러리가 지원되지 않으므로 직접 구현해야 한다ㅎㅎ)   
```
struct MinHeal<T:Comparable> {
    var heap: [T] = []
    var isEmpty: Bool {
        return heap.count <= 1 ? true : false
    }
    init() {}
    init(_ element: T) {
        heap.append(element)    // 0번 index 채우기 용
        heap.append(element)    // 실제 RootNode 채움
    }
    mutating func insert(_ element: T) {
        if heap.isEmpty {
            heap.append(element)
            heap.append(element)
            return
        }
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {   // RootNode 일때,
                return false
            }
            let parentIndex = insertIndex / 2
            return heap[insertIndex] < heap[parentIndex] ? true : false
        }
        var insertIndex = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus { case left, right, none }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = poppedIndex * 2
            let rightChildIndex = leftChildIndex + 1
            // case1 모든(왼족) 자식 노드가 없는 경우(완전이진트리는 왼쪽부터 채워지므로)
            if leftChildIndex >= heap.count {
                return .none
            }
            // case2 왼쪽 자식 노드만 있는 경우
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] < heap[poppedIndex] ? .left:.none
            }
            
            // case3. 왼쪽&오른쪽 자식 노드 모두 있는 경우
            // case3-1. 자식들이 자신보다 모두 큰 경우(자신이 제일 작은 경우)
            if (heap[leftChildIndex] > heap[poppedIndex]) && (heap[rightChildIndex] > heap[poppedIndex]) {
                return .none
            }
            
            // case3-2. 자식들이 자신보다 모두 작은 경우(왼쪽과 오른쪽 자식 중, 더 작은 자식을 선별)
            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightChildIndex] < heap[poppedIndex]) {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
            }
            
            // case3-3. 왼쪽과 오른쪽 자식 중, 한 자식만 자신보다 작은 경우
            if (heap[leftChildIndex] < heap[poppedIndex]) || (heap[rightChildIndex] < heap[poppedIndex]) {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
            }
            
            return .none
        }
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
            }
        }
    }
 }
```
위와 같은 구조로 힙을 구현해 둘 수 있다.   
최소 힙을 이용하면 가장 값이 작은 원소가 추출이 되며, 최대 힙을 이용하면 가장 값이 큰 원소가 추출이 된다.   
다시 한번 위의 그래프를 우선순위 큐를 이용해 풀이해보자.   
   
<img width="430" alt="스크린샷 2023-05-25 오후 5 29 17" src="https://github.com/ww5702/Coding_Test/assets/60501045/b759a30a-9bc3-4a31-9f44-5570aa25f13a">   
   
```
역시 1번노드가 출발 노드인 경우다.   
1 2 3 4 5 6
0 - - - - -
우선순위 큐 / (거리:0 노드:1)
우선순위 큐에 1번 노드를 넣는다. 
이때 1번 노드로 가는 거리는 자기 자신까지 도달하는 거리이기에 0이다.   
튜플을 입력받으면 튜플의 첫 번쨰 원소를 기준으로 우선순위 큐를 구성한다.
따라서 거리 순으로 자동 정렬된다.
----------- 
우선순위 큐를 이용하기에 가장 짧은 원소가 최상위 원소로 위치해있다.   
따라서 우선순위 큐에서 노드를 꺼낸뒤 방문한 적이 있다면 무시하고, 방문한적이 없다면 사용하면 된다.
우선순위 큐에서 원소를 꺼낸다면 (0,1)이 나온다.
1 2 3 4 5 6
0 2 5 1 - -
우선순위 큐 / (거리:1 노드:4)(거리:2 노드:2)(거리:5 노드:3)
-> 자동으로 거리 순으로 정렬된다.
----------- 
이어서 우선순위 큐에서 동일한 과정을 반복한다.
거리가 가장 짧은 (1,4)가 추출된다.
1 2 3 4 5 6
0 2 4 1 2 -
우선순위 큐 / (거리:2 노드:2)(거리:2 노드:5)(거리:4 노드:3)(거리:5 노드:3)
----------- 
(2,2)가 뽑히지만 2를 거쳐서 가는 경우 최단 거리가 갱신되지 않는다.
1 2 3 4 5 6
0 2 4 1 2 -
우선순위 큐 / (거리:2 노드:5)(거리:4 노드:3)(거리:5 노드:3)
----------- 
(2,5)가 뽑혀 5를 거쳐 가는 경우를 계산한다.
1 2 3 4 5 6
0 2 3 1 2 4
우선순위 큐 / (거리:3 노드:3)(거리:4 노드:3)(거리:4 노드:6)(거리:5 노드:3)
----------- 
(3,3)을 꺼내 3번 노드를 기준으로 수행하지만 최단 거리는 갱신되지 않는다.
(4,3)을 꺼내 3번 노드를 기준으로 수행해보지만 이미 전에 거리 3으로 3노드를 수행했던 기록이 있기에 무시한다.
(4,6)을 꺼내 6번 노드를 기준으로 수행하더라도 변경되는 점은 없다.
마지막으로 남은 (5,3)을 꺼내보지만 아까 이미 3이라는 거리로 3노드를 수행했었기에 무시한다.   
```
위의 풀이를 코드로 바꿔보자.   
