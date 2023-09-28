처음 1번 컴퓨터부터 순환을 시작한다(dfs)   
시작하자마자 network갯수를 1 증가시킨다   
1번을 타고 들어가자마자 1번 네트워크는 visited를 true로 바꿔준다.   
그리고 computers[[1]]을 순환하면서 1(이어져있음)이면서 !visited[i](방문한적없음)이라면   
dfs(i)를 다시 실행해준다.  
```
import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var network = 0
    
    func dfs(_ com: Int) {
        visited[com] = true
        for i in 0..<n {
            if computers[com][i] == 1 && !visited[i] {
                dfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            network += 1
            dfs(i)
        }
    }
    
    return network
}
```
다시 풀어보기   
```
import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var result = 0
    var visited = Array(repeating: false, count: computers.count)
    
    func dfs(_ computer: Int){
        visited[computer] = true
        
        for i in 0..<n {
            // 방문하지 않았으며, 이어져있다면 재귀
            if visited[i] == false && computers[computer][i] == 1 {
                dfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if visited[i] == false {
            result += 1
            dfs(i)
        }
    }
    return result
}
```
