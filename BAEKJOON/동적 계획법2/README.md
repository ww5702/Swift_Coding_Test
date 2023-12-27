# 조금 더 어려운 동적 계획법 문제를 풀어 봅시다.	
## 11066 파일 합치기   

2차원 배열로 dp를 구성한다.   
여기서 dp[i][j]는 i부터 j까지의 최소값이다.   
따라서 length를 1부터 k-1까지 준비한다.   
예를들어 length 2는   
40,30,30,50일때   
(40,30,30), (30,30,50)을 의미한다.   
mid는 i부터j까지 반복문으로 준비한다.     
점화식으로 다시 구성한다면   
dp[i][j] = min(dp[i][j], dp[i][mid]+dp[mid+1][j])이다.    
i부터mid까지의 최소합 + mid부터j까지의 최소합이 더 작으면 바꿔주는 점화식이다.   
만약 1부터2 + 3부터5까지의 최소합보다 1부터4 + 5의 최소합이 적으면 바꿔주는것이다.   
여기서 누적합을 더해주기 위해 sum[end]-sum[start-1]를 더해준다.   

```
import Foundation
func solution() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let k = Int(readLine()!)!
        var arr = readLine()!.split(separator: " ").map{Int($0)!}
        var sum = Array(repeating:0,count:k+1)
        var dp = Array(repeating:Array(repeating: 0, count: k+1),count:k+1)
        for i in 1...k {
            if i == 1 {
                sum[i] = arr[i-1]
            } else {
                sum[i] = sum[i-1]+arr[i-1]
            }
        }
        for length in 1..<k {
            for start in 1...(k-length) {
                let end = start+length
                dp[start][end] = Int.max
                for mid in start..<end {
                    
                    //print(start,end,mid)
                    dp[start][end] = min(dp[start][end], dp[start][mid]+dp[mid+1][end]+sum[end]-sum[start-1])
                }
            }
        }
        print(dp[1][k])
    }
}

solution()

```
## 11049 행렬 곱셈 순서
이 문제 또한 윗 문제처럼 mid값을 지정하여 풀이하는 방식으로 푼다.   
어차피 곱셈의 순서는 2,3,4 는 가능하나 1,3이나 1,4로 바로 넘어갈 수 없다.   
순서대로 곱셈이 가능하다는 행렬의 곱 법칙 때문이다.   
따라서 start = 0, end = 1부터 n까지이고   
start부터 end까지 mid를 움직여주면서 최소값을 구해준다.   
dp[0][4] = min(dp[0][4], dp[0][1부터3] + dp[1부터3][4])인 셈이다.   
여기서 중요한점은 해당값에서 행렬의 곱을 더해줘야하는데   
N * M * K라고 문제에서 지정해져있다.   
여기서 matrix[start][0] * matrix[start][1] * matrix[end][1]   
로 하게 되면 틀리게 된다.   
1부터 3, 4부터 5까지의 행렬을 곱하게 된다면   
1의 start * 3의 end * 5의 end를 곱해줘야 두 행렬의 곰세의 횟수가 이어진다.   
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: n)
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    //print(matrix)
    for i in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        matrix[i] = [value[0],value[1]]
    }
    for i in 1..<n {
        for start in 0..<n-i {
            let end = start+i
            dp[start][end] = Int.max
            for mid in start..<end {
                //print(start,mid,end)
                dp[start][end] = min(dp[start][end], dp[start][mid] + dp[mid+1][end] + (matrix[start][0] * matrix[mid][1] * matrix[end][1]))
            }
        }
    }
    print(dp[0][n-1])
}

solution()

```
## 1520 내리막 길
길찾기 문제라 bfs로 풀이해봤지만 시간초과   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n) = (input[0],input[1])
    var board = [[Int]]()
    for i in 0..<m {
        board.append([])
        board[i] = readLine()!.split(separator: " ").map{Int($0)!}
    }
    //print(board)
    var result = 0
    func bfs(_ x: Int, _ y: Int) {
        //print(x,y)
        if x == m-1 && y == n-1 {
            result += 1
            return
        }
        
        //상
        if x >= 1 {
            if board[x-1][y] < board[x][y] {
                bfs(x-1,y)
            }
        }
        
        //하
        if x < m-1 {
            if board[x+1][y] < board[x][y] {
                bfs(x+1,y)
            }
        }
        
        //좌
        if y >= 1 {
            if board[x][y-1] < board[x][y] {
                bfs(x,y-1)
            }
        }
        
        //우
        if y < n-1 {
            if board[x][y+1] < board[x][y] {
                bfs(x,y+1)
            }
        }
    }
    
    bfs(0,0)
    print(result)
}

solution()
```

dfs에 dp를 더해서 풀이할 수 있다.   
먼저 -1로 dp를 초기화하여 방문한 노드인지 아닌지 확인한다.   
확인한 노드가 미방문한 노드라면 0으로 정정후 상하좌우로 이동가능하고,   
이동할 수 있는 노드가 현재 노드보다 작다면 이동시킨다.   
그리고 제일 밑부터 0으로 초기화된 노드가 dp[y][x]에 저장되면서   
dp[0][0]으로 최종으로 저장된다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n) = (input[0],input[1])
    var board = [[Int]]()
    for i in 0..<m {
        board.append([])
        board[i] = readLine()!.split(separator: " ").map{Int($0)!}
    }
    //print(board)
    
    var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)
    
    let dy = [0,1,0,-1]
    let dx = [1,0,-1,0]
    
    func dfs(_ y: Int, _ x: Int) -> Int {
        if y == (m-1) && x == (n-1) { return 1 }
        
        if dp[y][x] == -1 {
            dp[y][x] = 0
            for dir in 0..<4 {
                let ny = y + dy[dir]
                let nx = x + dx[dir]
                //print(ny,nx)
                if (0 <= ny && ny <= m-1 && 0 <= nx && nx <= n-1) 
                    && board[y][x] > board[ny][nx] {
                    dp[y][x] += dfs(ny,nx)
                }
            }
        }
        //print(dp)
        return dp[y][x]
    }
    print(dfs(0,0))

}

