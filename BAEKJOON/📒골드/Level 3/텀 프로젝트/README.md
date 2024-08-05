사이클이 형성되는 경우를 구해주는 문제라고 생각하였고   
테케들은 통과가 되었는데 메모리 초과 발생   

```
import Foundation
func solution() {
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
        var visited = Array(repeating: false, count: n+1)
        var answer: [Int] = []
        var result = 0
        for i in 0..<n {
            if arr[i] == i+1 {
                visited[i+1] = true
            }
        }
        
        for i in 0..<n {
            answer = []
            if !visited[i+1] { dfs(i, i, []) }
            if answer.count != 0 {
                visited[i+1] = true
                for a in answer {
                    visited[a+1] = true
                }
            }
        }
        for i in 1...n {
            if !visited[i] { result += 1}
        }
        print(result)
        
        
        func dfs(_ n: Int, _ goal: Int, _ list: [Int]){
            let next = arr[n]-1
            if next == goal {
                answer = list
                return
            } else {
                if n != next && !visited[next+1] {
                    dfs(next, goal, list+[next])
                }
            }
            return
        }
        
    }
}


solution()
/*
 */

```
