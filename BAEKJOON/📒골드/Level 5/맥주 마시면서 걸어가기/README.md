그냥 dfs로 풀이하니 시간초과    

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        let now = readLine()!.split(separator: " ").map{Int(String($0))!}
        var (nowY,nowX) = (now[0],now[1])
        var store: [(Int,Int)] = []
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{Int(String($0))!}
            store.append((input[0],input[1]))
        }
        let end = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (goalY,goalX) = (end[0],end[1])
        var visited = Array(repeating: false, count: n)
        var isPossible = false
        
        func dfs(_ y: Int, _ x: Int) {
            let result = abs(goalY - y) + abs(goalX - x)
            if isPossible { return }
            
            if result <= 1000 {
                isPossible = true
                return
            }
            
            
            for i in 0..<n {
                if !visited[i] {
                    let dis = abs(store[i].0 - y) + abs(store[i].1 - x)
                    // 20개로 최대 1000까지 갈수있다.
                    if dis <= 1000 {
                        visited[i] = true
                        dfs(store[i].0, store[i].1)
                        visited[i] = false
                    }
                }
                
            }
            
            return
        }
        
        
        if (abs(goalY-nowY) + abs(goalX-nowX)) <= 1000 {
            print("happy")
        } else {
            for i in 0..<n {
                let dis = abs(store[i].0-nowY)+abs(store[i].1-nowX)
                if dis <= 1000 {
                    visited[i] = true
                    dfs(store[i].0, store[i].1)
                    visited[i] = false
                }
                
                if isPossible { break }
            }
            
            if isPossible {
                print("happy")
            } else {
                print("sad")
            }
        }
        
    }
}

solution()
/*
 */

```
