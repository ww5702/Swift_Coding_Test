정확성 테스트는 통과헀으나 효율성 테스트의 실패   
```
import Foundation
/*
곱이 최소인 값들을 찾아 더해주는 문제이다
[1,4,2] [5,4,4]의 곱 최소값은
a배열의 최소값과 b배열의 최대값을 곱해주는것이다 ex) 1 x 5
*/
func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    var minA = A.sorted(by:<)
    var maxB = B.sorted(by:>)
    //print(minA,maxB)
    for i in 0..<A.count {
        ans += (minA[i]*maxB[i])
        //print(ans)
    }
    return ans
}
```