solution()

```
## 2629 양팔저울
dp로 풀이하는 방식은 맞지만   
2차원 배열로 풀이한다.   
500g의 추 30개가 행으로   
추의 개수가 열로 들어간다.   
즉, 1개의 추로 만들수있는 무게가 행렬1에 들어가고    
2개의 추로 만들 수 있는 무게가 행렬2에 들어가고 이런 방식이다.   
만들 수 있는 무게는 3가지 경우이다.   
1. 추의 무게에 추가하기
2. 구슬쪽에 무게 추가하기
3. 어느곳도 추가하지 않기
이 모든 공식으로 적용시키면 n개의 추를 다 썼을때 만들 수 있는 무게가 나온다.
해당 값들을 출력해준다.
   
   
로 풀이했으나 계속해서 실패가 출력된다.   
이유가 모르겠어서 일단 코멘트 후 넘긴다.   
```
import Foundation
func solution() {
    let value = Int(readLine()!)!
    let list: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    let input = Int(readLine()!)!
    let check: [Int] = readLine()!.split(separator: " ").map{Int($0)!}

    // 추를 추가하지 않았을 경우
    // 추를 구슬쪽에 추가
    // 추를 무게쪽에 추가
    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: 15001), count: list.count+1)
    
    func checkOk(_ idx: Int, _ weight: Int) {
        guard !dp[idx][weight] else { return }
        
        dp[idx][weight] = true
        
        // 무게를 다 썼다.
        guard idx < list.count else { return }
        
        
        checkOk(idx+1, weight + list[idx])
        checkOk(idx+1, weight)
        checkOk(idx+1, abs(weight - list[idx]))
    }
    checkOk(0, 0)
    var result: [String] = []
    for i in 0..<input {
        if dp[list.count-1][check[i]] {
            result.append("Y")
        } else {
            result.append("N")
        }
    }
    print(result.joined(separator: " "))
}

solution()

```
## 2293 동전 1
해당 알고리즘은 밑의 경우를 이해만 할 수 있다면 쉽게 풀이 할 수 있다.   
  1  2  3  4  5     
1 1  1  1  1  1   
2 0  1  1  2  2   
총 1  2  2  3  3   
이렇게 경우의 수가 존재한다.   
1로 1 2 3 4 5원을 만드는 경우는 한가지씩 있다.   
2원으로 1은 만들 수 없고   
2는 0에서 2원을 더한 1가지가 있다.   
3은 1에서 2를 더해 1가지가 있고   
4는 1을 2개인 경우와 2가 하나인 경우에서 2를 더해 만들 수 있다.   
즉, 총 값인 dp[2]의 값을 그대로 dp[4]에 더한다는 의미이다.   

stride를 쓴 이유는 5원의 값어치의 동전은 4원까지는 쓸모가 없는 동전이기때문이다.   
stride안에 pow조건문을 사용하지 않으면 dp의 값이 2^31 값을 넘기는 경우가 있어   
런타임 에러가 발생한다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let(n,k) = (input[0],input[1])
    var coins: [Int] = []
    for _ in 0..<n {
        coins.append(Int(readLine()!)!)
    }
    var dp: [Int] = Array(repeating: 0, count: k+1)
    dp[0] = 1
    /*
     동전을 만드는 경우
     1 2 5원일때
     6원 = 5원+1원, 4원+2원, 1원+5원
     */
    
    for i in 0..<n {
        for j in stride(from: coins[i], through: k, by: 1) {
            // dp값이 2^31을 넘어가는 경우
            if dp[j]+dp[j-coins[i]] >= Int(pow(2.0, 31.0)) {
                dp[j] = 0
            } else {
                dp[j] += dp[j-coins[i]]
            }
            
            //print(dp)
        }
    }
    print(dp[k])
}

solution()

```
## 7579 앱
처음 cost[i]에서 i+1부터 n까지 cost를 더했을때    
m을 초과하지 않는 선에서 최저값을 갱신해주는 방법으로 처음 풀이해보았지만 실패하였다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var memory = readLine()!.split(separator: " ").map{Int($0)!}
    var cost = readLine()!.split(separator: " ").map{Int($0)!}
    
    var dp: [Int] = Array(repeating: Int.max, count: m+1)
    for i in 0..<n {
        dp[memory[i]] = min(dp[memory[i]],cost[i])
        var before = memory[i]
        var temp = memory[i]
        for j in i+1..<n {
            temp += memory[j]
            if temp > m { continue }
            //print(memory[i],memory[j])
            dp[temp] = min(dp[temp], (dp[before] + cost[j]))
            before = temp
            //print(dp)
        }
        //print(dp)
    }
    print(dp[m])
}

solution()

```
