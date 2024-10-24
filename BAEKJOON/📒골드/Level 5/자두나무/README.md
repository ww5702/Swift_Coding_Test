dp문제이다.   
dp[i][w]는 예를들어 2번째나무의 1번째 남은 횟수라고 했을때  
plus 는 나무의 위치가 같은지 다른지이다   

1번째나무의 옆나무에서 옮긴후+1, 1번째나무에서 안옮기고 +1인지를 확인해준다.   

```
import Foundation
func solution(){
    let tw = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (t,w) = (tw[0],tw[1])
    var dp = Array(repeating:Array(repeating:0,count:w+1),count:t+1)
    var result = -1
    for i in 1...t {
        let now = Int(readLine()!)! - 1
        for w in 0...w {
            let plus = (now == (w%2) ? 1 : 0)
            dp[i][w] = max(dp[i][w], w > 0 ? dp[i-1][w-1]+plus : dp[i-1][w] + plus, dp[i-1][w] + plus)
            result = max(result, dp[i][w])
            
        }
    }
    print(result)
    
}

solution()
/*
 7 2
 2
 1
 1
 2
 2
 1
 1
 */

```
