올림이 필요한 경우 +1해주는게 더 빠르다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    let board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var distance = max(board[0], n - board.last!)
    //print(distance)
    
    for i in 0..<m-1 {
        distance = max((board[i+1] - board[i]+1) / 2, distance)
    }
    print(distance)
}

solution()
/*
 */

```
