redue 고차함수를 사용할 수 있으면 한줄로도 풀이가 가능한 문제이다.   
어차피 주어진 숫자들은 중복이 없고 1~9까지의 합은 45로 고정이기 때문   
```
import Foundation

func solution(_ numbers:[Int]) -> Int {
    return 45-numbers.reduce(0,+)
}
```
