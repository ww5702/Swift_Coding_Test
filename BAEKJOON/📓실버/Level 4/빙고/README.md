```
import Foundation
func solution(){
    var board = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
    var coords: [Int: (Int, Int)] = [:]

    for y in 0..<5 {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        for (x, num) in nums.enumerated() {
            coords[num] = (y, x)
        }
    }

    mainLoop: for y in 0..<5 {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        for (index, num) in nums.enumerated() {
            let coord = coords[num]!
            board[coord.0][coord.1] = true
            if check() {
                print(y * 5 + index + 1)
                break mainLoop
            }
        }
    }

    func check() -> Bool {
        var count = 0
        var diagonalBingo1 = true
        var diagonalBingo2 = true
        for i in 0..<5 {
            
            // 가로 빙고 확인
            count += board[i] == [Bool](repeating: true, count: 5) ? 1 : 0
            
            // 세로 빙고 확인
            var columnBingo = true
            for j in 0..<5 {
                if !board[j][i] {
                    columnBingo = false
                }
            }
            
            count += columnBingo ? 1 : 0
            
            // 대각선 빙고 확인
            if !board[i][i] {
                diagonalBingo1 = false
            }
            if !board[i][4 - i] {
                diagonalBingo2 = false
            }
        }
        count += diagonalBingo1 ? 1 : 0
        count += diagonalBingo2 ? 1 : 0
        return count > 2
    }
    
    
}

solution()
/*
 x x o x o
 o x x x x
 x x o x x
 x o o x x
 o x o x x
 */
  

```
