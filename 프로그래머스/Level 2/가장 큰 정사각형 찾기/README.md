1행 1열부터 시작하여 반복문을 진행한다.   
만약 해당 행렬의 값이 1이고, (i-1)(j-1) (i)(j-1) (i-j)(j)의 값들이 다 1이라면 정사각형이라 판단하여   
해당 행열의 값을 (해당행렬값) + (앞 3개 행렬의 최소값) 을 더해준다   
만약 위 값들이   
2 2   
2 1   
이 나온다면 그 전까지 정사각형으로 이루어진 값들이 계속 내려왔다는 뜻이 되고,   
저 '1' 위치의 값은 3이 된다.   
그리고 이는 위의 9칸이 1이었다는 뜻을 의미한다.   
하지만 행과 열이 1행밖에 없는 경우는 구분하지 못하니 1인 경우를 따로 구현해줘야한다.   

```
import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var answer:Int = 0
    var dp = board
    if board.count == 1 || board[0].count == 1 {
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                answer = dp[i][j] > answer ? dp[i][j] : answer
            }
        }
    } else {
        for i in 1..<board.count {
            for j in 1..<board[i].count {
                // 1로 되어있어야 정사각형이 이어질 수 있다
                if dp[i][j] == 1 {
                    dp[i][j] = dp[i][j] + min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1])
                    answer = dp[i][j] > answer ? dp[i][j] : answer
                }
            }
        }
    }
    return answer*answer
}
```
