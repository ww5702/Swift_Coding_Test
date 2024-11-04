일단 구현 한번해보았다 2퍼에서 런타임에러   

```
import Foundation
func solution(){
    let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,k) = (nmk[0],nmk[1],nmk[2])
    var board: [Int] = [0]
    for _ in 0..<n {
        board.append(Int(readLine()!)!)
    }
    for _ in 0..<m+k {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if input[0] == 1 {
            board[input[1]] = input[2]
        } else {
            print(board[input[1]...input[2]].reduce(1, *) % 1_000_000_007)
        }
    }
}

solution()
/*
 1 2 6 4 2
 */


```
