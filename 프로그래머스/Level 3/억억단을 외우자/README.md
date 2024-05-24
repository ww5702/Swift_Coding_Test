먼저 약수의 개수를 구해준다.   
이는 에라토스테네스의 체와 같은 방식으로 구해준다.   
그리고 dp를 구현한다.   
dp[e] = arr[e]이다.   
그리고 index를 줄여가면서 arr[e-i]의 값이 dp[e]보다 작다면   
dp[e-i]의 값은 e-i가 되고, 아니라면 e가 된다.   

```
import Foundation

func solution(_ e:Int, _ starts:[Int]) -> [Int] {
    var arr = Array(repeating: 1, count: e+1)
    func isPrime(_ num: Int) {
        arr[0] = 0
        if num >= 2 {
            for i in 2...e {
                for j in 1...e/i {
                    arr[i*j] += 1
                }
            }
        }
    }
    
    isPrime(e)
    //print(arr)
    var dp = Array(repeating: 0, count: e+1)
    dp[e] = e
    for i in stride(from: e-1, through: 1, by: -1) {
        if arr[dp[i+1]] > arr[i] {
            dp[i] = dp[i+1]
        } else {
            dp[i] = i
        }
    }
    //print(dp)
    var result: [Int] = []
    for start in starts {
        result.append(dp[start])
    }
    return result
}
```
