# 그래프를 배우고, 그래프를 순회하는 알고리즘을 배워 봅시다.	
## 24479 알고리즘 수업 - 깊이 우선 탐색1
당연히 그래프가 전부 이어져있을것이라 생각했지만 아닐 수도 있었고   
방문한 순서를 출력하기 위해 방문하자마자 start를 출력했지만   
방문한 node를 순서대로 출력하라는것이 아닌   
1부터 n까지의 노드가 몇번째 순서로 출력되었는지 출력하라는 문제이다.   
문제를 잘 읽자...   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,r) = (input[0],input[1],input[2])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (u,v) = (input[0],input[1])
        graph[u].append(v)
        graph[v].append(u)
    }
    //print(graph)
    var visited = Array(repeating: false, count: n+1)
    func dfs(_ start: Int) {
        print(start)
        visited[start] = true
        
        for node in graph[start].sorted(by: <) {
            if !visited[node] { dfs(node) }
        }
        
    }
    dfs(r)
    for i in 1...n {
        if visited[i] { print(i) }
        else { print(0) }
    }
}

solution()

```
visited를 Boolean이 아닌 0으로 초기화 후 순서를 기록할 cnt를    
visited[i]가 0이라면 해당 순서를 기록해준다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,r) = (input[0],input[1],input[2])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (u,v) = (input[0],input[1])
        graph[u].append(v)
        graph[v].append(u)
    }
    //print(graph)
    var visited = Array(repeating: 0, count: n+1)
    var cnt = 0
    func dfs(_ start: Int) {
        cnt += 1
        visited[start] = cnt
        graph[start] = graph[start].sorted(by: <)
        for node in graph[start] {
            if visited[node] == 0 {
                dfs(node)
            }
        }
    }
    dfs(r)
    for i in 1...n {
        print(visited[i])
    }
}

solution()

```
## 24480 알고리즘 수업 - 깊이 우선 탐색2
탐색 순서가 오름차순에서 내림차순으로 바뀌었을 뿐이다.   
해당 문제가 뜻하는 바는 깊이 우선 탐색은 내림차순이던 오름차순이던 풀이가 가능하다는 뜻이다.      
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,r) = (input[0],input[1],input[2])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (u,v) = (input[0],input[1])
        graph[u].append(v)
        graph[v].append(u)
    }
    //print(graph)
    var visited = Array(repeating: 0, count: n+1)
    var cnt = 0
    func dfs(_ start: Int) {
        cnt += 1
        visited[start] = cnt
        graph[start] = graph[start].sorted(by: >)
        for node in graph[start] {
            if visited[node] == 0 {
                dfs(node)
            }
        }
    }
    dfs(r)
    for i in 1...n {
        print(visited[i])
    }
}

solution()

```
## 24444 알고리즘 수업 - 너비 우선 탐색1
비슷하지만 bfs라는 함수가 반복해서 실행되지는 않는다.   
graph[cur]에 들어간 모든 노드들을 방문하고 다음 index로 넘어간다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,r) = (input[0],input[1],input[2])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (u,v) = (input[0],input[1])
        graph[u].append(v)
        graph[v].append(u)
    }
    //print(graph)
    var visited = Array(repeating: 0, count: n+1)
    var q: [Int] = []
    var cnt = 0
    var index = 1
    func bfs(_ start: Int) {
        q.append(start)
        cnt += 1
        visited[start] = cnt
        
        while q.count >= index {
            let cur = q[index-1]
            for node in graph[cur].sorted(by: <) {
                if visited[node] == 0 {
                    cnt += 1
                    visited[node] = cnt
                    q.append(node)
                }
            }
            index += 1
        }
        
    }
    bfs(r)
    for i in 1...n {
        print(visited[i])
    }
}

solution()

```
## 24445 알고리즘 수업 - 너비 우선 탐색2
윗 문제의 내림차순으로 풀이하면 되는 문제이다.   
sorted(by: >)로 변경해준다.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,r) = (input[0],input[1],input[2])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (u,v) = (input[0],input[1])
        graph[u].append(v)
        graph[v].append(u)
    }
    //print(graph)
    var visited = Array(repeating: 0, count: n+1)
    var q: [Int] = []
    var cnt = 0
    var index = 1
    func bfs(_ start: Int) {
        q.append(start)
        cnt += 1
        visited[start] = cnt
        
        while q.count >= index {
            let cur = q[index-1]
            for node in graph[cur].sorted(by: >) {
                if visited[node] == 0 {
                    cnt += 1
                    visited[node] = cnt
                    q.append(node)
                }
            }
            index += 1
        }
        
    }
    bfs(r)
    for i in 1...n {
        print(visited[i])
    }
}

