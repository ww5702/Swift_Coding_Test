mapping하여 고차함수 reduce를 이용해 각 자릿수 값을 더해준다.   

```
import Foundation

func solution(_ n:Int) -> Int
{
    return String(n).map{Int(String($0))!}.reduce(0, +)
}
```
