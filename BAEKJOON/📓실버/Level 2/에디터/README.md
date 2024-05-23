당연히 커서의 위치에 따라 insert하면 시간초과가 발생할것같아   
dequeue느낌으로 배열을 하나 더 만들었으나   
시간초과   
```
import Foundation
func solution(){
    var arr = Array(readLine()!)
    var right: [Character] = []
    let m = Int(readLine()!)!
    
    for _ in 0..<m {
        let input = readLine()!.components(separatedBy: " ")
        if input[0] == "L" {
            if !arr.isEmpty {
                right.append(arr.removeLast())
            }
        } else if input[0] == "D" {
            if !right.isEmpty {
                arr.append(right.removeLast())
            }
        } else if input[0] == "B" {
            if !arr.isEmpty {
                arr.removeLast()
            }
        } else if input[0] == "P" {
            arr.append(contentsOf: input[1])
        }
    }
//    print(arr, right)
    print(String(arr+right.reversed()))
    
}
solution()

```
하지만 밑과 같이 readLine!만 했을 경우 통과   
해당 경우가 더 빠른것 같다.   

```
var left = Array(readLine()!)
var right: [Character] = []
let n = Int(readLine()!)!

for _ in 0..<n {
    let edit = readLine()!
    switch edit {
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D" :
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B" :
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        left.append(edit.last!)
    }
}

print(String(left+right.reversed()))
```
