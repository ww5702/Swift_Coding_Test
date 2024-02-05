# 최소 비용으로 그래프의 모든 정점을 연결해 봅시다.	

## 9372 상근이의 여행
무조건 연결되어있는 비행스케쥴이다.   
따라서 n-1만 하면 정답에 도달하는 꼼수가 존재한다.   
이 이유는 갔던 경로를 또 가더라도 결과에 영향을 주지 않는 조건때문이다.   
```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (n,m) = (input[0],input[1])
        var graph: [[Int]] = Array(repeating: [], count: n+1)
        for i in 0..<m {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            graph[input[0]].append(input[1])
            graph[input[1]].append(input[0])
        }
        //print(graph)
        print(n-1)
    }
}
solution()

```
## 1197 최소 스패닝 트리
최소 신장 트리의 기본을 묻는 문제이다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    
    func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if (a != b) {
            parent[b] = a
        }
    }
    
    var parent = [Int](0...n)
    var graph: [(Int,Int,Int)] = []
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph.append((input[0],input[1],input[2]))
    }
    graph.sort(by: {$0.2 < $1.2})
//    print(graph)
    var line = 0
    var result = 0
    for i in 0..<m {
        if line == n-1 { break }
        let cur = graph[i]
        if find(cur.0) != find(cur.1) {
            union(cur.0, cur.1)
            line += 1
            result += cur.2
        }
    }
    print(result)
}
solution()

```
## 4386 별자리 만들기
좌표라고 어렵게 생각하지말고 3가지 좌표가 있다면 순서를 Int로 생각해   
해당 별에서부터 나머지별까지의 값을 저장해준다고 생각하면 편하다.    
그리고 해당 거리들중 가장 작은 거리들을 우선적으로 선택해 간선을 이어준다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if (a != b) {
            parent[b] = a
        }
    }
    
    var parent = [Int](0...n)
    var stars: [(Double,Double)] = []
    var distanceStar: [(Int,Int,Double)] = []
    var result: Double = 0.0
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Double($0)!}
        stars.append((input[0],input[1]))
    }
    for i in 0..<n {
        for j in i+1..<n {
            //print(stars[i],stars[j])
            let x = pow((stars[i].0 - stars[j].0),2)
            let y = pow((stars[i].1 - stars[j].1),2)
            distanceStar.append((i,j,sqrt(x+y)))
        }
    }
    //print(distanceStar)
    distanceStar.sort{$0.2 < $1.2}
    var line = 0
    for i in 0..<distanceStar.count {
        if line == n-1 { break }
        if find(distanceStar[i].0) != find(distanceStar[i].1) {
            result += distanceStar[i].2
            line += 1
            union(distanceStar[i].0, distanceStar[i].1)
        }
        
    }
    print(round(result*100)/100)
}
solution()

```
## 1774 우주신과의 교감
이미 연결되어있는 간선이 존재한다는 것 빼고는 전부 같은 방식의 문제이다.   
그리고 출력시 4.0을 4.00으로 해야한다는 점이 좀 다르다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    
    func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    var parent = [Int](0...n)
    var gods: [(Int,Int)] = []
    var distanceGods: [(Int,Int,Double)] = []
    var result: Double = 0.0
    var line = 0
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        gods.append((input[0],input[1]))
    }
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        union(input[0], input[1])
        line += 1
    }
    for i in 0..<gods.count-1 {
        for j in i+1..<gods.count {
            //print(stars[i],stars[j])
            let x = pow((Double(gods[i].0) - Double(gods[j].0)),2)
            let y = pow((Double(gods[i].1) - Double(gods[j].1)),2)
            distanceGods.append((i,j,sqrt(x+y)))
        }
    }
    //print(distanceGods)
    distanceGods.sort{$0.2 < $1.2}

    for i in 0..<distanceGods.count {
        if line == n-1 { break }
        if find(distanceGods[i].0) != find(distanceGods[i].1) {
            result += distanceGods[i].2
            line += 1
            union(distanceGods[i].0, distanceGods[i].1)
        }
        
    }
    print(String(format: "%.2f", result))
}
solution()

```
## 6497 전력난
크루스칼 알고리즘을 이용하면서 길이 이어지면 총 전력에서 - 해주면 된다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n) = (input[0],input[1])
    
    func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    var parent = [Int](0...m)
    var graph: [(Int,Int,Int)] = []
    var result = 0
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph.append((input[0],input[1],input[2]))
        result += input[2]
    }
    graph.sort(by: {$0.2 < $1.2})
    //print(graph)
    var line = 0
    for i in 0..<n {
        if line == n-1 { break }
        let cur = graph[i]
        if find(cur.0) != find(cur.1) {
            union(cur.0, cur.1)
            line += 1
            result -= cur.2
        }
    }
    print(result)
}
solution()

```
## 17472 다리 만들기 2
어렵지는 않으나 구현해야할 부분이 생각보다 많고,   
반례가 많아서 조금 복잡했던 문제이다.   
먼저 MST를 사용하기 위해 각 섬에서부터 섬까지 다리를 연결한다면   
생기는 다리의 길이에 대해 구해야한다.   
그리고 다리의 길이를 구하기 위해, 섬의 갯수를 구하기 위해 dfs를 통해 섬이 변경된다면 +1을 하는 형식으로   
섬의 갯수와 board를 다시 정리해준다.   
섬의 갯수와 섬을 숫자로 분리해줬다면 섬에서 동서남북으로 한칸 전진했을때 바다인 경우를 따로 구해준다.   
getBridgeDirections를 통해 섬에서 바다로 향하는 방향을 구해주어 edge에 넣어준다.   
그렇다면 해당 좌표에서 (동서남북) 방향을 통해 바다로 나가는 좌표가 배열형태로 구해진다.   
해당 좌표에서 동서남북에 따라 좌표를 전진시켰을때 다른 섬이 나타난다면   
기존섬, 만나는섬, 다리의 길이를 bridges배열에 삽입해준다.   
여기서 반례에 만나 10%에서 계속 실패했는데   
예시를 들어보면   
 1 1 1 1 1 1 1 1   
 0 0 0 0 0 0 0 1   
 1 1 1 1 1 1 1 1   
 0 0 0 0 0 0 0 1   
 2 0 0 0 0 0 0 1   
 2 0 0 0 0 0 0 1   
 2 0 1 1 1 1 1 1    
