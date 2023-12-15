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
## 11401 이항 계수 3
(n    일때 n! / (n-k)! * k!   
 k)   
라고 정의할 수 있다.   
그리고 주어진 값을 % 1000000007 해주는 문제이다.   
결국 (n! / k!(n-k)!) % div 해주는데 ( div라고 1000000007를 칭한다)    
20 미만의 N,K라면 문제가 없지만 문제는 주어지는 수가 너무 크다는 것이다.   
따라서 모듈러의 연산 공식을 활용해야 하는데   
모듈러 연산에서 나눗셈 연산은 없다는 점이 중요하다   
(a/b)%m /= ((a % m) / (b % m)) % m   
즉, 나눗셈의 수에 대한 모듈러 연산은 분배벅칙을 적용할 수 없다는 의미이다.   
모듈러 연산은   
(a x b) % p = ((a % p) x (b % p)) % p 로 적용할 수 있는데   
분수꼴을 곱셈꼴로 바꾼뒤 위를 풀이하면 그만이다.   
따라서 ((N! % div) * (K!(N-K)!)^-1 % div) % div 이다.   
우리는 K!(N-K)!의 역원을 구하는게 관건으로 바뀐다   
여기에 페르마의 소정리를 적용한다.   
a는 정수, p는 소수이며 a와 p가 서로 나눠지지 않을때(배수가 아닐때)   
a^p % p = a % p 이다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (N,K) = (input[0],input[1])
    let div = 1000000007
    func factorial(_ n: Int) -> Int {
        if n <= 1 { return 1}
        return (n*factorial(n-1))%div
    }
    func mod_inverse(_ a: Int, _ p: Int) -> Int {
        var base = a, expo = p
        if expo == 1 { return base % div }
        var temp = mod_inverse(base,expo/2)
        if expo % 2 == 1 {
            return (temp*temp%div) * base % div
        }
        return temp*temp%div
    }
    var num = factorial(N)
    var num2 = factorial(K) * factorial(N-K) % div
    print(num * mod_inverse(num2, div-2)%div)
}

solution()

```
## 2740 행결 곱셈
입출력 후 행렬곱셈 법칙에 따라 곱해준다.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (N,M) = (input[0],input[1])
    var arrA: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)
    for i in 0..<N {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<M {
            arrA[i][j] = value[j]
        }
    }
    //print(arrA)
    let input2 = readLine()!.split(separator: " ").map{Int($0)!}
    let (M2,K) = (input2[0],input2[1])
    var arrB: [[Int]] = Array(repeating: Array(repeating: 0, count: K), count: M2)
    for i in 0..<M2 {
        let value = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<K {
            arrB[i][j] = value[j]
        }
    }
    //print(arrB)
    var result: [[String]] = []
    var temp = 0
    for i in 0..<N {
        result.append([])
        for j in 0..<K {
            temp = 0
            for k in 0..<M2 {
                temp += arrA[i][k] * arrB[k][j]
            }
            result[i].append("\(temp)")
        }
    }
    //print(result)
    for i in 0..<result.count {
        print(result[i].joined(separator: " "))
    }
}

solution()

```
## 10830 행렬 제곱
분할 정복 + 제곱의 성질을 이해하여 풀이해야한다.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (N,A) = (input[0],input[1])
    var div = 1000
    var matrix: [[Int]] = []
    for _ in 0..<N {
        matrix.append(readLine()!.split(separator: " ").map{Int($0)!})
    }
    for i in 0..<N {
        for j in 0..<N {
            matrix[i][j] %= 1000
        }
    }
    
    func powMatrix(_ board: [[Int]], _ b: Int) -> [[Int]] {
        if b == 1 { return board }
        var ret = powMatrix(board, b/2)
        // 2^50이라면 2^25 2^25를 구한다
        ret = multiple(ret, ret)
        // 만약 51이라면 25,25를 한 값에 2를 한번 더 구해준다.
        if b % 2 == 1 {
            ret = multiple(ret, matrix)
        }
        return ret
    }
    
    func multiple(_ board: [[Int]], _ board2: [[Int]]) -> [[Int]] {
        var ret = Array(repeating: Array(repeating: 0, count: N), count : N)
        for i in 0..<N {
            for j in 0..<N {
                for k in 0..<N {
                    ret[i][j] += board[i][k] * board2[k][j]
                    ret[i][j] %= div
                }
            }
        }
        return ret
    }
    let board = powMatrix(matrix, A)
    for i in 0..<N {
        print(board[i].map{String($0)}.joined(separator: " "))
    }
}

solution()

```
