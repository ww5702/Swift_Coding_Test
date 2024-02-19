# [비트마스크](https://github.com/ww5702/Swift_Coding_Test/blob/main/Algorithm/%EB%B9%84%ED%8A%B8%EB%A7%88%EC%8A%A4%ED%82%B9.md)를 배우고, 동적 계획법에 적용해 봅시다. 그 후에는 선형이 아니라 원형으로 구성된 문제를 다룹니다.	

## 11723 [집합](https://www.acmicpc.net/problem/11723)
단순한 반복문으로 풀이한다면 시간초과가 발생한다.   
```
import Foundation
func solution(){
    let m = Int(readLine()!)!
    var s = Array(repeating: 0, count: 21)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{String($0)}
        //print(input[0])
        switch input[0] {
        case "add":
            s[Int(input[1])!] = 1
            break
        case "remove":
            s[Int(input[1])!] = 0
            break
        case "check":
            print(s[Int(input[1])!] == 1 ? 1 : 0)
            break
        case "toggle":
            if s[Int(input[1])!] == 1 {
                s[Int(input[1])!] = 0
            } else {
                s[Int(input[1])!] = 1
            }
            break
        case "all":
            s = Array(repeating: 1, count: 21)
            break
        case "empty":
            s = Array(repeating: 0, count: 21)
            break
        default:
            break
        }
    }
}
solution()

```

```

```