solution()

```
## 2606 바이러스 
dfs로 풀이하여 쉽게 풀 수 있는 문제이다.   
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var graph = [[Int]](repeating: [], count: n+1)
    //print(graph)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    
    var cnt = 0
    var visited = Array(repeating:false,count: n+1)

    func dfs(_ start: Int) {
        cnt += 1
        visited[start] = true
        
        for node in graph[start] {
            if !visited[node] {
                dfs(node)
            }
        }
    }
    
    dfs(1)
    print(cnt-1)
}

solution()

```
bfs로도 풀이가 가능하다.   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var graph = [[Int]](repeating: [], count: n+1)
    //print(graph)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    
    var cnt = 0
    var visited = Array(repeating:false,count: n+1)
    var Q: [Int] = []

    func bfs(_ start: Int) {
        Q.append(start)
        while !Q.isEmpty {
            let cur = Q.removeFirst()
            if visited[cur] { continue }
            visited[cur] = true
            cnt += 1
            for node in graph[cur] {
                Q.append(node)
            }
        }
    }
    
    bfs(1)
    print(cnt-1)
}

solution()

```
## 1260 DFS와 BFS 
dfs와 bfs를 둘다 만들어 비교해보는 문제이다.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,start) = (input[0],input[1],input[2])
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        graph[value[0]].append(value[1])
        graph[value[1]].append(value[0])
    }
    //print(graph)
    
    var dfsVisited = Array(repeating: false, count: n+1)
    var bfsVisited = Array(repeating: false, count: n+1)
    var Q: [Int] = []
    
    var dfsResult: [Int] = []
    var bfsResult: [Int] = []
    
    func dfs(_ start: Int) {
        dfsResult.append(start)
        dfsVisited[start] = true
        for node in graph[start].sorted(by: <) {
            if !dfsVisited[node] {
                dfs(node)
            }
        }
    }
    
    func bfs(_ start: Int) {
        Q.append(start)
        while !Q.isEmpty {
            let cur = Q.removeFirst()
            if bfsVisited[cur] { continue }
            bfsVisited[cur] = true
            bfsResult.append(cur)
            for node in graph[cur].sorted(by:<) {
                Q.append(node)
            }
        }
    }
    dfs(start)
    print(dfsResult.map{String($0)}.joined(separator: " "))
    bfs(start)
    print(bfsResult.map{String($0)}.joined(separator: " "))
}

solution()

```
## 2667 단지번호붙이기
입력된 0,1의 지도에서 최대 25 x 25의 반복문을 실행한다.   
만약 해당 좌표가 1이라면 dfs를 시작한다.   
dfs를 시작하면 상하좌우의 좌표이동을 미리 준비한 뒤   
해당 좌표를 이동하면서 지도를 넘어가지않고, 해당 좌표가 1이라면 즉 집이라면   
해당 좌표로 dfs를 다시 실행한다.   
이렇게 나온 result를 house 배열에 삽입하고   
house의 count가 동이고, house배열을 내림차순으로 정렬하여 출력한다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0..<n {
        let value = Array(readLine()!).map{Int(String($0))!}
        board[i] = value
    }
    
//    for i in 0..<n {
//        print(board[i])
//    }
//    print()
    
    var result = 0
    var house: [Int] = []
    
    
    // 상하좌우
    let dy = [-1,1,0,0]
    let dx = [0,0,-1,1]
    
    for i in 0..<n {
        for j in 0..<n {
            if board[i][j] == 1 {
                result = 0
                dfs(i,j)
                house.append(result)
            }
        }
    }
            
    func dfs(_ y: Int, _ x: Int) {
        result += 1
        board[y][x] = 0
        for i in 0..<4 {
            let curY = y + dy[i]
            let curX = x + dx[i]
            if curY >= 0 && curY < n && curX >= 0 && curX < n {
                if board[curY][curX] == 1 { dfs(curY,curX) }
            }
        }
    }
    
    print(house.count)
    for h in house.sorted(by: <) {
        print(h)
    }
}

solution()

```
## 1012 유기농 배추
동서남북을 지정하여 해당 좌표가 1이라면 계속해서 dfs를 반복하여 필요한 배추지렁이의 마리를 구한다.   
```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (m,n,k) = (input[0],input[1],input[2])
        var board: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        var cnt = 0
        for _ in 0..<k {
            let value = readLine()!.split(separator: " ").map{Int($0)!}
            board[value[1]][value[0]] = 1
        }
