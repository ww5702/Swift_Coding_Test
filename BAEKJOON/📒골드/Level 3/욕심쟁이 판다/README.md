일반 bfs로 풀이하니 34프로에서 메모리 초과 발생   

```
import Foundation

func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<n {
        board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var result = 0
    
    func bfs(_ y: Int, _ x: Int) {
        var q: [(Int,Int,Int,Int)] = []
        var idx = 0
        q.append((y,x,board[y][x],1))
        
        while q.count > idx {
            let now = q[idx]
            result = max(result, now.3)
            
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    if board[newY][newX] > now.2 {
                        q.append((newY,newX,board[newY][newX], now.3+1))
                    }
                }
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            //print(i,j)
            bfs(i, j)
            //print(result)
        }
    }
    print(result)
}
solution()
/*
 
 */

```
dict를 이용해 1부터 n*n까지의 숫자 위치를 지정하여 탐색하는 방법을 사용해 시간을 줄이려고 했으나   
생각해보면 중복제거라는 말이 없어서 안되는것같다.   

생각해보니 해당칸에서 갈 수 있는 칸은 정해져있다.   
따라서 dp처럼 이미 지나온 칸에서 갈 수있는 최대값을 정한다음,   
다시 해당 칸을 방문했을 때 이미 구했던 결과값을 가져온다면   
시간을 줄일 수 있다.   
```
import Foundation

func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<n {
        board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    var dis = Array(repeating: Array(repeating: 0, count: n), count: n)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var result = 1
    
    func dfs(_ y: Int, _ x: Int) -> Int{
        if dis[y][x] != 0 {
            return dis[y][x]
        }
        
        dis[y][x] = 1
        for i in 0..<4 {
            let newY = y + dy[i]
            let newX = x + dx[i]
            
            if (0..<n).contains(newY) && (0..<n).contains(newX) {
                if board[newY][newX] > board[y][x] {
                    dis[y][x] = max(dis[y][x], dfs(newY, newX) + 1)
                }
            }
        }
        return dis[y][x]
    }
    
    for i in 0..<n {
        for j in 0..<n {
            result = max(result, dfs(i, j))
        }
    }
    print(result)
}
solution()
/*
 
 */

```
