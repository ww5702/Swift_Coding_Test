dfs로 풀이해봤으나 실패   
dp?로 풀이해보자   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [(Int,Int)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append((input[0],input[1]))
    }
    
    
    var result = -1
    func dfs(_ idx: Int, _ sum: Int) {
        
        if idx > n { return }
        //print(idx, sum)
        result = max(result, sum)
        
        var day = 0
        for i in idx..<n {
            dfs(idx+day+board[i].0, sum+board[i].1)
            day += 1
        }
        
        return
    }
    
    
    for i in 0..<n {
        //print("시작",i, board[i].1)
        dfs(i+board[i].0, board[i].1)
    }
    
    print(result)
    
}

solution()
/*
 
 */


```
dp가 더 쉽고 빠르다.   
입력과 동시에 풀이를 진행하는데   
현재 날짜까지의 최대 효율을 그대로 가져오고,   
현재 날짜 + 상담에 걸리는시간이 아직 가능하다면   
max값으로 dp를 바꿔준다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: n+1)
    
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let t = input[0], p = input[1]
        dp[i+1] = max(dp[i+1], dp[i])
        
        if i+t < n+1 {
            dp[i+t] = max(dp[i+t], dp[i] + p)
            
        }
    }
    print(dp[n])
    
    
}

solution()
/*
 
 */


```
