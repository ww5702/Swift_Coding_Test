dp로 누적합을 이용하여 i-1 j , i-1 j-1, i j-1이 같은 숫자라면 정사각형으로   
1씩 증가시켜 제일 큰 정사각형을 구하는것은 알고있었다.   
여기서 생각해줘야할 부분은   
1 4 와 같이 길이 한곳이 1인경우로 결과는 무조건1을 반환해야할때   
그리고 board가 전부 0이라서 값이 0인 경우이다.   

하지만 정답률 84% 실패   
이유는 아직 찾지 못하였다.   

```
import Foundation
func solution() {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        let input = Array(readLine()!).map{Int(String($0))!}
        board[i] = input
    }
    
    var dp = board
    var maxValue = 0
    
    if n == 1 || m == 1 {
        var result = 0
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 1 {
                    result = 1
                    break
                }
            }
        }
        print(result)
    } else {
        for i in 1..<n {
            for j in 1..<n {
                if board[i][j] == 1 {
                    dp[i][j] += min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
                    maxValue = max(maxValue, dp[i][j])
                }
            }
        }
        //print(dp)
        print(maxValue*maxValue)
    }
    
    
}


solution()
/*
 */

```
