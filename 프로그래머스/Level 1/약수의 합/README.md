시간복잡도를 줄이기 위해 sqrt를 사용했다.   
제곱근 이전의 값들이 만약에 나머지가 0이 나온다면   
해당 값과, n/$0 의 값 둘다 약수에 포함되므로   
해당 값들을 전부 더해준다.   
그리고 25 16과 같이 제곱인 수는 두번 더해졌을 예외가 발생하므로 해당 조건일때만 한번 뺴준다.   

```
import Foundation
func solution(_ n:Int) -> Int {
    let num = Int(sqrt(Double(n)))
    var result = 0
    (1...num).forEach {
        if n % $0 == 0 {
            result += $0
            result += (n/$0)
        }
    }
    if num * num == n {
        result -= num
    }
    return result
}
```
