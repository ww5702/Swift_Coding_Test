```
import Foundation
func solution() {
    var board = Array(repeating: Array(repeating: false, count: 101), count: 101)
    
    for _ in 0..<4 {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (x1,y1,x2,y2) = (input[0],input[1],input[2],input[3])
        for y in  y1..<y2 {
            for x in x1..<x2 {
                board[y][x] = true
            }
        }
    }
    
    var cnt = 0
    for i in 0...100 {
        cnt += board[i].filter{$0}.count
    }
    print(cnt)
}


solution()
/*
 */

```
