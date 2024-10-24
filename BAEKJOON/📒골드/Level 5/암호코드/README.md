dp로 풀이를 한다   
25114일때   
첫번째글자는 0이 아닌이상 1로 시작한다.   
두번째글짜부터 만약 0이라면 앞이 0이거나 30 이상이 아닌이상   
dp[i-1]를 그대로 가져온다.   
그리고 25처럼 10 이상 26 이하인 경우가 있을 수 있기에   
dp[i-2] + dp[i]의 경우의 수를 더해준다.   

```
import Foundation
func solution(){
    let n = [0]+readLine()!.map{Int(String($0))!}
    var dp = Array(repeating: 0, count: n.count+1)
    var list = ["."]
    for i in 65...90 {
        list.append(String(UnicodeScalar(UInt32(i))!))
    }
    dp[0] = 1
    for i in 1..<n.count {
        //print(dp)
        if i == 1 {
            if n[i] == 0 {
                dp[n.count] = 0
                break
            } else {
                dp[i] = 1
            }
            continue
        }
        
        // 앞이 0이었다면 00은 불가능 21까지 Z이니까 30보다 크면 불가능
        if n[i] == 0 {
            if n[i-1] == 0 || n[i-1] > 2 {
                dp[n.count] = 0
                break
            }
        } else {
            dp[i] = (dp[i] + dp[i-1]) % 1_000_000
        }
        
        // 10~26이라면 경우의 수가 늘어난다 113 이었을때 1 + 13 이 가능하므로 i + i-2인것이다.
        if Int(String(n[i-1]) + String(n[i]))! <= 26 && Int(String(n[i-1]) + String(n[i]))! >= 10 {
            dp[i] = (dp[i] + dp[i-2]) % 1_000_000
        }
        
    }
    
    print(dp[n.count-1])
}

solution()
/*
 */

```
