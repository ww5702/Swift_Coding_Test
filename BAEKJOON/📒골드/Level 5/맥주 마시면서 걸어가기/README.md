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
가능은 했다.   
좌표로 하지말고 애초에 0번이 집, n+1이 페스티벌장소로   
편의점들을 1부터 n까지로 각 지점에서 갈 수 있는 곳을 graph에 저장해준다.   
그리고 idx가 n+1이 된다면 true가된다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        let now = readLine()!.split(separator: " ").map{Int(String($0))!}
        var (nowY,nowX) = (now[0],now[1])
        var graph = [[Int]](repeating: [], count: n + 2)
        var edges = [now]
        for _ in 0..<n {
            edges.append(readLine()!.split(separator: " ").map { Int($0)! })
        }
        
        let end = readLine()!.split(separator: " ").map{Int(String($0))!}
        edges.append(end)
        let (goalY,goalX) = (end[0],end[1])
        var visited = Array(repeating: false, count: n+2)
        
        
        // 각 지점에서 갈 수 있는 지점을 idx로 표시
        for i in 0..<n + 1 {
            for j in i + 1..<n + 2 {
                if abs(edges[i][0] - edges[j][0]) + abs(edges[i][1] - edges[j][1]) <= 1_000 {
                    graph[i].append(j)
                    graph[j].append(i)
                }
            }
        }
        
        //print(graph)
        
        var q = [0]
        var idx = 0
        var isPossible = false
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            visited[now] = true
            
            if now == n+1 {
                isPossible = true
                break
            }
            
            for next in graph[now] {
                if !visited[next] {
                    visited[next] = true
                    q.append(next)
                }
            }
        }
        
        print(isPossible ? "happy" : "sad")
    }
}

solution()
/*
 */

```
