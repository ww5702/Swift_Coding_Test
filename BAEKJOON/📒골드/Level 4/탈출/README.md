bfs를 이용해 불전용q, 고슴도치 이동q 두개로 이용해 풀이하였다.   
하지만 2퍼에서 메모리초과   

```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board = Array(repeating: Array(repeating: ".", count: m), count: n)
    var (startY, startX) = (0,0)
    var (goalY, goalX) = (0,0)
    var water: [(Int,Int)] = []
    for i in 0..<n {
        let input = readLine()!.map{String($0)}
        for j in 0..<m {
            board[i][j] = input[j]
            if input[j] == "D" {
                goalY = i
                goalX = j
            } else if input[j] == "S" {
                startY = i
                startX = j
                board[i][j] = "."
            } else if input[j] == "*" {
                water.append((i,j))
            }
        }
    }
//    print(board)
//    print(startY,startX)
    
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var isPossible = false
    
    func waterMove() {
        var q = water
        var newWater: [(Int,Int)] = []
        var idx = 0
        
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if board[newY][newX] == "." {
                        newWater.append((newY,newX))
                        board[newY][newX] = "*"
                    }
                }
            }
        }
        
        water = newWater
    }
    
    func bfs() {
        var q: [(Int,Int,Int)] = []
        var idx = 0
        var time = 0
        q.append((startY,startX,1))
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            if now.0 == goalY && now.1 == goalX {
                //print("끝")
                print(now.2-1)
                isPossible = true
                break
            }
            
            if now.2 > time {
                time += 1
                waterMove()
            }
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                
                
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    if board[newY][newX] == "." || board[newY][newX] == "D" {
                        q.append((newY,newX,now.2+1))
                    }
                }
            }
        }
        
    }
    
    bfs()
    if !isPossible { print("KAKTUS")}
}

solution()
/*
 */


```
