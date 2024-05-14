bfs로 이동하며 남은 이동횟수보다 더 적게 남았으면 false로 하였다.   
하지만 시간초과   

```
import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    let dy = [0,0,-1,1]
    let dx = [-1,1,0,0]
    var canMove = 0
    var tempMove = 0
    var result = 0
    
    for i in 0..<queries.count {
        canMove += queries[i][1]
    }
    //print(canMove)
    
    func bfs(_ nowY: Int, _ nowX: Int, _ queries: [[Int]]) -> Bool {
        var (ny, nx) = (nowY,nowX)
        for i in 0..<queries.count {
            let move = queries[i][0]
            for _ in 0..<queries[i][1] {
                let newY = ny + dy[move]
                let newX = nx + dx[move]
                if (0..<n).contains(newY) && (0..<m).contains(newX) {
                    ny += dy[move]
                    nx += dx[move]
                }
                tempMove -= 1
                if (abs(x - ny) + abs(y - nx)) > tempMove {
                    return false
                }
            }
        }
        
        return ny == x && nx == y ? true : false
    }
    
    
    for i in 0..<n {
        for j in 0..<m {
            tempMove = canMove
            //print("시작",i,j)
            result += bfs(i,j,queries) ? 1 : 0
        }
    }
    
    return Int64(result)
}

```
더하는 방식을 한번에 하더라도 다르게 하더라도 시간초과   

```
var newY = ny + (dy[move]*queries[i][1])
var newX = nx + (dx[move]*queries[i][1])
//print(newY, newX)
    if newY < 0 { newY = 0 }
    else if newY >= n { newY = n-1 }
            
    if newX < 0 { newX = 0 }
    else if newX >= m { newX = m-1 }
```
해당 문제는 역으로 돌면서 가능한 범위를 구하는 문제였다.   
2번 예시를 예로 들었을때   
하 상상 우 상상상 좌 상 순서로 진행된다.   
역으로 이를 탐색헀을때   
어떠한 좌표에서 상 했을때 0,1 좌표가 되야 하므로   
0,1에서 한칸 밑으로 내려오는 곳까지가 가능한 범위가 된다.   
따라서 1,1까지 범위가 확장된다.   
그 다음은 좌로 움직이게 된다.   
그렇다면 오른쪽 좌표에서 한칸씩 왼쪽으로 왔을때 가능하므로   
0,2에서 이동했을때 0,1이 된다.   
또한 1,2에서 왼쪽 위로 이동했을때도 가능하다.   
따라서 범위는   
0,1 0,2   
1,1 1,2   
까지 된다.   
위로 세번 가는 상황은 3칸 밑에서 위로 올라왔을때이지만   
최대 행의 크기가 2이므로 이동할 수 없다.   

```
import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    // 0~4에 따른 방향 변화 
    // 좌 우 상 하
    var (startY, startX, endY, endX) = (x,y,x,y)
    
    func checkRight(_ query: [Int]) -> Bool {
        switch query[0] {
            case 0:
            if startX+query[1] > m-1 { return false }
            case 1:
            if endX-query[1] < 0 { return false }
            case 2:
            if startY+query[1] > n-1 { return false }
            default:
            if endY-query[1] < 0 { return false }
        }
        
        return true
    }
    
    func movePoint(_ query: [Int]) {
        switch query[0] {
            case 0:
            startX = min(m-1, startX+query[1])
            case 1:
            endX = max(0, endX-query[1])
            case 2:
            startY = min(n-1, startY+query[1])
            default:
            endY = max(0, endY-query[1])
        }
    }
    
    func extendPoint(_ query:[Int]) {
        switch query[0] {
        case 0:
        endX = min(m-1,endX+query[1])
        case 1:
        startX = max(0,startX-query[1])
        case 2:
        endY = min(n-1,endY+query[1])
        default:
        startY = max(0,startY-query[1])
        }
    }

    
    
    for query in queries.reversed() {
        //print(startY,endY,startX,endX)
        // 가장자리가 아니라면 확장 
        if (query[0] == 0 && startX != 0) || (query[0] == 1 && endX != m-1 || (query[0] == 2 && startY != 0) || (query[0] == 3 && endY != n-1)) {
            if !checkRight(query) { return 0 }
            movePoint(query)
        }
        extendPoint(query)
    }
    return Int64((endX-startX+1) * (endY-startY+1))
}

```
