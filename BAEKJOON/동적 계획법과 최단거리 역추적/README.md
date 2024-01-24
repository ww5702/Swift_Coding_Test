# 지금까지는 최솟값, 최댓값, 최단거리만 찾았습니다. 이번에는 실제 최적해와 최단경로를 찾아 봅시다.	

## 12852 1로 만들기 2
bfs로 풀이하면서 dp와 record 두개의 배열을 이용해 과정과 횟수를 기록하려 했으나   
메모리초과   
```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var dp: [Int] = Array(repeating: Int.max, count: n+1)
    var record: [[Int]] = Array(repeating: [], count: n+1)
    var needToVisited: [Int] = []
    var idx = 0
    func bfs(_ num: Int) {
        needToVisited.append(num)
        dp[num] = 0
        record[num].append(num)
        
        while needToVisited.count > idx {
            let cur = needToVisited[idx]
            idx += 1
            
            if cur % 3 == 0 {
                if dp[cur/3] > dp[cur] + 1 {
                    dp[cur/3] = dp[cur] + 1
                    needToVisited.append(cur/3)
                    record[cur/3] = record[cur]
                    record[cur/3].append(cur/3)
                }
            }
            if cur % 2 == 0 {
                if dp[cur/2] > dp[cur] + 1 {
                    dp[cur/2] = dp[cur] + 1
                    needToVisited.append(cur/2)
                    record[cur/2] = record[cur]
                    record[cur/2].append(cur/2)
                }
            }
            if cur > 1 {
                if dp[cur-1] > dp[cur] + 1 {
                    dp[cur-1] = dp[cur] + 1
                    needToVisited.append(cur-1)
                    record[cur-1] = record[cur]
                    record[cur-1].append(cur-1)
                }
            }
            
        }
        
        
    }
    bfs(n)
    //print(dp)
    print(dp[1])
    print(record[1].map{String($0)}.joined(separator: " "))
}
solution()
```
dp를 횟수를 나타내는 cnt와 그 전에 어디였는지인 before를 나눠 만들 수 있었다.   
배열을 하나로 줄여 메모리 또한 줄일 수 있다.   

```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var dp = Array(repeating: (cnt: Int.max, before: 0), count: n+1)
    dp[0] = (0,0)
    //print(dp)
    for i in 1...n {
        dp[i] = (dp[i-1].cnt + 1, i - 1)
        
        if i % 2 == 0 && i >= 2 {
            if dp[i].cnt > dp[i/2].cnt + 1 {
                dp[i] = (dp[i/2].cnt + 1, i / 2)
            }
        }
        
        if i % 3 == 0 && i >= 3 {
            if dp[i].cnt > dp[i/3].cnt + 1 {
                dp[i] = (dp[i/3].cnt + 1, i / 3)
            }
        }
    }
    //print(dp)
    var answer = [Int]()
    print(dp[n].cnt - 1)
    while n >= 1 {
        answer.append(n)
        n = dp[n].before
    }
    print(answer.map{String($0)}.joined(separator: " "))
}
solution()
```
## 14002 가장 긴 증가하는 부분 수열4
인덱스가 1000 이하라 가장 쉬운 LIS로 풀이가 가능하다.   
해당 방법으로 LIS를 구하게 되면 이제 경로를 찾는 반복문을 실행할 차례이다.   dp배열을 역으로 순환하면서 dp.max!값과 같다면 append,   
dp.max값 -1, 다시 dp.max-1과 같다면 append를 실행하면   
경로를 찾을 수 있다.   
```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var dp: [Int] = Array(repeating: 1, count: n)
    for i in 0..<n {
        for j in 0..<i {
            if arr[i] > arr[j] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    var result = dp.max()!
    var list: [Int] = []
    print(result)
    
    for i in stride(from: n-1, through: 0, by: -1) {
        if dp[i] == result {
            list.append(arr[i])
            result -= 1
        }
    }
    print(list.reversed().map{String($0)}.joined(separator: " "))
}
solution()
```

## 14003 가장 긴 증가하는 부분 수열5
LIS를 이분탐색으로 풀이하여 O(nlogn)으로 풀이한다음   
14002와 같은 방식으로 경로를 찾아내었다.   
풀이 방식은 맞는것 같지만 같은 숫자가 여러개일수도 있고,   
firstIndex라는 방식 자체가 메모리를 많이 차지하여 시간초과가 발생   

