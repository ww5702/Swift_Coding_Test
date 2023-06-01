# 다양한 그래프 알고리즘
이번에는 지금까지 다루지 않았던 그래프 알고리즘을 추가로 다룰 것이다.   
출제 비중은 낮지만 제대로 알고는 있어야 하는 알고리즘이다.   
예를 들어 크루스칼 알고리즘(그리디), 위상 정렬 알고리즘(큐,스택)등이 있다.   
그래프 자료구조는 그래프 혹은 트리로 풀이방법을 나눠 해결할 수 있는데   
어떤 문제를 만나든 메모리와 시간을 염두에 두고 알고리즘을 선택해 구현해야 한다는 것이다.   
예를 들어 최단 경로를 찾아야 하는 문제가 출제되었을 때, 노드의 개수가 적다면   
플로이드 워셜 알고리즘 즉 2차원 배열을 이용한 인접행렬을 이용해 풀이가 가능하지만   
노드와 간선의 개수가 모두 많으면 우선순위 큐를 이용하는 다익스트라 알고리즘을 이용하면 유용하다.   
   
## 서로소 집합 자료구조
서로소 집합이란 공통 원소가 없는 두 집합을 의미한다.   
{1,2} {3,4}는 서로 공통원소가 없으므로 서로소 관계이지만   
{1,2} {2,3}은 2라는 공통원소가 있으므로 서로소 관계가 아니라는 뜻이다.   
서로소 집합 자료구조를 구현할 때는 트리 자료구조를 이용해 집합을 표현하는데,   
합집합 연산(서로소 집합정보)가 주어졌을때 트리 자료구조를 이용해 집합을 표현하는 서로소 집합 계산 알고리즘은 다음과 같다.   
1. 합집합(union)연산을 확인하여 서로 연결된 두 노드 A,B를 확인한다.   
- A와 B의 루트노드 'A','B'를 각각 찾는다.
- A를 B의 부모 노드로 설정한다 (B를 A가 가리키도록 한다)
2. 모든 합집합(union) 연산을 처리할 때 까지 1번 과정을 반복한다.   
A가 1이고 B가 3이라면 B가 A를 가리키도록 설정한다.   
위의 말은 A가 B의 부모노드가 된다는 의미이다.   
예를 들어보자 {1,4} {2,3} {2,4} {5,6}의 합집합이 있다.   
먼저 1이 부모노드 4가 자식노드가 된다.   
2가 부모노드 3이 자식노드가 된다.   
{2,4}를 알아볼때 각 노드의 부모노드를 확인한다.   
각각의 부모노드는 2,1이므로 더 큰 번호에 해당하는 루트2의 부모노드를 1으로 설정한다.   
노드 번호 1 2 3 4 5 6   
부모 번호 1 1 2 1 - -   
{5,6}을 진행한다면   
노드 번호 1 2 3 4 5 6   
부모 번호 1 1 2 1 5 5   
최종적인 부모 번호가 위와 같이 설정된다.   
노드 3의 노드를 찾기 위해서는 먼저 부모 노드인 2로 이동한 다음 노드 2의 부모를 또 확인해 최종적으로 1으로 접근해야 한다.   
다시 말해 서로소 집합 알고리즘으로 루트 노드를 찾기 위해서는 재귀적으로 부모를 거슬러 올라간다는 뜻이다.   
코드로 구현해보자.   
```
import Foundation

func solution() {
    func find_parent(_ parent: [Int], _ x: Int) -> Int{
        if parent[x] != x {
            return find_parent(parent, parent[x])
        }
        return x
    }
    func union_parent(_ a: Int, _ b: Int) {
        let a = find_parent(parent, a)
        let b = find_parent(parent, b)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    let ve = readLine()!.split(separator: " ").map{Int($0)!}
    let (v,e) = (ve[0],ve[1])
    var parent = Array(repeating: 0, count: v+1)
    // 초기 자기자신은 i를 가르킨다
    for i in 1..<parent.count {
        parent[i] = i
    }
    //union 연산 수행
    for _ in 0..<e {
        let ab = readLine()!.split(separator: " ").map{Int($0)!}
        let (a,b) = (ab[0],ab[1])
        union_parent(a, b)
    }
    
    print("각 원소가 속한 집합 : ",terminator: " ")
    for i in 1..<v+1 {
        print(find_parent(parent, i), terminator: " ")
    }
    print()
    // 부모 테이블 출력
    print("부모 테이블 : ",terminator: " ")
    for i in 1..<v+1 {
        print(parent[i],terminator: " ")
    }
    
}
solution()
```
위와 같이 쉽게 구현이 되지만 find함수가 비효율적으로 동작한다.   
재귀적이기 때문에 운이 없다면 O(V)의 시간복잡도를 가지게 된다.   
find함수를 경로 압축 기법을 사용하여 최적화 시킨다.   
   
