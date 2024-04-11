dfs로 풀이하면 도저히 돌아가는것을 구현하려고 해도 2번예제에서 57이 아니라 59가 나온다.   
```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (nm[0],nm[1])
    var board = [[Int]](repeating: [], count: n)
    let startPoint = readLine()!.split(separator: " ").map{Int($0)!}
    let start = (startPoint[0], startPoint[1])
    var direction = startPoint[2]
    var answer = 0
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = input
    }
    print(board)
    // 북 서 남 동
    let dy = [-1,0,1,0]
    let dx = [0,-1,0,1]
    func dfs(_ y: Int, _ x: Int, _ dir: Int) {
        print(y,x,dir)
        if board[y][x] == 0 {
            answer += 1
            board[y][x] = -1
        }
        var cnt = 1
        while cnt != 5 {
            let ny = y + dy[(dir+cnt)%4]
            let nx = x + dx[(dir+cnt)%4]
            if (0..<n).contains(ny) && (0..<m).contains(nx) {
                if (board[ny][nx] == 0) {
                    dfs(ny, nx, (dir+cnt)%4)
                }
            }
            cnt += 1
        }
        //한칸 뒤로 돌아가기
        let ny = y + dy[(dir+2)%4]
        let nx = x + dx[(dir+2)%4]
        if (0..<n).contains(ny) && (0..<m).contains(nx) {
            if (board[ny][nx] != 1) {
                dfs(ny,nx,dir)
            }
            
        }
    }
    
    dfs(start.0, start.1, direction)
    print(answer)
}
solution()
```
따라서 구현으로 풀이해야한다.    
```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (nm[0],nm[1])
    var board = [[Int]](repeating: [], count: n)
    let startPoint = readLine()!.split(separator: " ").map{Int($0)!}
    var (y,x) = (startPoint[0], startPoint[1])
    var direction = startPoint[2]
    var answer = 1
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = input
    }
    print(board)
    // 북 서 남 동
    let dy = [-1, 0, 1, 0]
    let dx = [0, 1, 0, -1]
    var cnt = 0
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    visited[y][x] = true
    
    while true {
        direction -= 1
        if direction == -1 { direction = 3 }
        print(y,x,direction)
        var ny = y + dy[direction]
        var nx = x + dx[direction]
        // 청소를 안했고 벽이 아니라면
        if (0..<n).contains(ny) && (0..<m).contains(nx) && board[ny][nx] != 1 && !visited[ny][nx] {
            visited[ny][nx] = true
            y = ny
            x = nx
            answer += 1
            cnt = 0
            continue
        } else {
            // 청소를 했고 벽이라면 회전만 한다
            cnt += 1
        }
        
        if cnt == 4 {
            cnt = 0
            ny = y - dy[direction]
            nx = x - dx[direction]
            if board[ny][nx] != 1 {
                y = ny
                x = nx
            } else {
                break
            }
        }
        
    }
    print(answer)
}
solution()
```
