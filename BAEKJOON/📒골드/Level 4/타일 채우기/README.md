ㅡㅡ  ㅣㅣ ㅡㅡ   
ㅣㅣ  ㅡㅡ  ㅡㅡ   
         ㅡㅡ   
위의 3개 문양이 n이 2일때 만들 수 있는 경우의 수다   
반대로 1이나 3등 홀수일때는 만들수 있는 모양이 없다   
그렇다면 n이 4라면 어떻게 될까   
ㅡㅡ   
||   
이 문양으로 위 3개를 만들수 있고   
||   
ㅡㅡ   
이 문양으로 위 3개를 만들 수 있고   
ㅡㅡ   
ㅡㅡ   
ㅡㅡ   
이 문양으로 위 3개를 만들 수 있어서   
9개가 확보가 된다.   
그리고 특별하게 4개일때   
ㅡㅡㅡ     
|ㅡㅡ|      
이 문양과   
|ㅡㅡ|   
ㅡㅡㅡ   
이 문양이 추가가 된다.   
해당 과정을 점화식으로 풀이를 하면 dp값이 나온다.   

```      
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 31)
    dp[0] = 1
    dp[2] = 3
    //dp[2] = 3
    //dp[3] = 0
    //dp[4] = 11
    // dp[4] = dp[4-2]x3 + dp[5]*2
    //dp[5] = 0
    // dp[6] = dp[6-2]x3 + dp[6-4]x2 + dp[6-6]x2
    
    for i in stride(from: 4, through: n, by: 1) {
        dp[i] = dp[i-2]*3
        for j in stride(from: 4, through: i, by: 2) {
            dp[i] += dp[i-j]*2
        }
    }
    print(dp[n])
}

solution()
/*
 
 */

```
