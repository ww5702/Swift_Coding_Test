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
만약 1부터2 + 3부터5까지의 최소합보다 1부터4 + 5의 최소합이 적으면 바꿔주는것이다.   
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
                }
            }
        }
        print(dp[1][k])
    }
}

solution()

```
## 11049 행렬 곱셈 순서
이 문제 또한 윗 문제처럼 mid값을 지정하여 풀이하는 방식으로 푼다.   
어차피 곱셈의 순서는 2,3,4 는 가능하나 1,3이나 1,4로 바로 넘어갈 수 없다.   
순서대로 곱셈이 가능하다는 행렬의 곱 법칙 때문이다.   
따라서 start = 0, end = 1~n까지이고   
start~end까지 mid를 움직여주면서 최소값을 구해준다.   
dp[0][4] = min(dp[0][4], dp[0][1~3] + dp[1~3][4])인 셈이다.   
여기서 중요한점은 해당값에서 행렬의 곱을 더해줘야하는데   
N*M*K라고 문제에서 지정해져있다.   
여기서 matrix[start][0] * matrix[start][1] * matrix[end][1]   
로 하게 되면 틀리게 된다.   
1~3, 4~5까지의 행렬을 곱하게 된다면   
1의 start * 3의 end * 5의 end를 곱해줘야 두 행렬의 곰세의 횟수가 이어진다.   
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: n)
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    //print(matrix)
    for i in 0..<n {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        matrix[i] = [value[0],value[1]]
    }
    for i in 1..<n {
        for start in 0..<n-i {
            let end = start+i
            dp[start][end] = Int.max
            for mid in start..<end {
                //print(start,mid,end)
                dp[start][end] = min(dp[start][end], dp[start][mid] + dp[mid+1][end] + (matrix[start][0] * matrix[mid][1] * matrix[end][1]))
            }
        }
    }
    print(dp[0][n-1])
}

solution()

```