//        for i in 0..<n {
//            print(board[i])
//        }
        let dx = [1,-1,0,0]
        let dy = [0,0,1,-1]
        
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 1 {
                    cnt += 1
                    dfs(i,j)
                }
            }
        }
        
        func dfs(_ y: Int, _ x: Int) {
            board[y][x] = 0
            for i in 0..<4 {
                let curY = y + dy[i]
                let curX = x + dx[i]
                
                if curY >= 0 && curY <= n-1 && curX >= 0 && curX <= m-1 {
                    if board[curY][curX] == 1 { dfs(curY, curX) }
                }
            }
        }
        
        print(cnt)
        
    }
    
}

solution()

```
## 2178 미로 탐색
dfs로 풀이하면서 cnt가 더 작은 값으로 해당 좌표에 도달할 수 있다면   
교체해주는 식으로 풀이하였다.   
하지만 75%에서 시간초과가 발생   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    var result: [[Int]] = Array(repeating: Array(repeating: 100001, count: m), count: n)
    for i in 0..<n {
        let value = Array(readLine()!).map{Int(String($0))!}
        board[i] = value
        //print(board[i])
    }
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    func dfs(_ y: Int, _ x: Int, _ cnt: Int) {
        var cnt = cnt
        cnt += 1
        result[y][x] = min(result[y][x], cnt)
        
        for i in 0..<4 {
            let curY = y + dy[i]
            let curX = x + dx[i]
            
            if curY >= 0 && curY <= n-1 && curX >= 0 && curX <= m-1 {
                if board[curY][curX] == 1 && result[curY][curX] > result[y][x] + 1{
                    dfs(curY, curX, cnt)
                
                }
            }
        }
    }
    
    dfs(0,0,0)
//    for i in 0..<n {
//        print(result[i])
//    }
    print(result[n-1][m-1])
}

solution()

```
bfs로는 시간초과가 발생하지 않고 풀이가 가능했다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    var needToVisit = [(Int,Int)]()
    var result = Array(repeating: Array(repeating: 0, count: m), count: n)
    result[0][0] = 1
    for i in 0..<n {
        let value = Array(readLine()!).map{Int(String($0))!}
        board[i] = value
        //print(board[i])
    }
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    func bfs(_ y: Int, _ x: Int) {
        needToVisit.append((y,x))
        board[y][x] = 0
        while !needToVisit.isEmpty {
            let node = needToVisit.removeFirst()
            
            for i in 0..<4 {
                let curY = node.0 + dy[i]
                let curX = node.1 + dx[i]
                
                if curY >= 0 && curY <= n-1 && curX >= 0 && curX <= m-1 &&
                    board[curY][curX] == 1 {
                    
                    board[curY][curX] = 0
                    needToVisit.append((curY,curX))
                    result[curY][curX] = result[node.0][node.1] + 1
                }
            }
        }
        
    }
    bfs(0,0)
//    for i in 0..<n {
//        print(result[i])
//    }
    print(result[n-1][m-1])
}

solution()

