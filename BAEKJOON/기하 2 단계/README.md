# 조금 더 어려운 기하 문제를 풀어 봅시다.	
## 2166 [다각형의 면적](https://www.acmicpc.net/problem/2166)    
[신발끈 공식](https://ko.wikipedia.org/wiki/%EC%8B%A0%EB%B0%9C%EB%81%88_%EA%B3%B5%EC%8B%9D) 을 이용하면 쉽게 풀이할 수 있는 문제이다.   
물론 신발끈 공식이 있는줄도 모르고 있었다.   
만약 신발끈 공식으로 풀이하지 않는다면 한 점을 임의로 잡고   
해당 점에서부터 모든 정점을 향해 직선을 그어주고   
팔각형이라면 삼각형 6개로,   
육각형이라면 삼각형 4개로 나누어 풀이하는 방식을 사용할 것 같다.   
``` 
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board: [(Int,Int)] = []
    for _ in 0..<n {
        let xy = readLine()!.split(separator: " ").map{Int($0)!}
        let (x,y) = (xy[0],xy[1])
        board.append((y,x))
    }
    //print(board)
    var xy = 0
    var yx = 0
    for i in 0..<n-1 {
        xy += board[i].0 * board[i+1].1
        yx += board[i].1 * board[i+1].0
    }
    xy += board[n-1].0 * board[0].1
    yx += board[n-1].1 * board[0].0
    let result = Double(abs(xy-yx))/2
    print(String(format: "%.1f", result))
    
}
solution()

```
## 11758 [CCW](https://www.acmicpc.net/problem/11758)   
문제의 이름처럼 세 점을 이용해 방향성을 구하는 알고리즘인   
CCW 알고리즘이 존재한다.   
외적을 이용해 구할 수 있으며, 외적의 결과가 음수면 시계방향,   
직선은 0,   
반 시계의 방향일 경우 양수가 나온다.   
(x1*y2 + x2*y3 + x3*y1) - (y1*x2 + y2*x3 + y3*x1)    
을 구하는 문제이다.   
```
import Foundation
func solution(){
    var board: [(Int,Int)] = []
    for _ in 0..<3 {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board.append((input[0],input[1]))
    }
    
    let x = (board[0].0 * board[1].1 + board[1].0 * board[2].1 + board[2].0 * board[0].1)
    let y = (board[0].1 * board[1].0 + board[1].1 * board[2].0 + board[2].1 * board[0].0)
    print(x - y == 0 ? 0 : x-y > 0 ? 1 : -1)
}
solution()

```
## 25308 [방사형 그래프](https://www.acmicpc.net/problem/25308)
볼록 다각형이 되는 경우는 점을 세개로 골랐을때   
하나는 나보다 작고 하나는 나보다 크면 가능하다.   
세점을 이용해 방향성을 구하는 CCW알고리즘을 이용해 음수인 순간을 구해주면   
시계방향으로 선이 그어진다.   
하지만 8! = 40320이라서 전부를 확인해주어도 실패하지 않는다.   
따라서 먼저 8! 경우의 팔각형을 전부 구해주고,   
삼각형 넓이 공식에 의해   
<img width="731" alt="스크린샷 2024-02-07 오후 5 33 10" src="https://github.com/ww5702/Swift_Coding_Test/assets/60501045/de64b03d-767a-448e-a86e-6d73ada6ad9a">   
해당 공식을 통과한다면 볼록임을 알 수 있다.   

```
import Foundation
func solution(){
    var value = readLine()!.split(separator: " ").map{Double($0)!}
    var arr: [[Double]] = []
    var visited = [Bool](repeating: false, count: 8)
    // 순서대로 돌아가면서 팔각형을 만들어준다.
    // 총 40320가지
    func dfs(_ n: Int, _ nums: [Double]) {
        if n == 8 {
            arr.append(nums)
            //print(nums)
            return
        }
        for i in 0..<8 {
            if !visited[i] {
                visited[i] = true
                dfs(n+1, nums+[value[i]])
                visited[i] = false
            }
        }
    }
    dfs(0,[])
    //print(arr)
    var result = 0
    // 확인
    for num in arr {
        var possible = true
        
        for i in 0..<8 {
            var num1 = 0.0
            var num2 = 0.0
            if i < 6 {
                num1 = (num[i]*num[i+2]) * sqrt(2.0)
                num2 = num[i+1] * (num[i] + num[i+2])
            } else if i == 6{
                num1 = (num[i]*num[i-6]) * sqrt(2.0)
                num2 = num[i+1] * (num[i] + num[i-6])
            } else {
                num1 = (num[i]*num[i-6]) * sqrt(2.0)
                num2 = num[0] * (num[i] + num[i-6])
            }
            
            if num1 > num2 {
                possible = false
                break
            }
        }
        //print(num,possible)
        if possible { result += 1 }
    }
    print(result)
}
solution()

```
## 17386 [선분 교차 1](https://www.acmicpc.net/problem/17386)    
CCW를 이용하여 풀이하는 알고리즘이다.   
점이 총 4개가 있다.   
1,2,3,4로 쉽게 말해보자.   
만약 CCW(1,2,3)과 CCW(1,2,4)가 1, -1로 서로 다른 방향이라면   
해당 선분은 서로 교차가 된다.   
하지만 이렇게만 비교할 경우 반례가 존재한다.   
서로 교차되지않고, 떨어져있어도 방향이 서로 다르다면 해당 공식은 참으로 반환된다.   
따라서 1,2,3 / 1,2,4 뿐만 아니라 3,4,1 / 3,4,2 까지 검사하여   
해당 값들 모두 서로 다른방향이라면 해당 선분이 교차한다고 판단한다.   
CCW(1,2,3) * CCW(1,2,4) <= 0 && CCW(3,4,1) * CCW(3,4,2) <= 0   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (x1,y1,x2,y2) = (input[0],input[1],input[2],input[3])
    let input2 = readLine()!.split(separator: " ").map{Int($0)!}
    let (x3,y3,x4,y4) = (input2[0],input2[1],input2[2],input2[3])
    
    func CCW(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int, _ x3: Int, _ y3: Int) -> Int {
        let x = (x1 * y2 + x2 * y3 + x3 * y1)
        let y = (y1 * x2 + y2 * x3 + y3 * x1)
        
        return x-y == 0 ? 0 : x-y > 0 ? 1 : -1
    }
    
    let p1p2p3 = CCW(x1, y1, x2, y2, x3, y3)
    let p1p2p4 = CCW(x1, y1, x2, y2, x4, y4)
    let p3p4p1 = CCW(x3, y3, x4, y4, x1, y1)
    let p3p4p2 = CCW(x3, y3, x4, y4, x2, y2)
    //print(p1p2p3, p1p2p4, p3p4p1, p3p4p2)
    
    if p1p2p3 * p1p2p4 <= 0 && p3p4p1 * p3p4p2 <= 0 {
        print(1)
    } else {
        print(0)
    }
        
}
solution()
```
## 17387 [선분 교차 2](https://www.acmicpc.net/problem/17387)   
선분 교차 1에서 조금 바뀐 문제이다.   
만약 두 선이 일직선으로 서로 겹쳐져있다면   
CCW(1,2,3) * CCW(1,2,4) = 0   
CCW(3,4,1) * CCW(3,4,2) = 0   
이 된다.   
따라서 x1,y1이 x4,y4보다 작고   
x3,y3이 x2,y2보다 작다면 서로 겹쳐져있는 일직선 선분이기에 1을 출력해준다.   
```
import Foundation
func solution(){
    typealias Point = (x: Double, y: Double)
    let input = readLine()!.split(separator: " ").map{Double($0)!}
    var a = Point(x: input[0], y: input[1])
    var b = Point(x: input[2], y: input[3])
    let input2 = readLine()!.split(separator: " ").map{Double($0)!}
    var c = Point(x: input2[0], y: input2[1])
    var d = Point(x: input2[2], y: input2[3])
    
    func CCW(_ a: Point, _ b: Point, _ c: Point) -> Int {
        let x = (a.x * b.y + b.x * c.y + c.x * a.y)
        let y = (a.y * b.x + b.y * c.x + c.y * a.x)
        
        return x-y == 0 ? 0 : x-y > 0 ? 1 : -1
    }
    
    let p1p2p3 = CCW(a,b,c)
    let p1p2p4 = CCW(a,b,d)
    let p3p4p1 = CCW(c,d,a)
    let p3p4p2 = CCW(c,d,b)
    //print(p1p2p3, p1p2p4, p3p4p1, p3p4p2)
    
    if p1p2p3 * p1p2p4 == 0 && p3p4p1 * p3p4p2 == 0 {
        if a > b { swap(&a, &b) }
        if c > d { swap(&c, &d) }
        
        if a <= d && b >= c {
            print(1)
        } else {
            print(0)
        }
    } else if p1p2p3 * p1p2p4 <= 0 && p3p4p1 * p3p4p2 <= 0 {
        print(1)
    } else {
        print(0)
        
    }
}
solution()

