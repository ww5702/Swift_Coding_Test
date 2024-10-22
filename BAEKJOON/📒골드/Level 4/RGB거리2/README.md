각 1~3번까지의 문을 칠하면서 시작한다.   
그리고 dp를 3번 돌린다.   
전에 칠했던 칸과 다른값들중 최소값을 가져오면서 갱신한다.   
구한 dp값에서 처음 칠한 색과 다른 칸에서 값을 가져와 최솟값을 비교해본다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = [[0,0,0]]

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    var result = Int.max
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: n+1)
    let first = board[1]
    let temp = Int.max-10000
    
    func calcul() {
        dp = Array(repeating: Array(repeating: 0, count: 3), count: n+1)
        for i in 1...n {
            // 0번집은 1번집이나 2번집에서 값을 가져와야 한다.
            dp[i][0] = board[i][0] + min(dp[i-1][1], dp[i-1][2])
            dp[i][1] = board[i][1] + min(dp[i-1][0], dp[i-1][2])
            dp[i][2] = board[i][2] + min(dp[i-1][0], dp[i-1][1])
        }
    }
    
    
    // 각 문을 칠하면서 시작한다.
    for i in 0..<3 {
        // 각 문을 칠하면서 시작한다.
        if i == 0 {
            board[1] = [first[i],temp,temp]
        } else if i == 1 {
            board[1] = [temp,first[i],temp]
        } else if i == 2 {
            board[1] = [temp,temp,first[i]]
        }
        
        calcul()
//        for j in 0...n {
//            print(dp[j])
//        }
        // 마지막 n번째 칸에서 0번째 칸과 달라야 하니까
        if i == 0 {
            result = min(result,min(dp[n][1],dp[n][2]))
        } else if i == 1 {
            result = min(result,min(dp[n][0],dp[n][2]))
        } else if i == 2 {
            result = min(result,min(dp[n][0],dp[n][1]))
        }
    }
    print(result)
}

solution()
/*
 2번집은 1번과 색이 달라야한다.
 2번부터 1,3과 달라야한다
 3번부터 2,4과 달라야한다.
 
 
 n-1번집은 n과 1번과 색이 달라야 한다.
 n번집은 1번과 2번과 색이 달라야 한다
 
 */

```
