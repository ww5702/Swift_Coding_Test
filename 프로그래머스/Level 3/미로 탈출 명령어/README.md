시간을 단축시킬 수 있는 방법을 두가지로 생각해보았다.   
이미 이동한 거리에서부터 목적지까지의 거리가 남은 거리로는 갈 수 없을때 break   
경로가 하나 정해졌을떄 다음에 생기는 경로들이 만약 진작에 사전적으로 느리다면 break   
하지만 시간초과가 아직도 발생하였다.   
```
import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    var startWord = String(repeating: "z", count: k)
    var result = startWord
    var board = Array(repeating: Array(repeating: ".", count : m), count: n)
    board[x-1][y-1] = "S"
    board[r-1][c-1] = "E"
    var start = (x-1, y-1)
    var goal = (r-1, c-1)
    var dis = Array(repeating: Array(repeating: Int.max, count: m),count: n)
    dis[goal.0][goal.1] = 0
    for i in 0..<n {
        for j in 0..<m {
            dis[i][j] = abs(goal.0-i) + abs(goal.1-j)
        }
    }
    // for i in 0..<n {
    //     print(board[i])
    // }
    // for i in 0..<n {
    //     print(dis[i])
    // }
    let dy = [-1,1,0,0]
    let dx = [0,0,1,-1]
    
    func dfs(_ y: Int, _ x: Int, _ cnt: Int, _ path: String) {
        // 어차피 갈 수 없다면 일찍 break
        if dis[y][x] > k-cnt {
            return
        }
        
        // 처음 zzzzz가 아닌 무언가 만들어졌는데 애초에 작다면 return
        if result != startWord {
            var isPossible = true
            for i in 1...path.count {
                let s = path.index(path.startIndex, offsetBy: 0)
                let e = path.index(path.startIndex, offsetBy: i)
                if (result.substring(with: s..<e) < path.substring(with: s..<e)) {
                    isPossible = false
                    break
                }
            }
            if !isPossible {
                // print("어차피 뒤임")
                // print(result, path)
                return
            }
        }
        
        if cnt == k && y == goal.0 && x == goal.1 {
            if (result > path) {
                //print(path)
                result = path
            }
            return
        }
        
        for i in 0..<4 {
            let newY = y + dy[i]
            let newX = x + dx[i]
            if (0..<n).contains(newY) && (0..<m).contains(newX) {
                if i == 0 {
                    dfs(newY, newX, cnt+1, path+"u")
                } else if i == 1 {
                    dfs(newY, newX, cnt+1, path+"d")
                } else if i == 2 {
                    dfs(newY, newX, cnt+1, path+"r")
                } else {
                    dfs(newY, newX, cnt+1, path+"l")
                }
            }
        }
        
    }
    
   
    dfs(start.0, start.1, 0, "")
    return result == startWord ? "impossible" : result
}
```
풀이는 같으나 이와 같이 애초에 순서를 d l r u 로 바꿔놓는것이 중요했다.   
이동순서를 알파벳 순서로 바꾸어 계산 횟수를 줄여주는 것이다.   
즉 제일 빠르게 올라가면서 만나면 바로 return인것이다.   
```
import Foundation
func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    var result = "impossible"

    func go(_ x: Int, _ y: Int, _ path: String) {
        if result != "impossible" { return }

        let canGo = k - path.count
        let dis = abs(r-x) + abs(c-y)

        if canGo < dis || (canGo - dis) % 2 == 1 { return }
        if canGo == 0 && dis == 0 {
            result = path
            return
        }

        if x < n { go(x+1, y, path+"d") }
        if 1 < y { go(x, y-1, path+"l") }
        if y < m { go(x, y+1, path+"r") }
        if 1 < x { go(x-1, y, path+"u") }
    }

    go(x, y, "")
    return result
}
```
위 코드도 따라서 그대로 바꾸기만 하면 사용이 가능하다.   
```
import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    var result = "impossible"
    let dy = [1,0,0,-1]
    let dx = [0,-1,1,0]
    
    func dfs(_ y: Int, _ x: Int, _ path: String) {
        if result != "impossible" { return }
        
        let canMove = k - path.count
        let dis = abs((r-1)-y) + abs((c-1)-x) 
        if canMove < dis || (canMove - dis) % 2 == 1 { return }
        if canMove == 0 && dis == 0 {
            result = path
            return
        }
        
        for i in 0..<4 {
            let newY = y + dy[i]
            let newX = x + dx[i]
            if (0..<n).contains(newY) && (0..<m).contains(newX) {
                if i == 0 {
                    dfs(newY, newX, path+"d")
                } else if i == 1 {
                    dfs(newY, newX, path+"l")
                } else if i == 2 {
                    dfs(newY, newX, path+"r")
                } else {
                    dfs(newY, newX, path+"u")
                }
            }
        }
        
    }
    dfs(x-1, y-1, "")
    return result
}
```
