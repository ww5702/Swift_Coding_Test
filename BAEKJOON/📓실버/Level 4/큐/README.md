swift에는 큐가 없다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var q: [Int] = []

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        if (input[0] == "push") {
            q.append(Int(input[1])!)
        } else if (input[0] == "pop") {
            if (!q.isEmpty) {
                q.reverse()
                print(q.popLast()!)
                q.reverse()
            } else {
                print(-1)
            }
        } else if (input[0] == "size") {
            print(q.count)
        } else if (input[0] == "empty") {
            print(q.isEmpty ? 1 : 0)
        } else if (input[0] == "front") {
            if (q.isEmpty) {
                print(-1)
            } else {
                print(q.first!)
            }
        } else if (input[0] == "back") {
            if (q.isEmpty) {
                print(-1)
            } else {
                print(q.last!)
            }
        }
    }
}
solution()



```
