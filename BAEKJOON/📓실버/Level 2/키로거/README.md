배열의 insert로 처리하니 25%에서 시간초과 발생   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    for _ in 0..<n {
        var result: [String] = []
        var cursor = 0
        var value = readLine()!.map{String($0)}
        //print(value)
        for i in 0..<value.count {
            let now = value[i]
            //print(now, cursor)
            if now == "<" {
                cursor -= cursor >= 1 ? 1 : 0
            } else if now == ">" {
                cursor += cursor < result.count ? 1 : 0
            } else if now == "-" {
                if result.count != 0 && cursor != 0{
                    result.remove(at: cursor-1)
                    cursor -= 1
                }
            } else {
                result.insert(now, at: cursor)
                cursor += 1
            }
            
            
        }
        print(result.joined(separator: ""))
    }
}

solution()
/*
 AB>>C<D<<E<<<FGH>>->>-<<-
 */

```
힙 처리 하는것처럼 풀이
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    for _ in 0..<n {
        var result: [String] = []
        var backResult: [String] = []
        var value = readLine()!.map{String($0)}
        //print(value)
        for i in 0..<value.count {
            let now = value[i]
            //print(now, cursor)
            if now == "<" {
                if !result.isEmpty {
                    backResult.append(result.removeLast())
                }
            } else if now == ">" {
                if !backResult.isEmpty {
                    result.append(backResult.removeLast())
                }
            } else if now == "-" {
                if !result.isEmpty {
                    result.removeLast()
                }
            } else {
                result.append(now)
            }
            
            
        }
        print((result+(backResult.reversed())).joined(separator: ""))
    }
}

solution()
/*
 AB>>C<D<<E<<<FGH>>->>-<<-
 */

```
