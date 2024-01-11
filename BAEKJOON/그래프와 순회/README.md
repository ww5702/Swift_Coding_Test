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
## 1697 숨박꼭질
bfs문제이지만 제일 먼저 떠오른 풀이 방법은 dp였다.   
최대 100000이어서 경우의 수만 구해준다면 풀이가 가능할것이라고 판단하였다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k) = (input[0],input[1])
    var result: [Int] = Array(repeating: 100001, count: 100001)
    
    
    func dp() -> Int {
        // 만약 동생보다 앞에 있다면 뒤로 갈수밖에 없다.
        if n >= k { return n-k }
        
        // 동생보다 뒤에 있다면 0부터 본인 위치까지는 +1씩 걸린다.
        for i in 0..<n {
            result[i] = n-i
        }
        
        result[n] = 0
        
        for i in n+1...k {
            // 짝수라면 /2의 위치에서 순간이동으로 오거나 / 한칸 전의 위치에서 올라오거나
            if i % 2 == 0 {
                result[i] = min(result[i/2]+1, result[i-1] + 1)
            } else {
            // 홀수라면 한칸 전의 위치에서 올라오거나
            // 한칸 위의 칸의 /2 에서 순간이동으로 올라온위치 (7이라면 4의 *2에서 -1) 즉 2번 이동
                result[i] = min(result[i-1]+1, result[(i+1)/2]+2)
            }
        }
        
        return result[k]
    }
    
    print(dp())
}
solution()

```
하지만 bfs문제 이므로 bfs로도 풀이해보았다.   
큐를 구현한다음 중복을 제거할 visited배열을 만든다.   
현재 위치에서 -1, +1, *2가 가능하다면 해당 
```
import Foundation
struct Queue {
    var que: [Int] = []
    mutating func push(_ x: Int) {
        que.append(x)
    }
    
    mutating func pop() -> Int {
        que.reverse()
        if let a = que.popLast() {
            que.reverse()
            return a
        }
        return 0
    }
    
    func empty() -> Bool {
        return que.isEmpty
    }
}
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k) = (input[0],input[1])
    var result: [Int] = Array(repeating: 0, count: 100001)
    var visited = Array(repeating: false, count: 100001)
    var q = Queue()
    
    func bfs(_ n: Int, _ k: Int) -> Int {
        q.push(n)
        
        while !q.empty() {
            let cur = q.pop()
            if cur == k { break }
            
            if cur > 0 && !visited[cur-1] {
                q.push(cur-1)
                visited[cur-1] = true
                result[cur-1] = result[cur] + 1
            }
            if cur < 100000 && !visited[cur+1] {
                q.push(cur+1)
                visited[cur+1] = true
                result[cur+1] = result[cur] + 1
            }
            if cur * 2 < 100000 && !visited[cur*2] {
                q.push(cur*2)
                visited[cur*2] = true
                result[cur*2] = result[cur] + 1
            }
            
        }
        return result[k]
    }
    
    print(bfs(n,k))
}
solution()

```
허나 위와 같이 poplast로 풀이할 경우 통과는 가능하나   
시간초과가 가끔 발생한다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k) = (input[0],input[1])
    var result: [Int] = Array(repeating: 0, count: 100001)
    var visited = Array(repeating: false, count: 100001)
    var q: [(Int,Int)] = []
    
    func bfs(_ n: Int, _ k: Int) -> Int {
        if n >= k {
            return n-k
        }
        var idx = 0
        q.append((n,0))
        visited[n] = true
        
        while q.count >= idx {
            let cur = q[idx]
            let location = cur.0
            let cnt = cur.1
            
            if location == k { break }
            
            if location > 0 && !visited[location-1] {
                q.append((location-1,cnt+1))
                visited[location-1] = true
                result[location-1] = result[location] + 1
            }
            if location < 100000 && !visited[location+1] {
                q.append((location+1,cnt+1))
                visited[location+1] = true
                result[location+1] = result[location] + 1
            }
            if location * 2 < 100001 && !visited[location*2] {
                q.append((location*2,cnt+1))
                visited[location*2] = true
                result[location*2] = result[location] + 1
            }
            idx += 1
        }
        return result[k]
    }
    
    print(bfs(n,k))
}
solution()

```
역시 bfs는 idx로 풀이하는것이 가장 빠른것 같다.   
1. dp / 메모리(80296) / 시간 16ms
2. bfs(popLast) / 메모리(70392) / 시간 1560ms
3. bfs(idx) / 메모리(83572) / 시간 20ms

