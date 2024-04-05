해당 문제는 문제를 읽으면 읽을수록 이해할 수 없는 문제이다.   
설명을 제대로 못해준 문제라고 생각한다.   
```
import Foundation
func solution(){
    var x = Int(readLine()!)!
    let str = String(x, radix: 2)
    print(str.map{String($0)}.filter{$0 == "1"}.count)
}
solution()

```
