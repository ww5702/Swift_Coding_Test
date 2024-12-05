```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(input)
    }
    var student = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<5 {
            for k in 0..<n {
                if board[i][j] == board[k][j] {
                    student[i][k] = 1
                }
            }
        }
    }
    
//    for i in 0..<n {
//        print(student[i])
//    }
    
    var rates = Array(repeating: 0, count: n)
    var cnt = -1
    for i in 0..<n {
        rates[i] = student[i].filter({$0 == 1}).count
        cnt = max(cnt, rates[i])
    }
    //print(rates)
    
    
    for i in 0..<n {
        if rates[i] == cnt {
            print(i+1)
            break
        }
    }
}
solution()
/*
 */

```