## 7562 나이트의 이동   
bfs를 이용한다.   
나이트가 이동할 방법은 8가지이다.   
해당 방법으로 이동했을때 맵을 넘어가지 않으며 이전에 이미 방문한적 없던 곳이라면   
전 위치의 +1을 넣어준다.   
```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let l = Int(readLine()!)!
        var visited = Array(repeating: Array(repeating: false, count: l), count: l)
        var result = Array(repeating: Array(repeating: 0, count: l), count: l)
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let input2 = readLine()!.split(separator: " ").map{Int($0)!}
        let (y,x) = (input[0],input[1])
        let (goalY, goalX) = (input2[0], input2[1])
        var q: [(Int,Int)] = []
        
        let dy = [-1,-2,-2,-1,1,2,2,1]
        let dx = [-2,-1,1,2,2,1,-1,-2]
        
        func bfs(_ y: Int, _ x: Int) {
            var idx = 0
            q.append((y,x))
            visited[y][x] = true
            while q.count > idx {
                let cur = q[idx]
                idx += 1
                for i in 0..<8 {
                    let curY = cur.0 + dy[i]
                    let curX = cur.1 + dx[i]
                    if (0..<l).contains(curY) && (0..<l).contains(curX) && !visited[curY][curX]{
                        //print(curY,curX)
                        q.append((curY,curX))
                        visited[curY][curX] = true
                        result[curY][curX] = result[cur.0][cur.1] + 1
                    }
                    
                }
                
            }
            
        }
        
        bfs(y,x)
//        for i in 0..<l {
//            print(result[i])
//        }
        print(result[goalY][goalX])
    }
}
solution()

```
## 뱀과 사다리 게임
100크기의 게임판을 준비한다.   
주사위는 1~6까지 굴릴 수 있고,   
만약 아직 방문하지 않았으면서, 해당 위치의 발판이 보다 적은 주사위수로   
방문할 수 있는 장소라면 스택에 넣어준다.   
만약 밟은 발판이 사다리나 뱀으로 인해 내려가거나 올라가는 발판이라면   
해당 경우 이동하게 되는 발판을 기준으로 result를 비교해준다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var ladder: [Int:Int] = [:]
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        ladder[input[0]] = input[1]
        
    }
    var snake: [Int:Int] = [:]
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        snake[input[0]] = input[1]
    }
    //print(ladder,snake)
    var result = Array(repeating: 100,count: 101)
    var visited = Array(repeating: false, count: 101)
    var q: [Int] = []
    var idx = 0
    
//    print(ladder.contains{$0.key == 12})
//    print(ladder[12])
    
    func bfs(_ start: Int) {
        visited[start] = true
        q.append(start)
        result[start] = 0
        
        while idx < q.count {
            //print(result)
            let cur = q[idx]
            idx += 1
            
            for i in 1...6 {
                let curN = cur + i
                if curN <= 100 && !visited[curN] {
                    if ladder.contains(where: {$0.key == curN}) {
                        if result[ladder[curN]!] > result[cur]+1 {
                            q.append(ladder[curN]!)
                            visited[ladder[curN]!] = true
                            result[ladder[curN]!] = result[cur] + 1
                        }
                        
                    } else if snake.contains(where: {$0.key == curN}) {
                        if result[snake[curN]!] > result[cur]+1 {
                            q.append(snake[curN]!)
                            visited[snake[curN]!] = true
                            result[snake[curN]!] = result[cur] + 1
                        }
                        
                    } else {
                        if result[curN] > result[cur]+1 {
                            q.append(curN)
                            visited[curN] = true
                            result[curN] = result[cur] + 1
                        }
                        
                    }
                }
            }
        }
        
        
    }
    
    bfs(1)
    print(result[100])
}
solution()