### 서로소 집합을 활용한 사이클 판별   
서로소 집합은 무방향 그래프 내에서의 사이클을 판별할 때 사용할 수 있다는 특징이 있다.   
DFS를 이용하여 판별할 수 있다.   
간선을 하나씩 확인하면서 두 노드가 포함되어 있는 집합을 합치는 과정을 반복하는것으로 사이클을 판별 할 수 있다.   
1. 각 간선을 확인하며 두 노드의 루트 노드를 확인한다.   
- 루트노드가 서로 다르다면 union연산 수행   
- 루트노드가 서로 같다면 사이클이 발생한것이다.   
2. 그래프에 포함되어 있는 모든 간선에 대해 1번 과정을 반복한다.   

```
import Foundation

func solution() {
    func find_parent(_ parent: [Int], _ x: Int) -> Int{
        if parent[x] != x {
            return find_parent(parent, parent[x])
        }
        return x
    }
    
    func union_parent(_ a: Int, _ b: Int) {
        let a = find_parent(parent, a)
        let b = find_parent(parent, b)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    let ve = readLine()!.split(separator: " ").map{Int($0)!}
    let (v,e) = (ve[0],ve[1])
    var parent = Array(repeating: 0, count: v+1)
    var cycle = false
    // 초기 자기자신은 i를 가르킨다
    for i in 1..<parent.count {
        parent[i] = i
    }
    //union 연산 수행
    for _ in 0..<e {
        let ab = readLine()!.split(separator: " ").map{Int($0)!}
        let (a,b) = (ab[0],ab[1])
        if find_parent(parent, a) == find_parent(parent, b) {
            cycle = true
            break
        } else {
            union_parent(a, b)
        }
    }
    
    if cycle == true { print("사이클이 발생했습니다.") }
    else { print("사이클이 발생하지 않습니다.")}
    
}
solution()
```
1 2 3의 노드가 모두 1의 부모노드를 가리킨다면 사이클이 발생한다고 출력된다.   
   
## 신장 트리
그래프 알고리즘 문제로 자주 출제되는 문제 유형이다.   
하나의 그래프가 있을 때 모든 노드를 포함하면서 사이클이 존재하지 않는 부분 그래프를 의미한다.   
모든 노드가 포함되어 서로 연결되면서 사이클이 존재하지 않는다는 조건이 트리의 성립 조건이기도 하다.   
이러한 그래프를 신장 트리라고 부르는 것이다.  
쉽게 말해서 한 노드를 출발해서 다른 노드를 걸쳐 다시 자기 자신 노드로 돌아올 수 있으면 사이클이 존재하고 신장트리가 될 수 없다.   
   
## 크루스칼 알고리즘
최소한의 비용으로 신장 트리를 찾아야 하는 경우가 있다.   
N개의 도시가 있을 때 두 도시 사이에 도로를 놓아 전체 도시가 서로 연결될 수 있게 도로를 설치하는 경우가 있다.   
A,B 2개의 도시를 선택했을 때, 도시 A에서 도시 B로 이동하는 경로가 반드시 존재하도록 설치할때 최소 비용을 계산해봐야한다.   
23 25 13일때 23+13=36이 가장 최소한의 비용인 최소 신장 트리 알고리즘이다.   
그리고 최소신장트리 알고리즘의 대표적인 예가 크루스칼 알고리즘이다.   
크루스칼 알고리즘을 사용하면 가장 적은 비용으로 연결할 수 있는데 그리디 알고리즘으로 분류할수도 있다.   
모든 간선에 대하여 정렬을 수행한 뒤에 가장 거리가 짧은 간선부터 집합에 포함시키면된다.   
이때 사이클을 발생시킬 수 있는 간선의 경우에는 집합에 포함시키지 않는다.   
   
<img width="372" alt="스크린샷 2023-05-31 오전 12 18 31" src="https://github.com/ww5702/Coding_Test/assets/60501045/d4faa107-4502-496e-b0d4-a767744c98e8">   
   
