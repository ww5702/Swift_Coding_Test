추가, 삭제, 교환만 가능하다했을때   
아무것도 없을때 saturday, sunday를 만드려면 +1씩 늘어나야한다.   
따라서 0열과 0행을 전부 +1씩 증가시켜준다.   
s가 만들어진 상태에서 s가 되려면 바꿀 필요가 없기에 dp[i-1][j-1]을 그대로 가져온다.   
만약 다르다면 추가, 삭제, 교환중 최소값을 가져온다   

```
import Foundation
func solution(){
    let a = Array(readLine()!)
    let b = Array(readLine()!)
    var dp = Array(repeating: Array(repeating: Int.max, count: b.count+1), count: a.count+1)
    dp[0][0] = 0
    for i in 1...a.count {
        dp[i][0] = i
    }
    for i in 1...b.count {
        dp[0][i] = i
    }
    
    //print(dp)
    for i in 1...a.count {
        for j in 1...b.count {
            if a[i-1] == b[j-1] {
                dp[i][j] = dp[i-1][j-1]
            } else {
                dp[i][j] = 1 + min(dp[i][j-1], dp[i-1][j], dp[i-1][j-1])
            }
        }
    }
    print(dp[a.count][b.count])
}
solution()


/*
cat
cut
 
sunday
saturday
 */


```