```
## 2206 벽 부수고 이동하기
풀이방식은 비슷하다.   
벽을 아직 안부셨을때, 부셨을떄의 [0,0]으로 만들어 3차원배열로 만든다.   
이동할 수 있는 경우의 수는 2가지이다.   
1. 벽이 있다면 벽을 아직 뚫지 않았을때   
board[curY][curX] == 1 && visited[cur.0][cur.1][cur.2] == 0   
그렇다면 방문처리후 cur.2를 1로 바꾼후 큐에 넣는다.   
2. 벽이 없고, 아직 방문한 적이 없다면   
board[curY][curX] == 0 && visited[curY][curX][cur.2] == 0
방문처리 후 큐에 그대로 넣는다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        board[i] = Array(readLine()!.map{Int(String($0))!})
    }
    //print(board)
    
    var visited = Array(repeating: Array(repeating: [0,0], count: m), count: n)
    var q = [(Int,Int,Int)]()
    q.append((0,0,0))
    visited[0][0][0] = 1
    //print(visited)
    
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var idx = 0
    
    func bfs() -> Int{
        
        while idx < q.count {
            let cur = q[idx]
            idx += 1
            
            if cur.0 == n-1 && cur.1 == m-1 {
                return visited[cur.0][cur.1][cur.2]
            }
            
            for i in 0..<4 {
                let curY = cur.0 + dy[i]
                let curX = cur.1 + dx[i]
                
                
                if (0..<n).contains(curY) && (0..<m).contains(curX) {
                    // 민약 아직 벽을 부순적이 없다면
                    if board[curY][curX] == 1 && cur.2 == 0 {
                        // 앞으로 방문할 좌표는 벽을 이미 부쉈다는 의미로 [y][x][1]을 간다
                        visited[curY][curX][1] = visited[cur.0][cur.1][cur.2] + 1
                        q.append((curY,curX,1))
                    } else if board[curY][curX] == 0 && visited[curY][curX][cur.2] == 0 {
                        // 벽을 마주하지 않았다면 방문하지만 않았으면 추가 가능
                        visited[curY][curX][cur.2] = visited[cur.0][cur.1][cur.2] + 1
                        q.append((curY,curX,cur.2))
                    }
                }
            }
        }
        
        
        return -1
    }
    
    print(bfs())
}
solution()

```
## 1707 이분 그래프 
풀이는 맞는것 같으나 시간초과   
```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (v,e) = (input[0],input[1])
        var graph = [[Int]](repeating: [], count: v+1)
        for _ in 0..<e {
            let value = readLine()!.split(separator: " ").map{Int($0)!}
            graph[value[0]].append(value[1])
            graph[value[1]].append(value[0])
        }
        //print(graph)
        var isOk = true
        
        func bfs(_ start: Int) -> Bool {
            var visited = Array(repeating: 0, count: v+1)
            var q: [Int] = []
            var idx = 0
            q.append(start)
            visited[start] = 1
            
            while idx < q.count {
                //print(visited)
                let cur = q[idx]
                idx += 1
                 
                for node in graph[cur] {
                    // 아직 방문하지 않음
                    if visited[node] == 0 {
                        if visited[cur] == 1 {
                            visited[node] = -1
                            q.append(node)
                        } else {
                            visited[node] = 1
                            q.append(node)
                        }
                    } else if visited[node] == visited[cur] {
                        return false
                    }
                }
            }
            return true
        }
        
        for i in 1..<v {
            if !bfs(i) {
                isOk = false
                break
            }
        }
        
        print(!isOk ? "NO" : "YES")
    }
}
solution()

/*
 
 func bfs(_ start: Int){
     q.append(start)
     visited[start] = true
     
     while idx < q.count {
         //print(visited)
         let cur = q[idx]
         idx += 1
          
         for node in graph[cur] {
             // 아직 방문하지 않음
             if !visited[node] {
                 visited[node] = true
                 color[node] = !color[cur]
             } else {
                 if color[cur] == color[node] {
                     isOk = true
                     return
                 }
             }
         }
     }
 }
 */

```
이분 그래프란 본인을 제외한 연결된 노드들은 다른 색으로 칠해져있어야 하는 그래프이다.   
예를 들어 1이 파란색이고 연결되어있는 노드가 2,3이라면 2,3은 빨간색으로 칠해져야한다.   
다시 2,3이 연결된 다른 노드들은 파란색으로 칠해져 있어야 한다.   
만약 연결되어있는 노드가 같은색이라면 이분그래프가 아니다.   
따라서 방문한적있는 노드인 visited와 색을 칠하는 color 배열을 이용해   
true, false로 색을 구분하여 칠한다.   
만약 한번이라도 같은색이 있었다면 isOk를 true로 반환하고 return한다.   
모든 그래프의 정점을 탐색했을떄 isOk이라면 NO를 출력한다.   
```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (v,e) = (input[0],input[1])
        var graph = [[Int]](repeating: [], count: v+1)
        for _ in 0..<e {
            let value = readLine()!.split(separator: " ").map{Int($0)!}
            graph[value[0]].append(value[1])
            graph[value[1]].append(value[0])
        }
        //print(graph)
        var visited = Array(repeating: false, count: v+1)
        var color = Array(repeating: false, count: v+1)
        var isOk = false
        
        func dfs(_ start: Int){
            
            for node in graph[start] {
                // 아직 방문하지 않음
                if !visited[node] {
                    visited[node] = true
                    color[node] = !color[start]
                    dfs(node)
                } else {
                    if color[start] == color[node] {
                        isOk = true
                        return
                    }
                }
            }
        }
        
        for i in 1..<v {
            dfs(i)
        }
        
        print(isOk ? "NO" : "YES")
    }
}
solution()

```
