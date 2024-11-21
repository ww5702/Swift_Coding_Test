```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var line: [Int] = []
    var q: [Int] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if input[0] == 1 {
            q.append(input[1])
            if q.count > line.count {
                line = q
            } else if q.count == line.count {
                if q.last! < line.last! {
                    line = q
                }
            }
        } else if input[0] == 2 {
            q.reverse()
            q.removeLast()
            q.reverse()
        }
        //print(q, line)
    }
    print(line.count, line.last!)
}
solution()
/*
 
 */

```
