흔한 dfs문제라고 생각했다.   
하지만 'ㅗ' 모양 테트리스를 더할 수 없다는 문제를 발견하게되었다.   
따라서 set로 바꾸고 sum을 배열로 바꿔 모든 변수들을 꺼내 y,x좌표를 증가시켜보았다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var map: [[Int]] = Array(repeating: [], count: n)
    var result = 0
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        map[i] = input
    }
    print(map)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    for i in 0..<n {
        for j in 0..<m {
            visited[i][j] = true
            dfs(i, j, 1, map[i][j])
            visited[i][j] = false
        }
    }
    
    print(result)
    
    
    func dfs(_ y: Int, _ x: Int, _ depth: Int, _ sum: Int) {
        if depth == 4 {
            result = max(result, sum)
            return
        }
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            if (0..<n).contains(ny) && (0..<m).contains(nx) {
                if (!visited[ny][nx]) {
                    visited[ny][nx] = true
                    dfs(ny, nx, depth+1, sum+map[ny][nx])
                    visited[ny][nx] = false
                }
            }
        }
    }
}
solution()

```
하지만 너무 많은 반복문을 돌게 되므로 시간초과가 발생   

```
import Foundation
struct Point {
    var y = 0
    var x = 0
}
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var map: [[Int]] = Array(repeating: [], count: n)
    var result = 0
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        map[i] = input
    }
    //print(map)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    for i in 0..<n {
        for j in 0..<m {
            visited[i][j] = true
            dfs(i, j, [(i,j)])
            visited[i][j] = false
        }
    }
    
    print(result)
    
    
    func dfs(_ y: Int, _ x: Int, _ sum: [(Int,Int)]) {
        if sum.count == 4 {
            var temp = 0
            for s in sum {
                temp += map[s.0][s.1]
            }
            result = max(result, temp)
            return
        }
        for index in sum {
            let nowY = index.0
            let nowX = index.1
            
            for i in 0..<4 {
                let ny = nowY + dy[i]
                let nx = nowX + dx[i]
                if (0..<n).contains(ny) && (0..<m).contains(nx) {
                    if (!visited[ny][nx]) {
                        visited[ny][nx] = true
                        dfs(ny, nx , sum+[(ny,nx)])
                        visited[ny][nx] = false
                    }
                }
            }
        }
    }
}
solution()
```
따라서 'ㅗ' 모양을 제외하고는 dfs로 풀이하고,   
'ㅗ' 모양은 따로 좌표를 4개 만들어줘   
'ㅗ' 'ㅜ' 'ㅓ' 'ㅏ' 모양을 만들어보고 따로 계산해주었다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var map: [[Int]] = Array(repeating: [], count: n)
    var result = 0
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        map[i] = input
    }
    //print(map)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    // ㅗ 모양
    let fy: [[(Int,Int)]] = [[(0,0),(0,1),(0,2),(1,1)],
                             [(0,0),(1,0),(2,0),(1,1)],
                             [(0,0),(0,1),(0,2),(-1,1)],
                             [(0,0),(0,1),(-1,1),(1,1)]]
    
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    for i in 0..<n {
        for j in 0..<m {
            visited[i][j] = true
            dfs(i, j, 1, map[i][j])
            visited[i][j] = false
            let fyValue = checkFy(i, j)
            //print(fyValue)
            result = max(fyValue,result)
        }
    }
    
    print(result)
    
    
    func dfs(_ y: Int, _ x: Int, _ depth: Int, _ sum: Int) {
        if depth == 4 {
            result = max(result, sum)
            return
        }
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            if (0..<n).contains(ny) && (0..<m).contains(nx) {
                if (!visited[ny][nx]) {
                    visited[ny][nx] = true
                    dfs(ny, nx, depth+1, sum+map[ny][nx])
                    visited[ny][nx] = false
                }
            }
        }
    }
    
    func checkFy(_ y: Int, _ x: Int) -> Int{
        var sum = 0
        for i in 0..<4 {
            let now = fy[i]
            var temp = 0
            var isOk = true
            for j in now {
                let ny = y + j.0
                let nx = x + j.1
                if (0..<n).contains(ny) && (0..<m).contains(nx) {
                    temp += map[ny][nx]
                } else {
                    isOk = false
                    continue
                }
            }
            
            if isOk {
                sum = max(temp, sum)
            }
            
        }
        return sum
    }
}
solution()

```