```
needToVist.append부분을 
if result[curY][curX] > result[node.0][node.1]+1 {   
needToVisit.append((curY,curX))   
result[curY][curX] = result[node.0][node.1] + 1   
}   
로 바꿔도 다름이 없었다.   
어차피 순서대로 진행된다면 최저값으로 갱신되기 때문이다.   
   
    
배운점이 있다면 
curY >= 0 && curY <= n-1 && curX >= 0 && curX <= m-1 이 부분을   
(0..<n).contains(curY) && (0..<m).contains(curX)   
로 바꿀수 있었다.   
단순한 문법인데 생각치 못헀다.   
## 7576 토마토
startPoint를 미리 설정 후 bfs로 풀이하였으나 시간초과 발생   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n) = (input[0],input[1])
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    var startPoint = [(Int,Int)]()
    for i in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = value
        for j in 0..<m {
            if board[i][j] == 1 { startPoint.append((i,j)) }
        }
    }
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    var needToVisit = [(Int,Int)]()
    
    var result = Array(repeating: Array(repeating: 1000001, count: m), count: n)
    var isPossible = true
    
    func bfs(_ y: Int, _ x: Int) -> Int{
        var tempBoard = board
        var tempDay = 0
        needToVisit.append((y,x))
        result[y][x] = 0

        while !needToVisit.isEmpty {
            
            let node = needToVisit.removeFirst()
            for i in 0..<4 {
                let curY = node.0 + dy[i]
                let curX = node.1 + dx[i]
                
                if (0..<n).contains(curY) && (0..<m).contains(curX) &&
                    tempBoard[curY][curX] == 0{
                    //print(curY,curX)
                    tempBoard[curY][curX ] = 1
                    needToVisit.append((curY,curX))
                    result[curY][curX] = min(result[curY][curX], result[node.0][node.1] + 1)
                    tempDay = max(tempDay,result[curY][curX])
                }
            }
        }
        
//        for i in 0..<n {
//            print(result[i])
//        }
//        print()
//        for i in 0..<n {
//            print(tempBoard[i])
//        }
        for i in 0..<n {
            let value = tempBoard[i]
            if value.contains(0) {
                isPossible = false
                break
            }
        }
        
        return tempDay
    }
    var day = 100000001
    for start in startPoint {
        let value = bfs(start.0,start.1)
        //print()
        day = min(day,value)
        if !isPossible { break }
    }
    
    if !isPossible {
        print(-1)
    } else {
        print(day)
    }
    
}

solution()

```
해당 풀이는 removeFirst()를 수행하게 됨으로 시간초과가 발생할 수 밖에 없다.   
따라서 idx를 증가시켜주면서 코드를 확인하는 방법이 훨씬 효율이 좋다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n) = (input[0],input[1])
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    var Q = [(Int,Int)]()
    for i in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = value
        for j in 0..<m {
            if board[i][j] == 1 { Q.append((i,j)) }
        }
    }
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    var result = Array(repeating: Array(repeating: 0, count: m), count: n)
    var isPossible = true
    var idx = 0
    var lastIdx = (0,0)
    func bfs(){
        while idx < Q.count {
            let cur = Q[idx]
            idx += 1
        
            for i in 0..<4 {
                let curY = cur.0 + dy[i]
                let curX = cur.1 + dx[i]
                
                if (0..<n).contains(curY) && (0..<m).contains(curX) &&
                    board[curY][curX] == 0{
                    board[curY][curX ] = 1
                    result[curY][curX] = result[cur.0][cur.1] + 1
                    Q.append((curY,curX))
                    lastIdx = (curY,curX)
                }
            }
        }
        
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 0 {
                    isPossible = false
                }
            }
        }
//        
//        for i in 0..<n {
//            print(board[i])
//        }
//        print()
//        
//        for i in 0..<n {
//            print(result[i])
//        }
        
    }
    bfs()
    if !isPossible {
        print(-1)
    } else {
        print(result[lastIdx.0][lastIdx.1])
    }
}

solution()

```
## 7569 토마토
위 문제의 3차원 문제이다.   
따라서 입력받을 board와 걸리는 날짜를 계산할 result를 3차원으로 구성하고   
움직일 좌표인 dx,dy에 이어 dz까지 만들어줘 총 6가지 방향으로 움직이도록 하기만 하면 된다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n,h) = (input[0],input[1],input[2])
    var board: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: m), count: n),count: h)
    var Q = [(Int,Int,Int)]()
    for i in 0..<h {
        for j in 0..<n {
            let value = readLine()!.split(separator: " ").map{Int($0)!}
            board[i][j] = value
            for k in 0..<m {
                if board[i][j][k] == 1 { Q.append((i,j,k)) }
            }
        }
    }
    //print(board)
    
    let dz = [0,0,0,0,1,-1]
    let dy = [1,-1,0,0,0,0]
    let dx = [0,0,1,-1,0,0]
    
    var result = Array(repeating: Array(repeating: Array(repeating: 0, count: m), count: n),count: h)
    var isPossible = true
    var idx = 0
    var lastIdx = (0,0,0)
    func bfs(){
        while idx < Q.count {
            let cur = Q[idx]
            idx += 1
        
            for i in 0..<6 {
                let curZ = cur.0 + dz[i]
                let curY = cur.1 + dy[i]
                let curX = cur.2 + dx[i]
                
                if (0..<h).contains(curZ) && (0..<n).contains(curY) && (0..<m).contains(curX) &&
                    board[curZ][curY][curX] == 0 {
                    board[curZ][curY][curX] = 1
                    result[curZ][curY][curX] = result[cur.0][cur.1][cur.2] + 1
                    Q.append((curZ,curY,curX))
                    lastIdx = (curZ,curY,curX)
                }
            }
        }
        
        
        for i in 0..<h {
            for j in 0..<n {
                for k in 0..<m {
                    if board[i][j][k] == 0 {
                        isPossible = false
                    }
                }
            }
        }
        
        
//        for i in 0..<h {
//            for j in 0..<n {
//                print(board[i][j])
//            }
//        }
//        print()
//        
//        for i in 0..<h {
//            for j in 0..<n {
//                print(result[i][j])
//            }
//            
//        }
        
    }
    bfs()
    if !isPossible {
        print(-1)
    } else {
        print(result[lastIdx.0][lastIdx.1][lastIdx.2])
    }
}

solution()

```
