불이 이동할 q와 사람이 이동할 q를 따로 구현해 움직인다.   
겉에 테두리를 !로 감싸 !를 만나면 break하게 해준다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (m,n) = (nm[0],nm[1])
        var board = Array(repeating: Array(repeating: "!", count: m+2), count: n+2)
        var fire: [(Int,Int)] = []
        var (startY,startX) = (0,0)
        for i in 0..<n {
            let input = readLine()!.map{String($0)}
            for j in 0..<m {
                board[i+1][j+1] = input[j]
                if input[j] == "@" {
                    startY = i+1
                    startX = j+1
                } else if input[j] == "*" {
                    fire.append((i+1,j+1))
                }
            }
        }
        
//        for i in 0..<n+2 {
//            print(board[i])
//        }
        //print(startY,startX)
        
        let dy = [1,-1,0,0]
        let dx = [0,0,1,-1]
        var dis = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        
        func fireMove() {
            var q = fire
            var newFire: [(Int,Int)] = []
            var idx = 0
            
            while q.count > idx {
                let now = q[idx]
                idx += 1
                
                for i in 0..<4 {
                    let newY = now.0+dy[i]
                    let newX = now.1+dx[i]
                    
                    if (1...n).contains(newY) && (1...m).contains(newX) {
                        if board[newY][newX] == "." || board[newY][newX] == "@" {
                            board[newY][newX] = "*"
                            newFire.append((newY,newX))
                        }
                    }
                }
            }
            
            fire = newFire
        }
        var isPossible = false
        
        func bfs() {
            var q: [(Int,Int,Int)] = []
            q.append((startY,startX,1))
            dis[startY][startX] = 0
            var idx = 0
            var firetime = 0
            
            while q.count > idx {
                let now = q[idx]
                //print(now)
                idx += 1
                
                // 탈출
//                if board[now.0][now.1] == "!" {
//                    isPossible = true
//                    print(now.2-1)
//                    break
//                }
                
                if firetime != now.2 {
                    //print("불 움직일시간")
                    fireMove()
                    firetime += 1
                    
//                    for i in 0..<n+2 {
//                        print(board[i])
//                    }
                    //print(fire)
                }
                
                for i in 0..<4 {
                    let newY = now.0 + dy[i]
                    let newX = now.1 + dx[i]
                    
                    if (0..<n+2).contains(newY) && (0..<m+2).contains(newX) {
                        if board[newY][newX] == "." {
                            q.append((newY,newX,now.2+1))
                            
                        } else if board[newY][newX] == "!" {
                            isPossible = true
                            print(now.2)
                            break
                        }
                    }
                }
                
            }
            
        }
        
        
        bfs()
        
        if !isPossible {
            print("IMPOSSIBLE")
        }
        
    }
}

solution()
/*
 */


```