```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var result: [Int] = []
    result.append(arr[0])
    var list = Array(repeating: 1, count: n)
    for i in 1..<arr.count {
        if arr[i] > result.last! {
            list[i] = max(list[i], list[arr.firstIndex(of: result.last!)!]+1)
            result.append(arr[i])
            continue
        }
        
        var start = 0
        var end = result.count
        while start <= end {
            let mid = (start+end)/2
            if result[mid] < arr[i] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        result[start] = arr[i]
        list[i] = start
    }
    //print(list)
    var cnt = result.count
    print(cnt)
    var answer: [Int] = []
    
    for i in stride(from: n-1, through: 0, by: -1) {
        if list[i] == cnt-1 {
            answer.append(arr[i])
            cnt -= 1
        }
    }
    print(answer.reversed().map{String($0)}.joined(separator: " "))
    
}
solution()
```
list에 현재 result.count를 차레차례 넣어주면   
같은 값이 입력된다는 사실을 찾아내었다.   

```
import Foundation
func solution(){
    var n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var result: [Int] = []
    result.append(arr[0])
    var list = Array(repeating: 1, count: n)
    for i in 0..<arr.count {
        if arr[i] > result.last! {
            result.append(arr[i])
            list[i] = result.count - 1
            continue
        }
        
        var start = 0
        var end = result.count - 1
        while start <= end {
            let mid = (start+end)/2
            if result[mid] >= arr[i] {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        result[start] = arr[i]
        list[i] = start
    }
    //print(list)
    var cnt = result.count
    print(cnt)
    var answer: [Int] = []
    
    for i in stride(from: n-1, through: 0, by: -1) {
        if list[i] == cnt-1 {
            answer.append(arr[i])
            cnt -= 1
        }
    }
    print(answer.reversed().map{String($0)}.joined(separator: " "))
    
}
solution()
```
## 9252 LCS 2
최장 공통 부분 수열이다.   
LIS와 비슷한 느낌으로 풀이할 수 있다.   
index가 1000개 이하이므로 이중반복문으로 풀이할 수 있다.   
해당글자까지 갔을때 만약 y,x값이 같다면 + 1,   
다르다면 x-1, y-1중 더 큰 값을 계승한다.   
```
import Foundation
func solution(){
    var str1 = readLine()!.map{$0}
    var str2 = readLine()!.map{$0}
    //print(str1,str2)
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: str1.count+1), count: str2.count+1)
    for i in 1...str2.count {
        for j in 1...str1.count {
            dp[i][j] = dp[i-1][j]
            if str2[i-1] == str1[j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
            } else {
                if dp[i-1][j] > dp[i][j-1] {
                    dp[i][j] = dp[i-1][j]
                } else {
                    dp[i][j] = dp[i][j-1]
                }
            }
        }
    }
    var length = dp[str2.count].max()!
    print(length)
//    for i in 0...str1.count {
//        print(dp[i])
//    }
    
    var y = str2.count, x = str1.count
    var answer: [Character] = []
    

    while length != 0 {
        if dp[y-1][x] == dp[y][x] {
            y -= 1
            continue
        }
        if dp[y][x-1] == dp[y][x] {
            x -= 1
            continue
        }
        answer.append(str1[x-1])
        y -= 1
        x -= 1
        length -= 1
    }
    if !answer.isEmpty {
        print(String(answer.reversed()))
    }
    
}
solution()
```
## 2618 경찰차
bfs로 순간순간마다 거리의 차이를 계산하여서 짧은 차를 배정하였다.   
하지만 시간초과가 발생하였다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let w = Int(readLine()!)!
    var accident: [(Int,Int)] = []
    for _ in 0..<w {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        accident.append((input[0], input[1]))
    }
    //print(accident)
    var first = (0,0)
    var second = (n-1,n-1)
    var cnt = 0
    
    func bfs(_ goalY: Int, _ goalX: Int, _ ny: Int, _ nx: Int) -> [Int] {
        var board = Array(repeating: Array(repeating: 1000000, count: n), count: n)
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var result: [Int] = []
        var idx = 0
        var Q: [(Int,Int)] = []
        Q.append((ny,nx))
        visited[ny][nx] = true
        board[ny][nx] = 0
        
        let dy = [1,-1,0,0]
        let dx = [0,0,1,-1]
        
        while Q.count > idx{
            let cur = Q[idx]
            if cur.0 == goalY && cur.1 == goalX { break }
            idx += 1
            for i in 0..<4 {
                let nowY = cur.0 + dy[i]
                let nowX = cur.1 + dx[i]
                
                if (0..<n).contains(nowY) && (0..<n).contains(nowX) && !visited[nowY][nowX] {
                    if board[nowY][nowX] > board[cur.0][cur.1] + 1 {
                        visited[nowY][nowX] = true
                        board[nowY][nowX] = board[cur.0][cur.1] + 1
                        Q.append((nowY,nowX))
                    }
                }
            }
        }
        result.append(board[goalY][goalX])
        result.append(goalY)
        result.append(goalX)
        return result
    }
    
    var value: [Int] = []
    
    for a in accident {
        var goalY = a.0-1
        var goalX = a.1-1
        
        var firstCar = bfs(goalY,goalX,first.0,first.1)
        var secondCar = bfs(goalY,goalX,second.0,second.1)
        //print(firstCar, secondCar)
        
        if firstCar[0] <= secondCar[0] {
            cnt += firstCar[0]
            first = (firstCar[1], firstCar[2])
            value.append(1)
        } else {
            cnt += secondCar[0]
            second = (secondCar[1], secondCar[2])
            value.append(2)
        }
    }
    print(cnt)
    for v in value {
        print(v)
    }
}
solution()
```
사실 장애물이 없어서 y,x - 사건장소 하면 해당장소까지의 거리가 나오니   
해당 방식으로 계산을 해보았다.   
당연히 틀렸다ㅋㅋ   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let w = Int(readLine()!)!
    var accident: [(Int,Int)] = []
    for _ in 0..<w {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        accident.append((input[0], input[1]))
    }
    //print(accident)
    var first = (0,0)
    var second = (n-1,n-1)
    var cnt = 0
    var result: [Int] = []
    
    for a in accident {
        let curY = a.0
        let curX = a.1
        
        if (abs(first.0 - curY) + abs(first.1 - curX)) <= (abs(second.0 - curY) + abs(second.1 - curX)) {
            cnt += (abs(first.0 - curY) + abs(first.1 - curX))
            first = (curY,curX)
            result.append(1)
        } else {
            cnt += (abs(second.0 - curY) + abs(second.1 - curX))
            second = (curY,curX)
            result.append(2)
        }
    }
    print(cnt)
    for r in result {
        print(r)
    }
    
}
solution()
```
문제에서 제시한 조건에 따라서   
경찰차 A가 해결하려 움직이거나 / 경찰차 B가 해결하려 움직이거나 2가지 방법이 있다.   
따라서 dp[][]를 dp[A가 움직인 경우][B가 움직인경우]로 분리하여 풀이해야한다.   
경찰차 A,B의 현재 위치를 A,B, 다음 사건을 next라고 한다면   
dp[A,B] = min(dp[next][B] + dist(A,X) , dp[A][next] + dist(B,X)) 이다.   
예를들어 이동하려는 케이스가 3번 사건 (2,3)이다.   
그렇다면 A에서 이동하는 경우, B에서 이동하는 경우가 있다.   
그리고 A가 사건1,2번에 있거나 B가 사건1,2에 있거나의 경우가 있다.   
dp[2][0] = min(dp[3][0] + dist(2,3,A경찰차) , dp[2][3] + dist(0,3,B경찰차)   
dp[0][2] = min(dp[0][3] + dist(2,3,B경찰차) , dp[3][2] + dist(0,3,A경찰차)   
로 나눌 수 있다.   
그렇다면   
dp[2][0] = min(0 + 5 , 0 + 3)   
dp[0][2] = min(0 + 5 , 0 + 3)   
과 같이 된다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let w = Int(readLine()!)!
    var accident: [(Int,Int)] = []
    for _ in 0..<w {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        accident.append((input[0], input[1]))
    }
    //print(accident)
    var dp = Array(repeating: Array(repeating: 0, count: w+1), count: w+1)
    for i in 1...w {
        let next = w - i + 1
        for j in 0..<w-i {
            //print(w-i, j, next,j, w-i,next, w-i,next, j,next)
            dp[w-i][j] = min(dp[next][j] + dist(w-i, next, false) , dp[w-i][next] + dist(j, next, true))
            dp[j][w-i] = min(dp[j][next] + dist(w-i, next, true) , dp[next][w-i] + dist(j, next, false))
        }
    }
//    for i in 0...w {
//        print(dp[i])
//    }
    print(min(dp[0][1] + dist(0,1,true) , dp[1][0] + dist(0,1,false)))
    trace(0, 0)
    
    
    func dist(_ a: Int, _ b: Int, _ type: Bool) -> Int {
        var A = (0,0)
        if a == 0 {
            if !type {
                A = (1,1)
            } else {
                A = (n,n)
            }
        } else {
            A = accident[a-1]
        }
        let B = accident[b-1]
        return abs(A.0-B.0) + abs(A.1-B.1)
    }
    
    func trace(_ a: Int, _ b: Int) {
        let next = max(a,b) + 1
        guard next <= w else { return }
        if dp[a][next] + dist(b,next,true) > dp[next][b] + dist(a,next,false) {
            print("1")
            trace(next, b)
        } else {
            print("2")
            trace(a, next)
        }
    }
}
solution()
```
솔직히 너무 복잡한 동적계획법이었다.   

## 13913 숨박꼭질 4
-1로 초기화된 배열을 이동할때마다 해당 값으로 바꿔주고,   
한 서클을 돌렸다면 cnt를 +1 해줌으로서 횟수를 셀 수 있다.   
k를 방문한 순간 탈출하도록 코드를 짜서 횟수를 구하고,   
result[k]를 역으로 찾으면서 -1이 될때까지 반복문을 실행하여 경로를 찾아낸다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,k) = (input[0],input[1])
    var result = Array(repeating: -1 , count: 100001)
    var visited = Array(repeating: false, count: 100001)
    var q: [Int] = []
    var cnt = 0
    
    func bfs(_ start: Int) {
        q.append(start)
        visited[start] = true
        
        while !visited[k] {
            cnt += 1
            for _ in 0..<q.count {
                let cur = q.removeFirst()
                for i in [cur+1, cur-1, cur*2] {
                    if 0...100000 ~= i && !visited[i]{
                        q.append(i)
                        result[i] = cur
                        visited[i] = true
                    }
                }
            }
            
        }
    }
    
    bfs(n)
    print(cnt)
    var value = result[k]
    var ans: [Int] = []
    ans.append(k)
    while value != -1 {
        ans.append(value)
        value = result[value]
        
    }
    print(ans.reversed().map{String($0)}.joined(separator: " "))
    
}
solution()


```
## 9019 DSLR
필요한 기능들을(DSLR)을 넣어 bfs로 풀이하였다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        var (num1,num2) = (input[0],input[1])
//        var arr = String(input[0]).map{Int(String($0))!}
//        var arr2 = String(input[1]).map{Int(String($0))!}
        var result: [String] = Array(repeating: "", count: 10001)
        var visited = Array(repeating: false, count: 10001)
        var q: [Int] = []
        var idx = 0
        //print(arr1,arr2)
        
        func bfs(_ start: Int) {
            visited[start] = true
            q.append(start)
            
            while !visited[num2] {
                let cur = q[idx]
                idx += 1
                
                let D = (2*cur) % 10000
                var S = cur-1
                if S == 0 {
                    S = 9999
                }
                var arr = String(cur).map{Int(String($0))!}
                if arr.count <= 3 {
                    for _ in 0..<4-arr.count {
                        arr.append(0)
                    }
                    arr.reverse()
                }
                var Ltemp = arr[0]
                for i in 0..<3 {
                    arr[i] = arr[i+1]
                }
                arr[3] = Ltemp
                var L = Int(arr.map{String($0)}.joined(separator: ""))!
                
                
                arr = String(cur).map{Int(String($0))!}
                if arr.count <= 3 {
                    for _ in 0..<4-arr.count {
                        arr.append(0)
                    }
                    arr.reverse()
                }
                var Rtemp = arr[3]
                for i in stride(from: 3, through: 1, by: -1) {
                    arr[i] = arr[i-1]
                }
                arr[0] = Rtemp
                var R = Int(arr.map{String($0)}.joined(separator: ""))!
                
                // D
                if !visited[D] {
                    q.append(D)
                    visited[D] = true
                    result[D] = result[cur] + "D"
                }
                // S
                if !visited[S] {
                    q.append(S)
                    visited[S] = true
                    result[S] = result[cur] + "S"
                }
                // L
                if !visited[L] {
                    q.append(L)
                    visited[L] = true
                    result[L] = result[cur] + "L"
                }
                // R
                if !visited[R] {
                    q.append(R)
                    visited[R] = true
                    result[R] = result[cur] + "R"
                }
            }
            
        }
        
        bfs(num1)
        print(result[num2])
    }
}
solution()