```
간선 (1,2)(1,5)(2,3)(2,6)(3,4)(4,6)(4,7)(5,6)(6,7)
비용  29   75    35   34   7    23   13   53   25
첫번째 단게에서 가장 짧은 간선을 선택한다. 따라서 (3,4)를 선택되고 이것을 집합에 포함한다.
즉 union작업을 통해 동일한 집합에 속하게 하는것이다.   
그 다음 작은 간선인 (4,7)을 선택하여 union
그 다음 (4,6)을 선택해 union
그 다음 작은 노드인 (6,7)을 선택할 찰예인데 이미 앞서 union의 결과 3,4,6,7이 이미 한 집단에 포함되어 있다.
따라서 union함수를 호출하지 않는다.
그 다음 작은 간선인 (1,2)를 선택해 union
다음 간선인 (2,6)을 union
다음 간선인 (2,3)은 현재 한 집단에 1,2,3,4,6,7이 포함되어 있으므로 포함하지 않고 패스
간선 (5,6)을 union
마지막으로 간선(1,5)를 union하려고 하지만 이미 집단에 포함되어 있기에 패스
```
이렇게 최소한의 비용으로 최소 신장 트리를 찾을 수 있다.   
이제 위 문제를 코드로 바꿔보자.   
```
import Foundation

func solution() {
    func find_parent(_ parent: [Int], _ x: Int) -> Int{
        // 루트 노드를 찾을때까지 재귀적으로 호출
        if parent[x] != x {
            return find_parent(parent, parent[x])
        }
        return x
    }
    
    func union_parent(_ a: Int, _ b: Int) {
        let a = find_parent(parent, a)
        let b = find_parent(parent, b)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    let ve = readLine()!.split(separator: " ").map{Int($0)!}
    let (v,e) = (ve[0],ve[1])
    var parent = Array(repeating: 0, count: v+1)
    var edges: [(Int,Int,Int)] = []
    var result = 0
    // 초기 자기자신은 i를 가르킨다
    for i in 1..<parent.count {
        parent[i] = i
    }
    for _ in 0..<e {
        let abcost = readLine()!.split(separator: " ").map{Int($0)!}
        let (a,b,cost) = (abcost[0],abcost[1],abcost[2])
        edges.append((cost,a,b))
    }
    print(edges)
    edges.sort(by: {$0.0 < $1.0})
    print(edges)
    for i in edges {
        if find_parent(parent, i.1) != find_parent(parent, i.2) {
            union_parent(i.1, i.2)
            result += i.0
        }
    }
    print(result)
}
solution()
```
sorting만 정상적으로 진행해준다면 구현은 쉽다.   
   
## 위상정렬
위상정렬은 정렬 알고리즘의 일종이다.   
순서가 정해져 있는 일련의 작업을 차례대로 수행해야 할 때 사용할 수 있는 알고리즘이다.   
이론적으로 말하자면 방향 그래프의 모든 노드를 방향성에 거스르지 않도록 순서대로 나열하는것이다.   
전형적인 예시로는 '선수과목을 고 학습 순서 설정'을 예로 들 수 있다.   
위상 정렬 알고리즘을 살펴보기전에 먼저 진입차수를 알아야 한다.   
진입 차수란 말 그대로 특정한 노드로 들어오는 간선의 개수를 의미한다.   
1. 진입차수가 0인 노드를 큐에 넣는다.   
2. 큐가 빌 때까지 다음의 과정을 반복한다.   
- 큐에서 원소를 꺼내 해당 노드에서 출발하는 간선을 그래프에서 제거한다.   
- 새롭게 진입차수가 0이 된 노드를 큐에 넣는다.   
알고리즘에서 확인할 수 있듯이 큐가 빌 때까지 큐에서 원소를 계속 꺼내서 처리하는 과정을 반복한다.   
이떄 모든 원소를 방문하기 전에 큐가 빈다면 사이클이 존재한다고 판단할 수 있다.   
위를 소스코들 구현해보자.   
```
import Foundation
struct Deque<T> {
    private var elements = [T]()
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        if elements.isEmpty {
            return nil
        } else {
            return elements.removeFirst()
        }
    }
    
    mutating func dequeueBack() -> T? {
        if elements.isEmpty {
            return nil
        } else {
            return elements.removeLast()
        }
    }
    
    mutating func isEmpty() -> Bool {
        if elements.count <= 0 { return true }
        else { return false }
    }
}
func solution() {
    let ve = readLine()!.split(separator: " ").map{Int($0)!}
    let (v,e) = (ve[0],ve[1])
    //진입차수
    var indegree = Array(repeating: 0, count: v+1)
    var graph = Array(repeating: [(Int)](), count: v+1)
    for _ in 0..<e {
        let ab = readLine()!.split(separator: " ").map{Int($0)!}
        let (a,b) = (ab[0],ab[1])
        graph[a].append(b)
        indegree[b] += 1
    }
    print(graph)
    func topology_sort() {
        var result: [Int] = []
        var q = Deque<Int>()
        // 진입차수가 0이면 append
        for i in 1..<v+1 {
            if indegree[i] == 0 {
                q.enqueue(i)
            }
        }
        while !q.isEmpty() {
            let now = q.dequeue()
            result.append(now!)
            
            // 해당 원소와 연결된 노드들의 진입차수 1 빼주기
            for i in graph[now!] {
                indegree[i] -= 1
                if indegree[i] == 0 { q.enqueue(i)}
            }
        }
        
        for i in result {
            print(i, terminator: " ")
        }
    }
    topology_sort()
}
solution()

```
위상 정렬의 시간 복잡도는 O(V+E)이다.   
위상 정렬을 수행할 때는 차례대로 모든 노드를 확인하면서, 해당 노드에서 출발하는 간선을 차례대로 제거해야한다.   
노드와 간선을 모두 확인하는 개념에서 O(V+E)의 시간이 소요되는 것이다.   
   
