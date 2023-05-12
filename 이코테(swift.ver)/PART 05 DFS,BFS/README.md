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
   
