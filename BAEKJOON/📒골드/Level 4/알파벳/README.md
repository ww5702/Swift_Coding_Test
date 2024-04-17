dfs로 풀이했으나 시간초과   
그 이유는 배열에 담긴 visited가 O(n)이기 때문이다.   
비트 연산자로 풀이해야 더 빠르다.   
```
import Foundation
func solution(){
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,m) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: "", count: m), count: n)
    for i in 0..<n {
        let input = Array(readLine()!).map{String($0)}
        for j in 0..<m {
            board[i][j] = input[j]
        }
    }
    //print(board)
    var visited = Array(repeating: false, count: 26)
    var dis = Array(repeating: Array(repeating: 0, count: m), count: n)
    visited[Int(Character(board[0][0]).asciiValue!)-65] = true
    var result = 1
    //print(visited)
    // 90 65
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    func dfs(_ y: Int, _ x: Int, _ cnt: Int) {
        //print(y,x,cnt)
        result = max(result, cnt)
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if (0..<n).contains(ny) && (0..<m).contains(nx) {
                if !visited[Int(Character(board[ny][nx]).asciiValue!)-65] {
                    visited[Int(Character(board[ny][nx]).asciiValue!)-65] = true
                    dfs(ny,nx,cnt+1)
                    visited[Int(Character(board[ny][nx]).asciiValue!)-65] = false
                }
                
            }
        }
        
    }
    
    dfs(0,0,1)
    print(result)
}
solution()
```
A = 0 = 0001   
B = 1 = 0010   
과 같이 바꿔주고,   
A,B를 건너갔다면 0011 로 만들어주는 방식이다.   

```
import Foundation
func solution(){
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,m) = (input[0],input[1])
    var board: [[Int]] = Array(repeating: [], count: n)
    for i in 0..<n {
        let input = readLine()!.map { Int($0.asciiValue!) - 65 }
        board[i] = input
    }
    //print(board)
    var result = 1
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    func dfs(_ y: Int, _ x: Int, _ cnt: Int, _ bit: Int) {
        //print(y,x,cnt)
        result = max(result, cnt)
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if (0..<n).contains(ny) && (0..<m).contains(nx) {
                let new = 1 << board[ny][nx]
                //print(new)
                if bit & new == 0 {
                    dfs(ny, nx, cnt+1, bit | new)
                }
                
            }
        }
        
    }
    
    dfs(0,0,1, 1 << board[0][0])
    print(result)
}
solution()


```
