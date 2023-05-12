# 꼭 필요한 자료구조 기초
'탐색' 이란 많은 양의 데이터 중에서 원하느 데이터를 찾는 과정을 의미한다.   
대표적인 탐색 알고리즘으로 DFS와 BFS를 꼽을 수 있는데, 이 두 알고리즘의 원리를 제대로 이해해야 코테의 탐색문제를 풀 수 있다.   
DFS와 BFS를 이해하려면 스택과 큐에 대한 이해가 전제되어야 하므로 간단하게 정리하고 넘어가겠다.   
'자료구조'란 데이터를 표현하고 관리하고 처리하기 위한 구조를 의미한다.   
그 중 스택과 큐는 두 핵심적인 함수로 구성된다.   
- 삽입(Push)
- 삭제(Pop)
물론 실사용할때에는 오버플로와 언더플로를 고민해야한다.   
오버플로는 수용할 수 있는 데이터의 크기를 넘어섰을 때 발생하고, 언더플로는 아무런 저장데이터가 없는데 삭제연산을 수행했을 때 발생한다.   
   
⭐️ swift에는 파이썬과 같이 별도의 라이브러리가 없어 실제로 기능하는 함수를 따로 제작해줘야하는 불편함이 있다😂   
   
## 스택
박스 쌓기에 비유할 수 있다.   
선입출(FILO)(First In Last Out)구조로 가장 위에 쌓여있는 데이터가 우선 삭제되어야한다.   
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var stack: [Int] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator:" ").map{String($0)}
        switch input[0] {
        case "push":
            push(Int(input[1])!)
            break
        case "pop":
            print(pop())
            break
        case "size":
            print(size())
            break
        case "empty":
            print(empty())
            break
        case "top":
            print(top())
            break
        default:
            break
        }
    }


    func push(_ n : Int) {
        stack.append(n)
    }
    func pop() -> Int {
        if let pop = stack.popLast() {
            return pop
        } else {
            return -1
        }
    }
    func size() -> Int{
        return stack.count
    }
    func empty() -> Int{
        if stack.isEmpty == true {
            return 1
        } else {
            return 0
        }
    }
    func top() -> Int{
        if let pop = stack.last {
            return pop
        } else {
            return -1
        }
    }
}
solution()
```
위의 코드는 stack 구조를 함수화하여 만들어놓은 것이다.   
push, pop, size, empty, top기능을 사용할 수 있도록 하였다.   
   
## 큐
큐는 대기줄에 비유할 수 있다.   
선입선출(FIFO)(First In First Out) 구조로 먼저 줄은 선 사람이 먼저 나갈 수 있는 구조라고 볼 수 있다.   
   
⭐️ 물론 swift에는 파이썬과 같이 별도의 라이브러리가 없어 큐 또한 실제로 기능하는 함수를 따로 제작해줘야하는 불편함이 있다😂   
   
```
struct Queue<T> {
    private var queue: [T?] = []
    private var front: Int = 0
    
    public var frontValue: Int {
        return self.front
    }
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard front <= count, let element = queue[front] else { return nil }
        queue[front] = nil
        front += 1
        return element
    }
}
```
enque()를 통해 input, dequeue()를 통ㅇ해 output이 가능하다.   
   
## 재귀함수
DFS와 BFS를 이해하려면 재귀함수도 이해하고 있어야 한다.   
재귀함수는 자기 자신을 다시 호출하는 함수를 의미한다.   
팩토리얼과 같은 함수를 구현할때 자주 사용한다.   
```
import Foundation
func solution() {
    let input = Int(readLine()!)!

    func factorial(_ n : Int) -> Int{
        if n <= 1 {
            return 1
        } else {
            return n * factorial(n-1)
        }
    }
    
    print(factorial(input))
}
solution()
```
물론 for문을 통해 반복문으로 문제를 해결할 수도 있다.   
하지만 점화식을 그대로 소스코드를 옮겨놓는 방식이 훨씬 간결하다고 볼 수 있다.   
해당 개념은 다이나믹 프로그래밍으로도 이어지기 때문에 중요하다.   
   
## 탐색 알고리즘 DFS/BFS
DFS(Depth-First Search) 깊이 우선 탐색이라고도 부름, 그래프에서 깊은 부분을 우선적으로 탐색하는 알고리즘이다.   
그래프에서 서로 연결되어 있지 않은 노드끼리는 무한의 비용이라고 작성한다.   
DFS알고리즘은 특정한 경로를 탐색하다가 특정한 상황에서 최대한 깊숙이 들어가서 노드를 방문한 후, 다시 돌아가 다른 경로를 탐색하는 알고리즘이다.   
1. 탐색 시작 노드를 스택에 삽입하고 방문처리를 한다.   
2. 스택의 최상단 노드에 방문하지 않은 인접노드가 있으면 그 인접노드를 스택에 넣고 방문 처리를한다. 방문하지 않은 인접노드가 없으면 스택에서 최상단 노드를 꺼낸다.   
3. 2번의 과정을 더이상 수행할 수 없을 때 까지 반복한다.   
   
<img width="567" alt="스크린샷 2023-05-12 오후 4 32 43" src="https://github.com/ww5702/Coding_Test/assets/60501045/02f1c474-4a26-44fb-b0c2-552360aad838">   
   
위의 그림에서 노드 1을 시작으로 설정하여 탐색을 진행한다면 과정은 다음과 같다.   
단순하게 가장 깊숙이 위치하는 노드에 닿을때까지 탐색을 하면 된다.   
또한 일반적으로 인접한 노드 중에서 방문하지 않은 노드가 여러 개 있으면 번호가 낮은 순서부터 처리한다.   
***
1삽입
***
방문하지 않은 노드 2, 3, 8이 있다 그중 가장 작은 노드 2를 스택에 넣고 방문처리한다.   
***
1삽입, 2삽입
***
2에는 방문하지 않은 인접 노드 7이 있다.   
***
1삽입, 2삽입, 7삽입
***
