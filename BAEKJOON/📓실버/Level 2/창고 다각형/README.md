```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = Array(repeating: 0, count: 1001)

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (l, h) = (input[0], input[1])
        board[l] = h
    }
    
    //print(board.max()!)
    let maxHeightIdx = board.firstIndex(of: board.max()!)!
    //print(maxHeightIdx)
    var (leftArea, leftHeight, rightArea, rightHeight) = (0, 0, 0, 0)
    
    // 왼쪽
    for i in 0..<maxHeightIdx {
        leftHeight = max(board[i], leftHeight)
        leftArea += leftHeight
    }
    
    // 오른쪽
    for i in stride(from: board.count-1, to: maxHeightIdx, by: -1) {
        rightHeight = max(board[i], rightHeight)
        rightArea += rightHeight
    }
    
    print(leftArea+rightArea+board.max()!)
}

solution()
/*
 */
  

```