이와 같은 섬이 있을때 (0,0) 좌표의 1 에서 남쪽으로 3칸 전진했을때 2를 만나 연결된다는 반례가 발생하였다.   
따라서 전진하다가 다시 같은 섬을 만난다면 break 하는 예외문을 추가해주었어야 했다.   
그리고 이제서야 MST 사용이 가능하다.   
나머지는 위에서 풀이했던 방식과 동일하다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var board: [[Int]] = Array(repeating: [], count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = input
    }
    // 동 서 남 북
    let dy = [0,0,1,-1]
    let dx = [1,-1,0,0]
    var cntIsland = board
    var island = 0
    func dfs(_ y: Int, _ x: Int, _ island: Int) {
        cntIsland[y][x] = 0
        board[y][x] = island
        
        for i in 0..<4 {
            let curY = y + dy[i]
            let curX = x + dx[i]
            
            if (0..<n).contains(curY) && (0..<m).contains(curX) && cntIsland[curY][curX] == 1 {
                dfs(curY,curX,island)
            }
        }
    }
    for i in 0..<n {
        for j in 0..<m {
            if cntIsland[i][j] == 1 {
                island += 1
                dfs(i,j,island)
            }
        }
    }
//    print(island)
//    for i in 0..<n {
//        print(board[i])
//    }
    
    var edges: [(Int, Int, Int)] = []
    var bridges: [(Int,Int,Int)] = []
    func getBridgeDirections(y: Int, x: Int) -> [Int] {
        var directions: [Int] = []
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            if (0..<n).contains(ny) && (0..<m).contains(nx) {
                if board[ny][nx] == 0 {
                    directions.append(i)
                }
            }
            
        }
        return directions
    }
    
    // 연결 다리 구하기
    func makeBridge(_ y: Int, _ x: Int, _ groundNum: Int, _ direction: Int) {
        var ny = y, nx = x
        var anotherGroud = groundNum
        // 동서남북에 따라
        if direction == 0 {
            while true {
                nx += 1
                if !(0..<m).contains(nx) { break }
                anotherGroud = board[ny][nx]
                if anotherGroud == groundNum { break }
                if anotherGroud != groundNum && anotherGroud != 0 {
                    if nx-x-1 >= 2 {
                        
                        bridges.append((groundNum,anotherGroud,nx-x-1))
                    }
                    break
                }
            }
        } else if direction == 1 {
            while true {
                nx -= 1
                if !(0..<m).contains(nx) { break }
                anotherGroud = board[ny][nx]
                if anotherGroud == groundNum { break }
                if anotherGroud != groundNum && anotherGroud != 0 {
                    if x-nx-1 >= 2 {
                        
                        bridges.append((groundNum,anotherGroud,x-nx-1))
                    }
                    
                    break
                }
            }
        } else if direction == 2 {
            while true {
                ny += 1
                if !(0..<n).contains(ny) { break }
                anotherGroud = board[ny][nx]
                if anotherGroud == groundNum { break }
                if anotherGroud != groundNum && anotherGroud != 0 {
                    if ny-y-1 >= 2 {
//                        print(y,x,groundNum,anotherGroud,ny-y-1)
                        bridges.append((groundNum,anotherGroud,ny-y-1))
                    }
                    break
                }
            }
            
        } else {
            while true {
                ny -= 1
                if !(0..<n).contains(ny) { break }
                anotherGroud = board[ny][nx]
                if anotherGroud == groundNum { break }
                if anotherGroud != groundNum && anotherGroud != 0 {
                    if y-ny-1 >= 2 {
                        bridges.append((groundNum,anotherGroud,y-ny-1))
                    }
                    break
                }
            }
        }
    }
    
    // 각 섬에서 바다로 향하는 좌표, 방향 설정
    for y in 0..<n {
        for x in 0..<m {
            if board[y][x] > 0 {
                let directions = getBridgeDirections(y: y, x: x)
                for direction in directions {
                    edges.append((y,x,direction))
                }
            }
        }
    }
    
    // 바다로 나갔을때 섬이 나오는지
    
    for edge in edges {
        makeBridge(edge.0, edge.1, board[edge.0][edge.1], edge.2)
    }
    bridges.sort(by: {$0.2 < $1.2})
    //print(bridges)

    func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    var parent = [Int](0...island)
    var cost = 0
    var line = 0
    for bridge in bridges {
        let now = bridge.0
        let move = bridge.1
        if find(now) != find(move) {
            //print(now,move,bridge.2)
            union(now, move)
            line += 1
            cost += bridge.2
        }
    }
    print(line != island-1 ? -1 : cost)
}
solution()
/*
 
 7 8
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 1
 1 1 1 1 1 1 1 1
 0 0 0 0 0 0 0 1
 1 0 0 0 0 0 0 1
 1 0 0 0 0 0 0 1
 1 0 1 1 1 1 1 1
 */

```
