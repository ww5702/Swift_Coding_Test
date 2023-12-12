# 재귀를 응용하는 알고리즘, 분할 정복을 익혀 봅시다.
## 2630 색종이 만들기
재귀를 이용해 1,2,3,4분면
```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<N {
        var value = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(value)
    }
    var blueCnt = 0
    var whiteCnt = 0
    func divideBoard(_ y : Int, _ x: Int, _ width: Int) {
        var white = 0
        var blue = 0
        for i in y..<y+width {
            for j in x..<x+width {
                if board[i][j] == 1 { blue += 1}
                else { white += 1}
            }
        }
        if white == width*width {
            whiteCnt += 1
            return
        }
        if blue == width*width {
            blueCnt += 1
            return
        }
        divideBoard(y, x, width/2)
        divideBoard(y, x+width/2, width/2)
        divideBoard(y+width/2, x, width/2)
        divideBoard(y+width/2, x+width/2, width/2)
        
    }
    divideBoard(0, 0, N)
    print(whiteCnt, blueCnt)
}

solution()
```
풀이방법은 여러가지가 있다.   
하지만 결국 분할하여 재귀함수를 반복한다.   
```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<N {
        var value = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(value)
    }
    var blueCnt = 0
    var whiteCnt = 0
    func checkOk(_ y: Int, _ x: Int, _ width: Int) -> Bool {
        for i in y..<y+width {
            for j in x..<x+width {
                if board[y][x] != board[i][j] { return false }
            }
        }
        return true
    }
    func divideBoard(_ y : Int, _ x: Int, _ width: Int){
        if checkOk(y, x, width) {
            if board[y][x] == 1 { blueCnt += 1}
            else {whiteCnt += 1}
        } else {
            divideBoard(y, x, width/2)
            divideBoard(y, x+width/2, width/2)
            divideBoard(y+width/2, x, width/2)
            divideBoard(y+width/2, x+width/2, width/2)
        }
    }
    divideBoard(0, 0, N)
    print(whiteCnt, blueCnt)
}

solution()

```
