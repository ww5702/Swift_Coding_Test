처음에는 그냥 bfs로 풀이했으나 시간초과가 발생했다.   
따라서 섬의 갯수를 구하는 문제처럼 각 0으로 이뤄진 땅들이 몇개까지 연결되어있는지   
미리 구해주고 각 지역마다 번호를 매겨준다.   
위의 과정으로 인해 나중에 벽을 허무면서 또 bfs를 돌리지 않아도 되는 장점이 생긴다.   
그 후 2중반복문을 돌면서 1인 지역을 찾아 동,서,남,북 딱 4가지 방면만 조사해본다.   
해당 지역을 탐색했을때 앞서서 bfs를 돌려 땅으로 이뤄진 곳이라면 갈 수 있는 발판의 갯수가 있을것이다.   
해당 발판들을 다 더한뒤 원래 벽이었던 발판까지 +1하고 %10 하여 결과값으로 저장해준다.   
(여기서 Set을 사용하여 이미 밟았던 발판인지를 확인해봐야한다.   
만약 동서남북이 사실 다 연결되어있던 땅이라면 Set를 사용하지 않을 경우 4번 더하게 되는 참사가 발생한다.)   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.map{Int(String($0))!}
        board.append(input)
    }
    //print(board)
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var result = Array(repeating: Array(repeating: 0, count: m), count: n)
    var dis: [Int] = []
    dis.append(0)
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var num = 1
    
    func bfs(_ y:Int, _ x: Int) -> Int {
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((y,x))
        board[y][x] = num
        visited[y][x] = true
        var cnt = 1
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if board[newY][newX] == 0 && !visited[newY][newX] {
                        visited[newY][newX] = true
                        board[newY][newX] = num
                        cnt += 1
                        q.append((newY,newX))
                    }
                }
            }
        }
        return cnt
    }
    
    
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == 0 && !visited[i][j] {
                num += 1
                dis.append(bfs(i, j))
            }
        }
    }
    
//    for i in 0..<n {
//        print(board[i])
//    }
//    print(dis)
    
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == 1 {
                var count = 1
                var around = Set<Int>()
                for k in 0..<4 {
                    let newY = i+dy[k]
                    let newX = j+dx[k]
                    if (0..<n).contains(newY) && (0..<m).contains(newX){
                        if board[newY][newX] != 1 && !around.contains(board[newY][newX]){
                            count += dis[board[newY][newX]-1]
                            around.insert(board[newY][newX])
                        }
                    }
                }
                result[i][j] = count % 10
            }
        }
    }
    
    for i in 0..<n {
        print(result[i].map{String($0)}.joined(separator: ""))
    }
    
}

solution()
/*
 */

```