## 팀 결성
0번부터 N번까지의 번호를 부여했다.   
처음에는 모든 학생이 서로 다른팀으로 분류되어 N+1개의 팀이 존재한다.   
이때 선생님은 팀 합지기 연산과 같은 팀 여부 확인 연산을 사용할 수 있다.   
1. 팀 합치기 연산은 두 팀을 합친다.   
2. 같은 팀 여부 확인은 두 학생이 같은 팀인지 확인하는 연산이다.   
이 문제는 전형적인 서로소 집합 알고리즘 문제로 최대 100,000개의 n,m이므로 경로압축을 이용해 시간복잡도를 개선해야한다.   
main1이 경로 압축 x / main2가 경로 압축 o 이다.   
   
## 도시 분할 계획
N개의 집과 그 집들을 연결하는 M개의 길로 이루어져 있다.   
길은 양방향으로 다닐 수 있는 길이다. 그리고 길은 유지비가 든다.   
마을 이장은 2개의 분리된 마을로 분할할 계획을 세우고 있다.   
마을을 분할할 때에는 각 분리된 마을 안에 집들이 서로 연결되어 있어야 한다.   
각 분리된 마을 안에 있는 임의이 두 집 사이에는 언제나 경로가 존재해야 한다는 뜻이다.   
따라서 이장은 계획을 세우다 마을 안에 길들이 너무 많다는 사실을 깨닫고 필요없는 길들을 지우기 시작했다.   
분리된 두 마을 사이에 있는 길들은 필요가 없으므로 없앨 수 있다.   
또한 각 분리된 마을 안에서도 두 집 사이에 경로가 항상 존재하게 하면서 길을 더 없앨 수 있다.   
유지비의 합을 최소로 하는 프로그램을 작성하시오.   
   
이 문제의 핵심 아이디어는 전체 그래프에서 2개의 최소 신장 트리를 만들어내야 한다는 것이다.   
크루스칼 알고리즘으로 최소 신장 트리를 찾은 뒤에 최소 신장 트리를 구성하는 간선 중에서 가장 비용이 큰 간선을 제거하는 것이다.   
그러면 최소 신장 트리가 2개의 부분 그래프로 나뉘어지며 최적의 해를 만족한다.   
집이 하나만 있어도 마을로 치기 때문에 가장 큰 비용의 간선만 지워도 해결이 된다.   
   
## 커리큘럼
컴공 강의가 있다. 이때 강의는 선수 강의가 있을 수 잇는데, 선수강의가 있는 강의는 선수강의를 먼저 들어야만 해당 강의를 들을 수 있다.   
총 N개의 강의를 듣고자 한다. 모든 강의는 1번부터 N번 까지의 번호를 가진다.   
또한 동시에 여러 개의 강의를 들을 수 있다고 가정한다.   
예를 들어 N이 3일때 3번 강의의 선수강으로 1번과 2번 강의가 있고 1번 2번 강의는 선수강의가 없다   
1번강의 30시간 2번 강의 20시간 3번 강의 40시간   
1번 강의를 수강하기까지 최소 시간은 30시간, 3번 강의를 수강하기까지 최소 시간은 70시간이다.   
   
이 문제는 위상 정렬 알고리즘 문제이다.   

