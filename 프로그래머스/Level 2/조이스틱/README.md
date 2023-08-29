해당 알파벳들을 ascii숫자로 변환시켜 z에서 접근하는게 더 빠른지 a에서 접근하는게 더 빠른지 판단해준다.   
그리고 JAAASUIE 와 같은 경우   
J에서 다음 A가 너무 많은 경우 돌아가는 것이 더 빠르다는 판단을 해주기만 하면 된다.   
좌우의 이동의 알고리즘을 이해하는데 더 오래 걸렸다.   

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
asciiValue
i * 2 (name.count - end)   
의 코드는 JAB[i]AAA[end]CDEF     
와 같은 경우   
J에서 AB의 글자까지 만드록 다시 뒤로 돌아간다음 CDEF를 만드는 구조이다.   
따라서 x2를 해주는것.   
```
import Foundation

func solution(_ name:String) -> Int {
    let name = Array(name)
    var result = 0
    var move = name.count - 1
    //print(name)
    let A = Int(Character("A").asciiValue!) // 65
    let Z = Int(Character("Z").asciiValue!) // 90
    
    for i in 0..<name.count {
        // a에서 접근 or z에서 접근
        result += min(Int(name[i].asciiValue!) - A , Z - Int(name[i].asciiValue!) + 1)
        
        var end = i + 1
        // 연속된 a 갯수 확인
        while end < name.count && name[end] == "A" {
            end += 1
        }
        
        let moveFront = i * 2 + (name.count - end)
        let moveBack = (name.count-end) * 2 + i
        move = min(move, moveFront)
        move = min(move, moveBack)
    }
    
    return result+move
}
```
