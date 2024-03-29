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
## 11444 피보나치 수 6
<img width="520" alt="스크린샷 2023-12-15 오후 2 21 45" src="https://github.com/ww5702/Swift_Coding_Test/assets/60501045/46ee216a-4574-4b31-bf54-cf5568499cac">   
어지간한 피보나치 수는 동적계획법을 이용해 풀 수 있습니다.   
하지만 1조가 넘는 수를 피보나치수를 구하려면 동적 계획법 또한 시간초과가 발생합니다.   
따라서 행렬제곱을 이용해야 합니다.   
(1 1   
 1 0) 을 n번 제곱한 (0,0)수가 해당 피보나치 수열의 정답이 됩니다.   
 (1 1 0 1) -> (2 1 1 0) -> (3 2 2 0) -> (5 3 3 0)과 같이    
 즉 분할정복을 이용한 행렬 제곱 + 피보나치수라고 할 수 있습니다.   
 
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    let div = 1000000007
    let matrix = [[1,1],[1,0]]
    
    func powMatrix(_ board: [[Int]], _ n: Int) -> [[Int]] {
        if n == 1 { return board }
        var ret = powMatrix(board, n/2)
        ret = multiple(ret, ret)
        if n % 2 != 0 {
            ret = multiple(ret, matrix)
        }
        return ret
    }
    
    func multiple(_ board:[[Int]], _ board2:[[Int]]) -> [[Int]] {
        var ret = Array(repeating: Array(repeating: 0, count: 2), count: 2)
        for i in 0..<2 {
            for j in 0..<2 {
                for k in 0..<2 {
                    ret[i][j] += (board[i][k] * board2[k][j])
                    ret[i][j] %= div
                }
            }
        }
        return ret
    }
    
    func fibonacci(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        }
        
        let resultMatirx = powMatrix(matrix,n-1)
        return resultMatirx[0][0]
    }
    
    print(fibonacci(n))
}

solution()

```
## 6549 히스토그램에서 가장 큰 직사각형
초기값을 0,end (6)이라고 치고 시작한다.   
해당값을 0,3 / 4,6 으로 나누고   
0,1 2,3 4,5 5,6 으로 또 반을 나눈다   
여기까지가 분할과정이다.   
만약 0,0 1,1과 같이 start와 end가 같아진다면 가로가 1 높이가 arr[i]로   
result를 지정해준다.   
이제 예를들어 2,3이라고 가정하고 코드를 풀이해보겠다.   
초기 height = min(arr[2],arr[3])이므로 4이다.   
초기 넓이는 2칸 x height = 8이다   
while문은 start : 2, end: 3이므로 작동하지 않는다.   

다른 예로 start 0, end 6일때   
mid 3 left = 3 right 4 가 되는 경우가 있다.   
해당 경우의 최소높이는 1, 가로는 2 따라서 넓이는 2이다   
하지만 result보다는 작으므로 변경은 되지않는다.   
해당값의 left와 right가 start,end보다 좁으므로 한칸씩 바깥으로 밀어준다. left = 2, right = 4이더라도 넓이는 3x1 = 3이다 바뀌지않는다.   
여전히 start,end보다는 좁으므로 또 밀어준다.   
2,5가 되더라도 넓이는 4로 바뀌지않는다.   
해당과정을 모두 반복해주게 된다면 최대 넓이는 8로 고정된다.   

```
import Foundation

func solution() {
    while true {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        if input[0] == 0 { break }
        let n = input[0]
        var arr: [Int] = Array(repeating: 0, count: n)
        for i in 1...n {
            arr[i-1] = input[i]
        }
        
        print(checkRange(0, n-1))
        
        func checkRange(_ start: Int, _ end: Int) -> Int {
            if start == end { return arr[start] }
            let mid = (start+end)/2
            //print(start,mid,end)
            var result = max(checkRange(start, mid), checkRange(mid+1, end))
            //print(result)
            var left = mid
            var right = mid+1
            var height = min(arr[left],arr[right])
            //print("left,right",left,right,height)
            // 더 작은 높이로 현재는 2칸
            result = max(result,height*2)
            //print("초기 2칸으로 더 크게 되었는가",result)
            // 모두가 가능한 높이로 최대한의 가로를 구한다.
            while (start < left || right < end) {
                // 둘다 아직 더 왼쪽이나 오른쪽으로 갈 수 있다면
                if start < left && right < end {
                    // 만약 왼쪽으로 한칸 가거나 오른쪽으로 한칸갈때 오른쪽의 높이가 더 크다면
                    if arr[left-1] < arr[right+1] {
                        right += 1
                        height = min(height,arr[right])
                    } else {
                        left -= 1
                        height = min(height, arr[left])
                    }
                } else if start < left {
                // 왼쪽으로만 더 갈 수 있다면
                    left -= 1
                    height = min(height, arr[left])
                } else if right < end {
                // 오른쪽으로만 더 갈 수 있다면
                    right += 1
                    height = min(height, arr[right])
                }
                // 만약 진작에 했던 4X2 = 8이 1x6보다 크다면 바꿀필요 없다.
                //print("넓이 변경",left,right,height)
                result = max(result,height*(right-left+1))
            }
            return result
        }
    }
    
}

solution()

```

