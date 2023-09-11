```
import Foundation
/*
k칸 점프 -> k만큼 에너지소모
현재까지온 거리 x2 만큼 순간이동 -> 에너지소모 x
따라서 순간이동하는것이 더 효율적

순간이동은 에너지소모가 들지 않으니
2로 나눠진다면 계속해서 나눠주고
나눠지지 않을때는 최소 점프인 한칸씩만 점프하여 다시 반복한다.
*/
func solution(_ n:Int) -> Int 
{
    var ans:Int = 0
    var n = n
    while n > 0 {
        if n % 2 == 0 {
            n /= 2
        } else {
            n -= 1
            ans += 1
        }
    }
    return ans
}
```