```
풀이방식은 똑같으나 저장을 숫자로 한 뒤 해당 숫자가 나왔을때   
숫자를 cmd배열을 돌면서 해당 명령어들을 다시 출력해준다.    
그리고 l과 r을 배열로 돌려 하는게 아닌 %1000 * 10 + num/1000과   
%10 * 1000 + self/10 으로 수행 할 수 있다.   
```
import Foundation

let cmd = ["","D","S","L","R"]
extension Int {
    var d: Int {
        return self * 2 % 10000
    }
    var s: Int {
        return self - 1 < 0 ? 9999 : self - 1
    }
    var l: Int {
        return (self % 1000) * 10 + self / 1000
    }
    var r: Int {
        return (self % 10) * 1000 + self / 10
    }
}

func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let a = input[0], b = input[1]
        var visited = [Bool](repeating: false, count: 10_001)
        visited[a] = true
        var q = [(a, 0)]
        var idx = 0
        
        while q.count > idx {
            let num = q[idx].0
            let command = q[idx].1
            visited[num] = true
            
            if num == b {
                var answer = ""
                for i in String(command) {
                    answer += cmd[Int(String(i))!]
                }
                print(answer)
                break
            }
            
            for (idx, n) in [num.d,num.s,num.l,num.r].enumerated() {
                if !visited[n] {
                    visited[n] = true
                    q.append((n,command * 10 + idx + 1))
                }
            }
            idx += 1
        }
    }
}
solution()


```
