# 재귀를 응용하는 알고리즘, 분할 정복을 익혀 봅시다.
## 2630 색종이 만들기
재귀를 이용해 1,2,3,4분면을 나눈뒤   
해당 분면의 가능성을 조사한다.   
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

## 1992 쿼드트리
2630 문제랑 거의 동일한 방식으로 풀 수 있다.   
달라진 점은 나눠질때마다 (를 출력해주고 나눠진 값이 닫혀질때마다 )를 출력해주는 점이 다르다.   
따라서 divideBoard를 x,y,width 값을 조절해줄때마다 ( , ) 를 출력해준다.   

```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    var board: [[Character]] = []
    for _ in 0..<N {
        var value = Array(readLine()!)
        board.append(value)
    }
    var result = ""
    func isOk(_ y: Int, _ x: Int, _ width: Int) -> Bool {
        for i in y..<y+width {
            for j in x..<x+width {
                if board[i][j] != board[y][x] { return false }
            }
        }
        return true
    }
    
    func divideBoard(_ y: Int, _ x: Int, _ width: Int) {
        if isOk(y, x, width) {
            result += String(board[y][x])
        } else {
            result += "("
            divideBoard(y, x, width/2)
            divideBoard(y, x+width/2, width/2)
            divideBoard(y+width/2, x, width/2)
            divideBoard(y+width/2, x+width/2, width/2)
            result += ")"
        }
    }
    
    divideBoard(0, 0, N)
    print(result)
}

solution()

```
## 1780 종이의 개수
윗 문제들과 다를게 없다.   
다른것이 있다면 종이를 4등분이 아니라 9등분한다는점   
따라서 9등분을 해주는 값들을 조정해주면 된다,   
```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    var board: [[Int]] = []
    for _ in 0..<N {
        var value = readLine()!.split(separator: " ").map{Int(String($0))!}
        board.append(value)
    }
    var (minusOne, zero, one) = (0,0,0)
    func isOk(_ y: Int, _ x: Int, _ width: Int) -> Bool {
        for i in y..<y+width {
            for j in x..<x+width {
                if board[i][j] != board[y][x] { return false }
            }
        }
        return true
    }

    func divideBoard(_ y: Int, _ x: Int, _ width: Int) {
        if isOk(y, x, width) {
            if board[y][x] == 0 {
                zero += 1
            } else if board[y][x] == 1 {
                one += 1
            } else {
                minusOne += 1
            }
        } else {
            divideBoard(y, x, width/3)
            divideBoard(y, x+width/3, width/3)
            divideBoard(y, x+width/3*2, width/3)
            
            divideBoard(y+width/3, x, width/3)
            divideBoard(y+width/3, x+width/3, width/3)
            divideBoard(y+width/3, x+width/3*2, width/3)
            
            divideBoard(y+width/3*2, x, width/3)
            divideBoard(y+width/3*2, x+width/3, width/3)
            divideBoard(y+width/3*2, x+width/3*2, width/3)
        }
    }
    
    divideBoard(0, 0, N)
    print(minusOne)
    print(zero)
    print(one)
}

solution()

```
## 1629 곱셈
A B C가 10 11 12일때   
10^11 % 12는 결국 (10 % 12) * (10 % 12)를 11번 한것과 같다.   
지수법칙을 이용해 지수가 홀수일떄는 (11 -> 5 * 5 * 1)이고   
10이라면 5 * 5임을 이용한다.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (A,B,C) = (input[0],input[1],input[2])
    
    func dfs(_ n: Int) -> Int {
        if n == 0 { return 1 }
        if n % 2 == 0 {
            let value = dfs(n/2)
            return value%C * value%C
        } else {
            let value = dfs((n-1)/2)
            return value%C * value%C * A%C
        }
    }
    
    print(dfs(B))
    
}

solution()

```
