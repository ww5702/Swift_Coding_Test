graph와 dfs가 섞인 문제이다.   
레벨3인것 치고는 쉽게 풀이가 가능했다.   
```
import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    /*
    등수가 확실한 사람을 골라내는 문제
    이긴 횟수 + 진 횟수 = n-1일때 확실하다
    dfs로 각 번호를 순환해서 
    자기보다 약한 번호를 자기가 이긴 번호가 이긴 번호까지 순환해서 알수있다  
    반대로 자기보다 강한 번호는 자기가 dfs과정에서 호출이 된다면 나보다 강한번호
    */
    var graph = [[Int]](repeating: [Int](), count: n + 1)
    var weakCnt = [Int](repeating: 0, count : n+1)
    var strongCnt = [Int](repeating: 0, count : n+1)
    var visited = Array(repeating: false, count: n+1)
    // 그래프 만들기
    for i in 0..<results.count {
        graph[results[i][0]].append(results[i][1])
    }
    print(graph)
    var cnt = 0
    
    // dfs 순환
    func dfs(_ now: Int) {
        visited[now] = true
        // 자신보다 약한 선수가 이긴 선수도 내가 이긴것
        for weakPerson in graph[now] {
            if visited[weakPerson] == false {
                strongCnt[weakPerson] += 1
                cnt += 1
                dfs(weakPerson)
            }
        }
    }
    // 1번부터 자기가 이긴 선수 확인
    for i in 1...n {
        visited = Array(repeating: false , count: n+1)
        cnt = 0
        dfs(i)
        weakCnt[i] = cnt
        
    }
    // print(strongCnt)
    // print(weakCnt)
    var result = 0
    for i in 1...n {
        if strongCnt[i] + weakCnt[i] == n-1 {
            result += 1
        }
    }
    return result
}
```
