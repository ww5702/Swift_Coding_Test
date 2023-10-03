스티커를 때는 경우가 2칸 전꺼를 더하면서 늘어나거나 / 한칸 전꺼를 그대로 가져오거나 라고 판단하여   
점화식을 이용해 풀이해보았다   
또한 원형으로 스티커가 이어져있으므로 홀수일때 맨 마지막 스티커는 땔수없다는 예외상황을 고려하여 풀이하였다.   

```
import Foundation

func solution(_ sticker:[Int]) -> Int{
    var dp: [Int] = Array(repeating: 0, count: sticker.count)
    dp[0] = sticker[0]
    dp[1] = sticker[1]
    // 2칸 전꺼에서 더하거나 or 한칸 전꺼에서 더하거나
    for i in 2..<sticker.count {
        dp[i] = max(dp[i-2]+sticker[i], dp[i])
    }
    //print(dp)
    if sticker.count % 2 != 0 {
        dp[sticker.count-1] -= sticker.last!
    }
    return dp.max()!
}
```
풀이 방식은 맞았지만 첫번째 스티커를 떄는경우와 두번째 스티커를 때는 경우로 나뉘어서 풀이했어야헀다.   
즉 dp가 2개 필요했다는 점   
```
import Foundation

func solution(_ sticker:[Int]) -> Int{
    if sticker.count <= 2 { return sticker.max()! }
    var dp1: [Int] = Array(repeating: 0, count: sticker.count)
    var dp2: [Int] = Array(repeating: 0, count: sticker.count)
    // 첫번째 스티커를 뜯었을경우
    dp1[0] = sticker[0]
    dp1[1] = sticker[0]
    // 첫번째 스티커를 뜯지 않았을경우
    dp2[0] = 0
    dp2[1] = sticker[1]
    
    for i in 2..<sticker.count {
        dp2[i] = max(dp2[i-2] + sticker[i], dp2[i-1])
        if i < sticker.count-1 {
            dp1[i] = max(dp1[i-2] + sticker[i], dp1[i-1])
        }
    }
    //print(dp1,dp2)
    var max1 = dp1.max()!, max2 = dp2.max()!
    return max1 > max2 ? max1 : max2
}
```