```
## 20149 [선분 교차 3](https://www.acmicpc.net/problem/20149)
선분 교차 2에서 한 점에서 겹치게 된다면 해당 좌표를 반환시켜주는 문제이다.   
해당 경우는 두 선분이 일직선이 아니면서 교차하는 경우,   
두 선분중 하나는 일직선, 하나는 직선이 아닌 경우,   
두 선분이 직선이지만, 한 점에서 겹치는 경우   
이렇게 3가지 경우가 있다.   
   
<img width="861" alt="스크린샷 2024-02-13 오후 3 44 10" src="https://github.com/ww5702/Swift_Coding_Test/assets/60501045/74bc9777-3a61-4424-8905-65342ff1f0aa">   
   
두 선분의 교점은 해당 공식으로 찾아낸다.   
```
import Foundation
func solution(){
    typealias Point = (x: Double, y: Double)
    let input = readLine()!.split(separator: " ").map{Double($0)!}
    var a = Point(x: input[0], y: input[1])
    var b = Point(x: input[2], y: input[3])
    let input2 = readLine()!.split(separator: " ").map{Double($0)!}
    var c = Point(x: input2[0], y: input2[1])
    var d = Point(x: input2[2], y: input2[3])
    
    func CCW(_ a: Point, _ b: Point, _ c: Point) -> Int {
        let x = (a.x * b.y + b.x * c.y + c.x * a.y)
        let y = (a.y * b.x + b.y * c.x + c.y * a.x)
        
        return x-y == 0 ? 0 : x-y > 0 ? 1 : -1
    }
    
    func findPoint(_ a: Point, _ b: Point, _ c: Point, _ d: Point) -> Point? {
        let px = (a.x * b.y - a.y * b.x) * (c.x - d.x) - (a.x - b.x) * (c.x * d.y - c.y * d.x);
        let py = (a.x * b.y - a.y * b.x) * (c.y - d.y) - (a.y - b.y) * (c.x * d.y - c.y * d.x);
        let p = (a.x - b.x) * (c.y - d.y) - (a.y - b.y) * (c.x - d.x);
        
        if p == 0 {
            if b == c && a <= c { return b }
            else if a == d && c <= a { return a }
            return nil
        }
        let x = px / p
        let y = py / p
        
        return (x, y)
    }
    
    let p1p2p3 = CCW(a,b,c)
    let p1p2p4 = CCW(a,b,d)
    let p3p4p1 = CCW(c,d,a)
    let p3p4p2 = CCW(c,d,b)
    //print(p1p2p3, p1p2p4, p3p4p1, p3p4p2)
    
    if p1p2p3 * p1p2p4 == 0 && p3p4p1 * p3p4p2 == 0 {
        if a > b { swap(&a, &b) }
        if c > d { swap(&c, &d) }
        if a <= d && b >= c {
            print(1)
            if let point = findPoint(a, b, c, d) {
                print(point.x, point.y)
            }
        } else {
            print(0)
        }
    } else if p1p2p3 * p1p2p4 <= 0 && p3p4p1 * p3p4p2 <= 0 {
        print(1)
        if let point = findPoint(a, b, c, d) {
            print(point.x, point.y)
        }
        
    } else {
        print(0)
        
    }
}
solution()

