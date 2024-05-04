dp로 풀이를 하는데   
20 밑인가 -> 싱글로 가능   
21-60인데 3의 배수인가 -> 싱글로 불가능하지만 트리플 한번만에 가능   
21-40인데 2의 배수인가 -> 싱글로 불가능하지만 더블 한번만에 가능   
불이라면 -> 한번만에 가능   
여기서부터는 2번만에 가능   
전부 아니면서 40이하라면 싱글 두번으로 가능   
51-70이라면 불+싱글로 가능   
나머지 70이하 (41~49)는 2,3번케이스에 + 싱글로 가능   

이 뒤는 71부터   
50 + [i] vs 60 + [i]중 작은값으로 처리   

```
import Foundation

func solution(_ target:Int) -> [Int] {
    var dp: [(Int,Int)] = Array(repeating: (100000,100000), count: target+1)
    dp[0] = (0,0)
    for i in 1...target {
        let triple = Double(i)/3.0
        let double = Double(i)/2.0
        // 싱글
        if (i <= 20) {
            dp[i] = (dp[0].0+1, dp[0].1+1)
        } else if ((21...60).contains(i) && (Double(Int(triple)) == triple)) {
        // 21~60이면서 3의 배수일때
            dp[i] = (1,0)
        } else if ((21...40).contains(i) && (Double(Int(double)) == double)) {
        // 21~40이면서 2의 배수일때
            dp[i] = (1,0)
        } else if i <= 40 {
        // 3,2의 배수가 아니면서 40 이하인수는 싱글 두번으로
            dp[i] = (2,2)
        } else if i == 50 {
            dp[i] = (1,1)
        } else if (51...70).contains(i) {
        // 50~70사이라면 불+싱글 한번
            dp[i] = (2,2)
        } else if i <= 70 {
        // 만약 41~49 라면 2,3번 케이스에 싱글 한번
            dp[i] = (2,1)
        } else {
        // 71부터는 50 + dp[21] 이거나 60 + dp[11]로 비교한다.
        // 80이라면 50 + dp[30] vs 60 + dp[20]이다.
            //print(i)
            let bullCase = (dp[i-50].0+1, dp[i-50].1+1)
            
            let tripleCase = (dp[i-60].0+1, dp[i-60].1)
            //print(bullCase, tripleCase)
            dp[i] = bullCase.0 != tripleCase.0 ? 
            bullCase.0 < tripleCase.0 ? 
            bullCase : tripleCase : 
            (bullCase.0, max(bullCase.1, tripleCase.1))
            
        }
    }
    //print(dp)
    
    
    return [dp[target].0, dp[target].1]
}
```
3중 if문은 다음과 같다.   
만약 던진 다트수의 총량이 같다면 bullsingle의 수가 큰것을   
만약 다르다면 더 적게 던진쪽의 값을 가져간다.   
```
if bullCase.0 == tripleCase.0 {
                dp[i] = (bullCase.0, max(bullCase.1, tripleCase.1))
            } else {
                if bullCase.0 < tripleCase.0 {
                    dp[i] = bullCase
                } else {
                    dp[i] = tripleCase
                }
            }
```
