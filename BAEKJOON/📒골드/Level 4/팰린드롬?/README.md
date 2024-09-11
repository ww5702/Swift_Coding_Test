당연히 이진트리로 풀이하면 시간초과가 발생할줄 알았다.    

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    let value = readLine()!.split(separator: " ").map{Int(String($0))!}
    var m = Int(readLine()!)!
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        var (start,end) = (input[0],input[1])
        if (end - start) % 2 == 1 { print(0) }
        else {
            while(start != end) {
                if value[start-1] == value[end-1] {
                    start += 1
                    end -= 1
                } else {
                    break
                }
            }
            print(start == end ? 1 : 0)
        }
    }
}

solution()
/*
 */

``
