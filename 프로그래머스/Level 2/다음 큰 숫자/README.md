radix를 이용해 2진수를 구하고, 배열화 시킨 후, 고차함수를 이용해 1의 갯수를 구한다.   
while 반복문을 이용해 기약없는 반복문을 구성한 뒤   
1씩 커지는 숫자를 다시 한번 처음의 과정을 반복한다.   
만약 1의 갯수가 같아진다면 해당 숫자를 반환한다.   

```
import Foundation

func solution(_ n:Int) -> Int
{
    var n = n
    var now = String(n,radix: 2).map{String($0)}.filter{$0 == "1"}.count
    while true {
        n += 1
        var value = String(n,radix: 2).map{String($0)}.filter{$0 == "1"}.count
        if now == value {
            return n
            break
        }
    }
}
```
