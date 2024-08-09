dfs로 풀이해봤으나 당연히 시간초과   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: 4), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board[i] = input
    }
    var result = 0
    
    
    func dfs(_ depth: Int, _ sum: Int) {
       
        if depth == 4 {
            //print(depth, sum)
            if sum == 0 {
                //print(" 정답")
                result += 1
            }
            return
        }
        
        for i in 0..<n {
            dfs(depth+1, sum + board[i][depth])
        }
    }
    
    for i in 0..<n {
        dfs(1, board[i][0])
    }
    print(result)
}


solution()
/*
 */

```
