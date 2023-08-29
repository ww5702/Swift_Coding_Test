해당 알파벳들을 ascii숫자로 변환시켜 z에서 접근하는게 더 빠른지 a에서 접근하는게 더 빠른지 판단해준다.   
그리고 JAAASUIE 와 같은 경우   
J에서 다음 A가 너무 많은 경우 돌아가는 것이 더 빠르다는 판단을 해주기만 하면 된다.   

```
import Foundation

func solution(_ name:String) -> Int {
    var names = name.map{String($0)}
    let (A,Z) = (65,91)
    var result = 0
    var current = 0
    var move = 0
    var minMove = names.count - 1
    for name in names {
        let now = Int(UnicodeScalar(name)!.value)
        // 77인 M이면 A에서부터 접근
        // 78인 N이면 Z에서부터 접근
        if now <= 78 {
            result += (now-A)
        } else {
            result += (Z-now)
        }
        
        // 좌우 이동
        if now != 65 {
            var next = current + 1
            // 연속된 A의 개수 파악
            while next < names.count && Int(UnicodeScalar(names[next])!.value) == 65 {
                next += 1
            }
            move = 2 * current  + names.count - next
            minMove = min(move,minMove)
        }
        current += 1
    }
    //print(result, minMove)
    
    return result+minMove
}
```
