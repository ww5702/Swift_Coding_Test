조합과 bfs를 합쳐 풀이하는 문제이다.   
n,m이 최대 64칸 이므로   
조합을 통해 임의의 벽을 3개 잡아도 시간초과가 발생하지 않을것이라고 판단하였다.   
이렇게 임의로 3개의 벽을 세워 tempBoard를 만들어준뒤   
해당 벽으로 bfs를 실행한다.   
미리 입력받을떄 바이러스의 위치를 좌표로 받아놓았기에   
모든 바이러스들을 반복문으로 실행하여 동서남북으로 이동하며 감염시킨다.   
전부 이동 후, 남아있는 0의 갯수를 합쳐 result에 저장한다.   
maximum과 비교하여 더 많은 안전한 방이 남아있다면 해당 경우를 저장한다.   
```
import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    var viruses: [(Int,Int)] = []
    var maximum = 0
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<m {
            board[i][j] = input[j]
            if input[j] == 2 {
                viruses.append((i,j))
            }
        }
    }
//    print(board)
//    print(viruses)
    func combi(_ cnt: Int) {
        if cnt == 3 {
            let value = bfs()
            maximum = max(maximum, value)
            return
        }
        
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 0 {
                    board[i][j] = 1
                    combi(cnt + 1)
                    board[i][j] = 0
                }
            }
        }
        
    }
    combi(0)
    
    func bfs() -> Int{
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var tempBoard = board
        var result = 0
        for virus in viruses {
            visited[virus.0][virus.1] = true
            var q: [(Int,Int)] = []
            var idx = 0
            q.append((virus.0, virus.1))
            
            while q.count > idx {
                let cur = q[idx]
                let curY = cur.0
                let curX = cur.1
                idx += 1
                
                for i in 0..<4 {
                    let newY = curY + dy[i]
                    let newX = curX + dx[i]
                    
                    if (0..<n).contains(newY) && (0..<m).contains(newX) {
                        if !visited[newY][newX] && tempBoard[newY][newX] == 0 {
                            tempBoard[newY][newX] = 2
                            visited[newY][newX] = true
                            q.append((newY,newX))
                        }
                    }
                }
            }
        }
        for i in 0..<n {
            let temp = tempBoard[i]
            let cnt = temp.filter({$0 == 0}).count
            result += cnt
        }
        //print(tempBoard)
        return result
    }
    
    print(maximum)
}
solution()

/*
 7 7
 2 0 0 0 1 1 0
 0 0 1 0 1 2 0
 0 1 1 0 1 0 0
 0 1 0 0 0 0 0
 0 0 0 0 0 1 1
 0 1 0 0 0 0 0
 0 1 0 0 0 0 0
 
 4 6
 0 0 0 0 0 0
 1 0 0 0 0 2
 1 1 1 0 0 2
 0 0 0 0 0 2
 */


```
