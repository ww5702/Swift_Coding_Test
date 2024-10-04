bfs로 섬 갯수 세는것과 비슷하게 생각했는데   
시간초과가 발생   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var list: [(Int,Int)] = []
    var (y,x) = (-1,-1)
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        list.append((input[0],input[1]))
        x = max(x, input[0])
        y = max(y,input[1])
    }
    
    //print(y,x)
    var board = Array(repeating: Array(repeating: ".", count: x), count: y)
    var nowY = list[0].1, nowX = list[0].0
    for i in 1..<n {
        let newY = list[i].1, newX = list[i].0
        //print(nowX,newX)
        for j in nowX-1..<newX-1 {
            for k in 0..<nowY {
                board[k][j] = "X"
            }
        }
        nowY = newY
        nowX = newX
    }
    //print(nowY,nowX)
    
    for i in nowX-1..<x {
        for j in 0..<nowY {
            board[j][i] = "X"
        }
    }
    
//    for i in 0..<y {
//        print(board[i])
//    }
    
    
    let dy = [-1,1,0,0]
    let dx = [0,0,1,-1]
    
    func bfs(_ limitY: Int, _ limitX: Int, _ my: Int, _ mx: Int) {
        //print(limitY, my, mx)
        var q: [(Int,Int)] = []
        var idx = 0
        q.append((my,mx))
        board[my][mx] = "."
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (mx...limitX).contains(newX) && (my...limitY).contains(newY) {
                    //print(newY,newX)
                    if board[newY][newX] == "X" {
                        q.append((newY,newX))
                        board[newY][newX] = "."
                        
                    }
                }
                
            }
            
        }
    }
    
    var result = 0
    
    for i in 0..<x {
        for j in 0..<y {
            if board[j][i] == "X" {
                var limitY = j
                var limitX = i
                for j in 1..<y {
                    if board[j][i] != "X" {
                        break
                    } else {
                        limitY = j
                    }
                }
                
                for k in i..<x {
                    if board[limitY][k] != "X" {
                        break
                    } else {
                        limitX = k
                    }
                }
                
//                print("x = ",i)
//                print("y = ",j)
//                print("최대높이 = ",limitY)
//                print("최대가로 = ",limitX)
                result += 1
                bfs(limitY,limitX, j, i)
//                print("종료")
//                for i in 0..<y {
//                    print(board[i])
//                }
                
            }
        }
    }
    print(result)
}

solution()
/*
 */


```