```
## 2162 [선분 그룹](https://www.acmicpc.net/problem/2162)
선분 교차 2의 문제에서 해당 선분들이 연결되어있는지 그룹별로 확인하는 문제이다.   
따라서 해당 선분들에 번호를 메기고 해당 선분들이 연결되어있는지 확인하기 위해    
uion-find를 활용해준다.   
처음 선분들을 따로 arr에 저장해주고,   
2중반복문으로 해당 선분들을 서로 모두 검사해준다.   
6%에서 실패 -> overlap부분을 하지 않아서 실패가 났다.   
swap부분을 추가해주니 해결되었다.   
16%부분의 오류 -> dictionary 부분에서 오류가 발생하였다.   
해당 parent 배열을 정렬 후, 최대 값을 + 해주어 출력해주니 오류가 해결되었다.   

```
import Foundation
func solution(){
    func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    typealias Point = (x: Double, y: Double)
    let n = Int(readLine()!)!
    var arr: [(Point,Point)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Double($0)!}
        arr.append((Point(x: input[0], y: input[1]), Point(x: input[2], y: input[3])))
    }
    
    func CCW(_ a: Point, _ b: Point, _ c: Point) -> Int {
        let x = (a.x * b.y + b.x * c.y + c.x * a.y)
        let y = (a.y * b.x + b.y * c.x + c.y * a.x)
        
        return x-y == 0 ? 0 : x-y > 0 ? 1 : -1
    }
    
    var parent = [Int](0..<n)
    
    for i in 0..<n-1 {
        for j in i+1..<n {
            let value = [CCW(arr[i].0, arr[i].1, arr[j].0) * CCW(arr[i].0, arr[i].1, arr[j].1), CCW(arr[j].0, arr[j].1, arr[i].0) * CCW(arr[j].0, arr[j].1, arr[i].1)]
            if value[0] == 0 && value[1] == 0 {
                var a = arr[i].0, b = arr[i].1
                var c = arr[j].0, d = arr[j].1
                if a > b { swap(&a, &b)}
                if c > d { swap(&c, &d)}
                if a <= d && b >= c {
                    if parent[i] != parent[j] {
                        union(i, j)
                    }
                }
            } else if value[0] <= 0 && value[1] <= 0 {
                if parent[i] != parent[j] {
                    union(i, j)
                }
            }
        }
    }
    
    
    //print(parent)
    (0..<n).forEach{find($0)}
    print(Set(parent).count)
    print(Dictionary(parent.map { ($0, 1) }, uniquingKeysWith: +).values.max()!)

//    print(dict.count)
//    print(dict.max(by: {$0.value < $1.value})!.value)
}
solution()

```
