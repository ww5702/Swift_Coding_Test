보자마자 dp문제인것은 알 수 있었다.   
하지만 3퍼에서 런타임 에러   

```
import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (input[0],input[1])
    var list: [Int] = []
    var dp = Array(repeating: Int.max, count: k+1)
    dp[0] = 0
    for _ in 0..<n {
        let input = Int(readLine()!)!
        list.append(input)
        dp[input] = 1
    }
    
    for i in 1...k {
        //print(i)
        for j in 0..<n {
            if i >= list[j] {
                dp[i] = min(dp[i], dp[i-list[j]]+1)
            }
            
        }
        //print(dp)
    }
    print(dp[k] == Int.max ? -1 : dp[k])
}


solution()
/*

 */

```
