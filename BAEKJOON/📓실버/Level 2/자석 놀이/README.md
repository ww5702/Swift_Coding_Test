오른쪽 맨밑을 만나면 무조건 탈출하는 return을 없애고,   
한번씩은 왔다갔다할수있도록 했으나 시간초과   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<2 {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    //print(board)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var visited = Array(repeating: Array(repeating: false, count: n), count: 2)
    visited[0][0] = true
    var result = -Int.max
    func dfs(_ y: Int, _ x: Int, _ sum: Int, _ cnt: Int) {
        if y == 1 && x == n-1 {
            result = max(result, sum)
        }
        
        
        for i in 0..<4 {
            let newY = y + dy[i]
            let newX = x + dx[i]
            
            if (0..<2).contains(newY) && (0..<n).contains(newX) {
                if !visited[newY][newX] {
                    visited[newY][newX] = true
                    dfs(newY, newX, sum+board[newY][newX], 0)
                    visited[newY][newX] = false
                } else {
                    if cnt == 0 {
                        dfs(newY, newX, sum, 1)
                    }
                }
            }
        }
        
        return
    }
    
    dfs(0,0,board[0][0],0)
    
    print(result)
}
solution()
/*
 
 */

```
