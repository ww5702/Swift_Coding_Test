dfs로 생각하여 한번씩 번갈아가면서 숫자를 뒤집어 준다고 생각하고   
풀이해보았지만 시간초과   

```
import Foundation

func solution(_ beginning:[[Int]], _ target:[[Int]]) -> Int {
    var board = beginning
    for i in 0..<beginning.count {
        print(beginning[i])
    }
    print()
    for i in 0..<beginning.count {
        print(target[i])
    }
    
    var result = Int.max
    var visited: [Bool] = Array(repeating: false, count: target.count*2)
    
    
    func dfs(_ board: [[Int]], _ cnt: Int) { 
        if cnt > board.count*2 { return }
        
        if (isOk(board, target)) {
            result = min(result, cnt)
            return
        }
        
        for i in 0..<beginning.count*2 {
            if (!visited[i]) {
                var newboard = change(board, i)
                visited[i] = true
                dfs(newboard, cnt+1)
                visited[i] = false
            }
        }
    }
    
    func change(_ board: [[Int]], _ num: Int) -> [[Int]]{
        var board = board
        // 열
        if num >= target.count {
            for i in 0..<target.count {
                if board[i][num-target.count] == 1 {
                    board[i][num-target.count] == 0
                } else {
                    board[i][num-target.count] == 1
                }
            }
        } else {
        // 행 
            for i in 0..<target.count {
                if board[num][i] == 1 {
                    board[num][i] == 0
                } else {
                    board[num][i] == 1
                }
            }
        }
        return board
    }
    
    func isOk(_ board: [[Int]], _ target: [[Int]]) -> Bool {
        
        for i in 0..<board.count {
            for j in 0..<board.count {
                if target[i][j] != board[i][j] {
                    return false
                }
            }
        }
        
        return true
    }
    
    dfs(board, 0)
    
    return result
}
```
2,4,5번 을 바꿔야 한다고 하자   
그렇다면 순서는 중요하지 않다   
2,4,5이든 2,5,4이든 같은 결과를 나타낸다.   

그렇다면 행에서 어떤줄을 뒤집고, 열에서 어떤줄을 뒤집을지만 고르면 된다.   
비트 연산자를 이용해 풀이를 해야한다.   

