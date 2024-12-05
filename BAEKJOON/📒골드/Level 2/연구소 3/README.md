조합과 bfs를 이용해 풀이하는 문제이다.   
81프로에서 실패하였다.   
반례를 보니   
```
 4 1
 1 1 1 1
 1 1 1 1
 1 1 1 1
 0 2 2 0
 answer = 3
 
 5 2
 0 0 0 2 2
 1 1 1 1 0
 2 1 2 1 0
 2 1 1 1 1
 2 2 2 2 0
 answer = 1
```
의 경우가 있다고 한다.   
밑의 코드로 풀이할 경우 -1이 나온다.   


```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    var virus: [(Int,Int)] = []
    var dis = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        for j in 0..<n {
            board[i][j] = input[j]
            if input[j] == 2 {
                virus.append((i,j))
            }
        }
    }
    
//    for i in 0..<n {
//        print(board[i])
//    }
    //print(virus)
    
    var pickVirus: [[(Int,Int)]] = []
    
    func combi(_ idx: Int, _ list: [(Int,Int)]) {
        if list.count == m {
            pickVirus.append(list)
            return
        }
        
        for i in idx..<virus.count {
            combi(i+1, list + [(virus[i])])
        }
    }
    
    combi(0, [])
    //print(pickVirus)
    
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var tempDis = dis
    
    func bfs(_ v: [(Int,Int)]) {
        var q: [(Int,Int)] = v
        for i in 0..<v.count {
            dis[v[i].0][v[i].1] = 0
        }
        var idx = 0
        
        while q.count > idx {
            let now = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let newY = now.0 + dy[i]
                let newX = now.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    if board[newY][newX] == 0 && dis[newY][newX] > dis[now.0][now.1] + 1 {
                        dis[newY][newX] = dis[now.0][now.1] + 1
                        q.append((newY,newX))
                    }
                }
                
            }
            
        }
        
    }
    
    var tempCnt = 0
    var result = Int.max
    
    func isEnd() -> Bool {
        for i in 0..<n {
            for j in 0..<n {
                // 어차피 더 작은값은 나오지 못하므로 탈출
                if dis[i][j] != Int.max && dis[i][j] >= result { return false }
                // 못간지역인데 빈방이면 실패
                if dis[i][j] == Int.max && board[i][j] == 0 {
                    return false
                } else if dis[i][j] == Int.max && (board[i][j] == 2 || board[i][j] == 1) {
                // 못간지역인데 바이러스가 있던곳이라거나 벽이라면 패스
                    continue
                }
                tempCnt = max(tempCnt, dis[i][j])
                
            }
            
        }
        return true
    }
    
    
    for i in 0..<pickVirus.count {
        let pick = pickVirus[i]
        dis = tempDis
        bfs(pick)
        tempCnt = -1
        let isPossible = isEnd()
        //print(isPossible, tempCnt)
        if isPossible {
            result = min(result, tempCnt)
        }
        
    }
    print(result == Int.max ? -1 : result)
}
solution()
```
