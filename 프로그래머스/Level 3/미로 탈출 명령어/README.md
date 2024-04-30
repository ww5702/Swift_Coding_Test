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
