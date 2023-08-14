String(value, radix: ?)를 알고 있다면 쉽게 풀이할 수 있는 문제이다.   
3진법으로 변환 후 reversed() 내장함수를 통해 숫자를 뒤집고 다시 해당 3진법을 radix: 3을 이용한다면   
다시 10진법 숫자로 변환이 된다.   
```
import Foundation

func solution(_ n:Int) -> Int {
    return Int(String(String(n, radix: 3).reversed()), radix: 3)!
}
```
