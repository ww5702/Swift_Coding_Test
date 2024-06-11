동서남북으로 이동하면서 공간을 빼주면서 더하는 구현문제이다.   
dfs를 곁들인   

```
import Foundation
var result = -1
func dfs(_ board: [[Int]], _ direction: Int, _ depth: Int) {
    if depth == 5 {
        for i in 0..<board.count {
            result = max(result, board[i].max()!)
        }
        //print(result)
        return
    }
    
    var newBoard = board
    if direction == 0 {
        for i in 0..<board.count {
            let tempArr = newBoard[i].filter{$0 != 0}
            var storeArr: [Int] = []
            var idx = tempArr.count-1
            while idx >= 0 {
                if idx > 0 && tempArr[idx] == tempArr[idx-1]{
                    storeArr.append(tempArr[idx]*2)
                    idx -= 1
                } else if idx > 0 && tempArr[idx] != tempArr[idx-1] {
                    storeArr.append(tempArr[idx])
                } else if idx == 0 {
                    storeArr.append(tempArr[idx])
                }
                idx -= 1
            }
            for _ in 0..<board.count - storeArr.count {
                storeArr.append(0)
            }
            newBoard[i] = storeArr.reversed()
        }
        for d in 0..<4 {
            dfs(newBoard, d, depth+1)
        }
        //print(newBoard)
    } else if direction == 1 {
        for i in 0..<board.count {
            let tempArr = newBoard[i].filter{$0 != 0}
            var storeArr: [Int] = []
            var idx = 0
            while idx < tempArr.count {
                if idx < tempArr.count-1 && tempArr[idx] == tempArr[idx+1]{
                    storeArr.append(tempArr[idx]*2)
                    idx += 1
                } else if idx < tempArr.count-1 && tempArr[idx] != tempArr[idx+1] {
                    storeArr.append(tempArr[idx])
                } else if idx == tempArr.count-1 {
                    storeArr.append(tempArr[idx])
                }
                idx += 1
            }
            for _ in 0..<board.count - storeArr.count {
                storeArr.append(0)
            }
            newBoard[i] = storeArr
        }
        for d in 0..<4 {
            dfs(newBoard, d, depth+1)
        }
        //print(newBoard)
    } else if direction == 2 {
        for i in 0..<board.count {
            var tempArr: [Int] = []
            for j in 0..<board.count {
                if newBoard[j][i] != 0 { tempArr.append(newBoard[j][i]) }
            }
            //print(tempArr)
            var storeArr: [Int] = []
            var idx = tempArr.count-1
            
            while idx >= 0 {
                if idx > 0 && tempArr[idx] == tempArr[idx-1]{
                    storeArr.append(tempArr[idx]*2)
                    idx -= 1
                } else if idx > 0 && tempArr[idx] != tempArr[idx-1] {
                    storeArr.append(tempArr[idx])
                } else if idx == 0 {
                    storeArr.append(tempArr[idx])
                }
                idx -= 1
            }
            
            for _ in 0..<board.count - storeArr.count {
                storeArr.append(0)
            }
            storeArr.reverse()
            for k in 0..<board.count {
                newBoard[k][i] = storeArr[k]
            }
        }
        for d in 0..<4 {
            dfs(newBoard, d, depth+1)
        }
        //print(newBoard)
    } else {
        for i in 0..<board.count {
            var tempArr: [Int] = []
            for j in 0..<board.count {
                if newBoard[j][i] != 0 { tempArr.append(newBoard[j][i]) }
            }
            //print(tempArr)
            var storeArr: [Int] = []
            var idx = 0
            
            while idx < tempArr.count {
                if idx < tempArr.count-1 && tempArr[idx] == tempArr[idx+1]{
                    storeArr.append(tempArr[idx]*2)
                    idx += 1
                } else if idx < tempArr.count-1 && tempArr[idx] != tempArr[idx+1] {
                    storeArr.append(tempArr[idx])
                } else if idx == tempArr.count-1 {
                    storeArr.append(tempArr[idx])
                }
                idx += 1
            }
            for _ in 0..<board.count - storeArr.count {
                storeArr.append(0)
            }
            for k in 0..<board.count {
                newBoard[k][i] = storeArr[k]
            }
        }
        for d in 0..<4 {
            dfs(newBoard, d, depth+1)
        }
        //print(newBoard)
    }
}
func solution(){
    let n = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board.append(input)
    }
    //print(board)
    // 동서남북으로 시작
    for i in 0..<4 {
        dfs(board, i, 0)
    }
    print(result)
}
solution()

```
