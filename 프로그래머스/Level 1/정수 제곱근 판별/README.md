sqrt를 했을때 제곱근이 있다면 Int로 형변환 후 다시 Double로 형변환을 해도 같은 값이 나와야한다.   

```
import Foundation
func solution(_ n:Int64) -> Int64 {
    //print(sqrt(Double(n)))
    var num = sqrt(Double(n)) == Double(Int(sqrt(Double(n)))) ? Int(sqrt(Double(n))) : -1
    //print(num)
    return num == -1 ? Int64(-1) : Int64((num+1)*(num+1))
}
```
