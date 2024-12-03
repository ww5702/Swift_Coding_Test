LIS (최장수열찾기) 랑 똑같은 문제이다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var result: [Int] = []
    result.append(board[0])
    for i in 1..<n {
        if board[i] > result.last! {
            result.append(board[i])
            continue
        }
        
        var start = 0; var end = result.count
        while start <= end {
            let middle = (start+end) / 2
            if result[middle] < board[i] {
                start = middle + 1
            } else {
                end = middle - 1
            }
        }
        
        result[start] = board[i]
    }
    
    print(result.count)
    
}
solution()
/*
 */

```
