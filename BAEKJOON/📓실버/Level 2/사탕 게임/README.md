조건을 따져서 돌려봤으나 실패   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: ".", count: n), count: n)
    for i in 0..<n {
        let input = readLine()!.map{String($0)}
        for j in 0..<n {
            board[i][j] = input[j]
        }
    }
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    func findRow(_ y: Int, _ x: Int) -> Int {
        var cnt = 1
        var word = board[0][x]
        
        for i in 1..<n {
            if board[i][x] == word {
                cnt += 1
            } else {
                word = board[i][x]
                cnt = 1
            }
        }
        return cnt
    }
    
    func findCol(_ y: Int, _ x: Int) -> Int {
        var cnt = 1
        var word = board[y][0]
        
        for i in 1..<n {
            if board[y][i] == word {
                cnt += 1
            } else {
                word = board[y][i]
                cnt = 1
            }
        }
        return cnt
    }
    var result = -1
    
    for i in 0..<n {
        for j in 0..<n {
            //print(i,j)
            let now = board[i][j]
            var row = findRow(i, j)
            var col = findCol(i, j)
            //print(row,col)
            result = max(max(row,col), result)
            if result == n { break }
            
            for k in 0..<4 {
                let newY = i+dy[k]
                let newX = j+dx[k]
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    if board[newY][newX] != now {
                        //print("교환",newY,newX)
                        let temp = board[newY][newX]
                        board[newY][newX] = now
                        board[i][j] = temp
                        
                        // 행열 갯수
                        var row = findRow(i, j)
                        var col = findCol(i, j)
                        //print("갯수",row,col)
                        result = max(max(row,col), result)
                        
                        board[i][j] = now
                        board[newY][newX] = temp
                        
                        
                    }
                }
            }
        }
        
    }
    print(result)
}

solution()
/*
 */


```
구현 방식이 틀렸던것이지 방식은 맞았다.   
그리고 swapAt을 활용하면 좋았다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: ".", count: n), count: n)
    for i in 0..<n {
        let input = readLine()!.map{String($0)}
        for j in 0..<n {
            board[i][j] = input[j]
        }
    }
    
    var result = -1
    
    func row_count() {
        for i in 0..<n {
            var count = 1
            for j in 0..<n-1 {
                if board[i][j] == board[i][j+1] {
                    count += 1
                } else {
                    result = max(result, count)
                    count = 1
                }
                result = max(result,count)
            }
        }
    }

    func col_count() {
        for i in 0..<n {
            var count = 1
            for j in 0..<n-1 {
                if board[j][i] == board[j+1][i] {
                    count += 1
                } else {
                    result = max(result, count)
                    count = 1
                }
                result = max(result, count)
            }
        }
    }
    
    
    
    
    for i in 0..<n {
        for j in 0..<n-1 {
        
            // 자리 바꿔서 result 갱신해주고
            board[i].swapAt(j,j+1)
            row_count()
            col_count()
            //다시 자리 바꿔줌
            board[i].swapAt(j,j+1)
            
            //열끼리 자리 바꿀건데, 값을 temp 에 저장해뒀다가 값을 줘야해.
            var temp = board[j][i]
            board[j][i] = board[j+1][i]
            board[j+1][i] = temp
            
            row_count()
            col_count()
            
            // 원래자리로 돌려
            temp = board[j][i]
            board[j][i] = board[j+1][i]
            board[j+1][i] = temp
         
        }
    }

    print(result)
    
}

solution()
/*
 */


```
