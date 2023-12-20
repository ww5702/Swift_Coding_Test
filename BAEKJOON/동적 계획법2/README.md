# 조금 더 어려운 동적 계획법 문제를 풀어 봅시다.	
## 11066 파일 합치기   

2차원 배열로 dp를 구성한다.   
여기서 dp[i][j]는 i부터 j까지의 최소값이다.   
따라서 length를 1부터 k-1까지 준비한다.   
예를들어 length 2는   
40,30,30,50일때   
(40,30,30), (30,30,50)을 의미한다.   
mid는 i부터j까지 반복문으로 준비한다.     
점화식으로 다시 구성한다면   
dp[i][j] = min(dp[i][j], dp[i][mid]+dp[mid+1][j])이다.    
i부터mid까지의 최소합 + mid부터j까지의 최소합이 더 작으면 바꿔주는 점화식이다.   
만약 1~2 + 3~5까지의 최소합보다 1~4 + 5의 최소합이 적으면 바꿔주는것이다.   
여기서 누적합을 더해주기 위해 sum[end]-sum[start-1]를 더해준다.   

```
import Foundation
func solution() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let k = Int(readLine()!)!
        var arr = readLine()!.split(separator: " ").map{Int($0)!}
        var sum = Array(repeating:0,count:k+1)
        var dp = Array(repeating:Array(repeating: 0, count: k+1),count:k+1)
        for i in 1...k {
            if i == 1 {
                sum[i] = arr[i-1]
            } else {
                sum[i] = sum[i-1]+arr[i-1]
            }
        }
        for length in 1..<k {
            for start in 1...(k-length) {
                let end = start+length
                dp[start][end] = Int.max
                for mid in start..<end {
                    
                    //print(start,end,mid)
                    dp[start][end] = min(dp[start][end], dp[start][mid]+dp[mid+1][end]+sum[end]-sum[start-1])
                    /*
                     1 3 = 1 1 + 2 3 + 3 - 0
                     0 + 22 + 25
                     */
                }
            }
        }
        print(dp[1][k])
    }
}

solution()

```
