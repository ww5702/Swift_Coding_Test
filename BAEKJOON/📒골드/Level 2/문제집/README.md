위상정렬 문제이다.   
선행문제들을 graph에 정리해서 넣어주고,   
해당 문제를 풀기전에 먼저 풀어야할 갯수를 indegree에 저장한다.   
쉬운 문제를 먼저 풀어야하기에 반복할때마다 정렬을 해준다.   
첫번째 idx문제를 품과 동시에 해당 문제를 먼저 풀어야 한다고 했던 graph를 찾아본다.   
그리고 그 안에 후속 문제들의 indegree값을 1씩 줄여준다.   
만약 해당 indegree[]값이 0이 된다면 이제 해당 문제도 풀 수 있다는 의미이다.   
q에 해당 문제까지 넣어주고 다시 정렬을 해준다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var graph: [Int:[Int]] = [:]
    var indegree = Array(repeating: 0, count: input[0]+1)
    indegree[0] = -1
    
    for _ in 0..<input[1] {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if graph[input[0]] == nil {
            graph[input[0]] = [input[1]]
        } else {
            graph[input[0]]!.append(input[1])
        }
        indegree[input[1]] += 1
    }
    
    //print(indegree)
    
    var q: [Int] = []
    
    // 먼저 배움이 필요한 번호
    indegree.enumerated().forEach {
        if $0.element == 0 {
            q.append($0.offset)
        }
    }
    
    //print(q)
    
    var result : [Int] = []
    
    while !q.isEmpty {
        // 가능한 쉬운 문제부터
        q.sort(by:<)
        let now = q.removeFirst()
        result.append(now)
        
        if let next = graph[now] {
            for n in next {
                indegree[n] -= 1
                // 만약 선행문제들이 다 풀려있다면
                if indegree[n] == 0 {
                    q.append(n)
                }
            }
        }
        
    }
    
    print(result.map{String($0)}.joined(separator: " "))
}

solution()
/*
 
 */


```
