위상정렬문제이다.   
선행학습 문제처럼 graph를 만들어 해당건물을 짓기전에 지어야할 선수건물을 넣어준다.   
예시를 예로 들면, 1 = [2,3,4] 3 = [4,5]가 된다.   
indegree 배열을 만들어 해당 건물의 선수 건물의 수를 넣는다.   
예시를 예로 들면 [0,1,1,2,1] 가 된다.   
선수건물이 필요없는 건물들을 q에 넣는다.   
당연히 선수건물이 필요없는 건물들의 값을 result에 먼저 넣어준다.   

이제 q가 빌때까지 반복하면서 첫번째 index를 꺼내준다.   
1번 건물을 지었을때 2,3,4건물이 지을 수 있을수도 없을수도 있다   
따라서 2,3,4번의 indegree를 1씩 빼본다.   
만약 indegree가 0이 된다면 이제 지을 수 있다는 의미이다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    
    var graph: [Int:[Int]] = [:]
    var indegree = Array(repeating: 0, count: n+1)
    indegree[0] = -1
    
    var time = Array(repeating: 0, count: n+1)
    time[0] = 0
    
    for i in 1...n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        time[i] = input[0]
        
        for j in 1..<input.count-1 {
            let value = graph[input[j]] ?? []
            graph[input[j]] = value + [i]
            indegree[i] += 1
        }
        
    }
    
    //print(graph)
    //print(indegree)
    
    var q: [Int] = []
    var result = Array(repeating: 0, count: n+1)
    
    // 조건없이 지을수 있는 건물 먼저
    indegree.enumerated().forEach {
        if $0.element == 0 {
            q.append($0.offset)
        }
    }
    q.forEach{
        index in result[index] = time[index]
    }
    

    while !q.isEmpty {
        let now = q.removeFirst()
        if graph[now] != nil {
            for next in graph[now]! {
                let resultTime = max(time[now], result[now])
                indegree[next] -= 1
                if indegree[next] == 0 {
                    q.append(next)
                }
                result[next] = max(result[next], resultTime + time[next])
            }
        }
    }
    
    for i in 1...n {
        print(result[i])
    }
    
}

solution()
/*
 */


```
