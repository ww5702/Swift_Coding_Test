각 통나무마다 q와 visited를 만들어 구현해보았다.   
하지만 10%에서 실패가 나왔다   
반례를 찾지 못해 일단 보류   
```
import Foundation
func solution(){
    var n = Int(String(readLine()!))!
    var board = Array(repeating: Array(repeating: "", count: n), count: n)
    var visited1 = Array(repeating: Array(repeating: false, count: n), count: n)
    var visited2 = Array(repeating: Array(repeating: false, count: n), count: n)
    var visited3 = Array(repeating: Array(repeating: false, count: n), count: n)
    var start: [(Int,Int)] = []
    var end: [(Int,Int)] = []
    var answer = 0
    
    for i in 0..<n {
        let input = Array(readLine()!).map{String($0)}
        for j in 0..<n {
            board[i][j] = input[j]
            if input[j] == "B" {
                start.append((i,j))
            } else if input[j] == "E" {
                end.append((i,j))
            }
        }
    }
//    print(board)
//    print(start, end)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    bfs(start[0], start[1], start[2])
    print(answer)
    
    func bfs(_ b1: (Int,Int), _ b2: (Int,Int), _ b3: (Int,Int)) {
        var q1: [(Int,Int)] = []
        var q2: [(Int,Int)] = []
        var q3: [(Int,Int,Int)] = []
        q1.append((b1.0, b1.1))
        q2.append((b2.0, b2.1))
        q3.append((b3.0, b3.1,0))
        visited1[b1.0][b1.1] = true
        visited2[b2.0][b2.1] = true
        visited3[b3.0][b3.1] = true
        
        var idx = 0
        
        while(q1.count > idx) {
            let now1 = q1[idx], now2 = q2[idx], now3 = q3[idx]
            idx += 1
            //print(now1, now2, now3)
            
            if (now1 == end[0] && now2 == end[1] && now3.0 == end[2].0 && now3.1 == end[2].1) {
                //print(now3.2)
                answer = now3.2
                break
            }
            
            for i in 0..<4 {
                let new1Y = now1.0 + dy[i], new1X = now1.1 + dx[i]
                let new2Y = now2.0 + dy[i], new2X = now2.1 + dx[i]
                let new3Y = now3.0 + dy[i], new3X = now3.1 + dx[i]
                
                if (0..<n).contains(new1Y) && (0..<n).contains(new1X)
                    && (0..<n).contains(new2Y) && (0..<n).contains(new2X)
                    && (0..<n).contains(new3Y) && (0..<n).contains(new3X) {
                    //하나라도 방문한적이 없던 곳이라면
                    if (!visited1[new1Y][new1X] || !visited2[new2Y][new2X] || !visited3[new3Y][new3X]) {
                        // 나무가 없는 장소라면
                        if (board[new1Y][new1X] != "1" && board[new2Y][new2X] != "1" && board[new3Y][new3X] != "1") {
                            //print(new1Y, new1X, new2Y, new2X, new3Y, new3X)
                            q1.append((new1Y,new1X))
                            q2.append((new2Y,new2X))
                            q3.append((new3Y,new3X,now3.2+1))
                            visited1[new1Y][new1X] = true
                            visited2[new2Y][new2X] = true
                            visited3[new3Y][new3X] = true
                        }
                        
                    }
                }
            }
            // 회전
            if (check(now2.0, now2.1)) {
                //print("회전")
                // 가로 모양이라면
                if now1.0 == now2.0 && now2.0 == now3.0 {
                    let new1Y = now2.0-1, new1X = now2.1
                    let new2Y = now2.0, new2X = now2.1
                    let new3Y = now2.0+1, new3X = now2.1
                    if (!visited1[new1Y][new1X] || !visited2[new2Y][new2X] || !visited3[new3Y][new3X]) {
                        if (board[new1Y][new1X] != "1" && board[new2Y][new2X] != "1" && board[new3Y][new3X] != "1") {
                            //print(new1Y, new1X, new2Y, new2X, new3Y, new3X)
                            q1.append((new1Y,new1X))
                            q2.append((new2Y,new2X))
                            q3.append((new3Y,new3X,now3.2+1))
                            visited1[new1Y][new1X] = true
                            visited2[new2Y][new2X] = true
                            visited3[new3Y][new3X] = true
                        }
                    }
                        
                    
                } else if now1.1 == now2.1 && now2.1 == now3.1 {
                    let new1Y = now2.0, new1X = now2.1-1
                    let new2Y = now2.0, new2X = now2.1
                    let new3Y = now2.0, new3X = now2.1+1
                    if (!visited1[new1Y][new1X] || !visited2[new2Y][new2X] || !visited3[new3Y][new3X]) {
                        if (board[new1Y][new1X] != "1" && board[new2Y][new2X] != "1" && board[new3Y][new3X] != "1") {
                            //print(new1Y, new1X, new2Y, new2X, new3Y, new3X)
                            q1.append((new1Y,new1X))
                            q2.append((new2Y,new2X))
                            q3.append((new3Y,new3X,now3.2+1))
                            visited1[new1Y][new1X] = true
                            visited2[new2Y][new2X] = true
                            visited3[new3Y][new3X] = true
                        }
                    }
                }
            }
        }
        
        
    }
    // 중앙 좌표를 기준으로 3x3이 1이 아닌지
    func check(_ y: Int, _ x: Int) -> Bool{
        // 돌렸을때 벽을 넘어가는지
        if (1..<n-1).contains(y) && (1..<n-1).contains(x) {
            if (board[y-1][x-1] == "1" || board[y-1][x] == "1" || board[y-1][x+1] == "1" || board[y][x-1] == "1" || board[y][x+1] == "1" || board[y+1][x-1] == "1" || board[y+1][x] == "1" || board[y+1][x+1] == "1") {
                return false
            }
            return true
        } else {
            return false
        }
    }
    
    
}
solution()

```
