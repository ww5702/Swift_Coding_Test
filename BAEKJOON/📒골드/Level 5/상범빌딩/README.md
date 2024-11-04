bfs를 z축까지   

```
import Foundation
func solution(){
    while true {
        let lnm = readLine()!.split(separator: " ").map{Int(String($0))!}
        if lnm[0] == 0 && lnm[1] == 0 && lnm[2] == 0 { break }
        let (l,n,m) = (lnm[0],lnm[1],lnm[2])
        var board = Array(repeating: Array(repeating: Array(repeating: ".", count: m), count: n), count: l)
        
        var start = (0,0,0)
        var end = (0,0,0)
        for k in 0..<l {
            for i in 0..<n {
                let value = readLine()!.map{String($0)}
                for j in 0..<m {
                    if value[j] == "S" { start = (k,i,j) }
                    else if value[j] == "E" { end = (k,i,j) }
                    board[k][i][j] = value[j]
                }
            }
            let empty = readLine()
        }
        
//        print(start)
//        print(end)
        
//        for k in 0..<l {
//            for i in 0..<n {
//                print(board[k][i])
//            }
//            print()
//        }
        
        let dl = [1,-1,0,0,0,0]
        let dy = [0,0,1,-1,0,0]
        let dx = [0,0,0,0,1,-1]
        var result = -1
        
        func bfs() {
            var q: [(Int,Int,Int,Int)] = []
            var visited = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: l)
            q.append((start.0,start.1,start.2,0))
            var idx = 0
            visited[start.0][start.1][start.2] = true
            
            while q.count > idx {
                let now = q[idx]
                idx += 1
                
                if now.0 == end.0 && now.1 == end.1 && now.2 == end.2 {
                    result = now.3
                    break
                }
                
                
                for i in 0..<6 {
                    let newZ = now.0+dl[i]
                    let newY = now.1+dy[i]
                    let newX = now.2+dx[i]
                    let cost = now.3
                    //print(newZ,newY,newX)
                    
                    if (0..<l).contains(newZ) && (0..<n).contains(newY) && (0..<m).contains(newX) {
                        if !visited[newZ][newY][newX] && board[newZ][newY][newX] != "#" {
                            q.append((newZ,newY,newX,cost+1))
                            visited[newZ][newY][newX] = true
                        }
                    }
                }
            }
        }
        
        
        bfs()
        print(result == -1 ? "Trapped!" : "Escaped in \(result) minute(s).")
        //let empty = readLine()
    }
    
    
}

solution()
/*
 1 2 6 4 2
 */
  

```
