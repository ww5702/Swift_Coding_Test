```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board: [[Int]] = []
    for _ in 0..<n {
        board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    let k = Int(readLine()!)!
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (y1,x1,y2,x2) = (input[0]-1,input[1]-1,input[2]-1,input[3]-1)
        var sum = 0
        for i in y1...y2 {
            sum += board[i][x1...x2].reduce(0, +)
            //print(board[i][x1...x2])
        }
        print(sum)
    }
    
}
solution()
/*

 
 */

```
