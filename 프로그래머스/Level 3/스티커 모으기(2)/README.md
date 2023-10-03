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
