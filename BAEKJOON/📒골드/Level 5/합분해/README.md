뭔가 딱봐도 dp를 사용해야할것만 같고, 규칙을 모를때는 2차원그래프로 그려보는게   
제일 빠르다.   

```
import Foundation
func solution(){
    let nk =  readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: k+1)
    for i in 1...k {
        dp[i][0] = 1
    }
    
    for i in 1...k {
        for j in 1...n {
            dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % 1_000_000_000
        }
    }
    
//    for i in 0...k {
//        print(dp[i])
//    }
    print(dp[k][n])
}

solution()
/*
   0 1 2 3 4 5 6 7 8
 0 0 0 0 0 0 0 0 0 0
 1 1 1 1 1 1 1 1 1 1
 2 1 2 3 4 5 6 7 8 9
 3 1 3 6 10
 
 
 2 = 0 0 2 x 3
     1 1 0 x 3
 3 = 0 0 3 = 3
     2 1 0
     2 0 1
     1 2 0
     1 0 2
     0 1 2
     0 2 1
     1 1 1 = 1
     9
 
 */

```
