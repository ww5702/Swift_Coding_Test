# 부분구간 안에 있는 수들의 합을 빠르게 구해 봅시다.
## 11659 구간 합 구하기 4
수 N개가 주어졌을 때, i번째 수부터 j번째 수까지 합을 구하는 프로그램을 작성하시오.   
```
import Foundation
 
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let arr : [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    var readysum = Array(repeating: 0, count : input[0]+1)
    readysum[1] = arr[0]
    for i in 2..<input[0]+1 {
        readysum[i] = readysum[i-1] + arr[i-1]
    }
    for _ in 0..<input[1] {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        print(readysum[input[1]] - readysum[input[0]-1])
    }
}

solution()
```
DP로 풀던 방식과 비슷하게 미리 구간합을 구해놓은 다음, 구간을 입력받아서   
3,1 이라고 한다면, sum[3] - sum[0]으로 풀었다.   

## 2559 수열
매일 아침 9시에 학교에서 측정한 온도가 어떤 정수의 수열로 주어졌을 때, 연속적인 며칠 동안의 온도의 합이 가장 큰 값을 알아보고자 한다.   
예를 들어, 아래와 같이 10일 간의 온도가 주어졌을 때,    
3 -2 -4 -9 0 3 7 13 8 -3   
모든 연속적인 이틀간의 온도의 합은 아래와 같다.   
   
![image](https://user-images.githubusercontent.com/60501045/217515220-49cffa37-6a03-49f0-92c1-0ef1fbde8a21.png)   
   
이때, 온도의 합이 가장 큰 값은 21이다.   
또 다른 예로 위와 같은 온도가 주어졌을 때, 모든 연속적인 5일 간의 온도의 합은 아래와 같으며,   
   
![image](https://user-images.githubusercontent.com/60501045/217515238-63dfdc9b-97f4-409f-b220-d38cbd599099.png)   
   
이때, 온도의 합이 가장 큰 값은 31이다.   
매일 측정한 온도가 정수의 수열로 주어졌을 때, 연속적인 며칠 동안의 온도의 합이 가장 큰 값을 계산하는 프로그램을 작성하시오.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
let (n,k) = (input[0],input[1])
var arr : [Int] = readLine()!.split(separator:" ").map{Int($0)!}
var sumarr : [Int] = Array(repeating : 0, count : arr.count)
sumarr[0] = arr[0]

for i in stride(from:1, to:arr.count, by : 1) {
	sumarr[i] += arr[i] + sumarr[i-1]
}

var result = Int
for i in 0..<sumarr.count {
	var sum = 0
	if i-k < -1 { continue }
	if i-k == -1 {
		sum = sumarr[i]
	} else {
		sum = sumarr[i] - sumarr[i-k]
	}
	result = max(result, sum)
}
print(result)
```
누적합을 미리 구해놓은 다음 규칙을 알아내어 결과를 도출해 내는 문제이다.   
5개의 연속으로 합을 구할 경우   
6번째부터의 sumarr[i]의 경우 sum = sumarr[i] - sumarr[i-5]이라는 규칙을 알아낼 수 있다면 풀 수 있는 문제.   

## 16139 인간-컴퓨터 상호작용
승재는 인간-컴퓨터 상호작용에서 생체공학 설계를 공부하다가 키보드 자판이 실용적인지 궁금해졌다. 이를 알아보기 위해 승재는 다음과 같은 생각을 했다.   
'문자열에서 특정 알파벳이 몇 번 나타나는지 알아봐서 자주 나타나는 알파벳이 중지나 검지 위치에 오는 알파벳인지 확인하면 실용적인지 확인할 수 있을 것이다.'   
   
승재를 도와 특정 문자열 S, 특정 알파벳 alpha와 문자열의 구간 [l,r]이 주어지면 S의 l번째 문자부터 r번째 문자 사이에   
alpha가 몇 번 나타나는지 구하는 프로그램을 작성하여라.   
승재는 문자열의 문자는 0번째부터 세며, l번째와 r번째 문자를 포함해서 생각한다.   
주의할 점은 승재는 호기심이 많기에 (통계적으로 크게 무의미하지만) 같은 문자열을 두고 질문을 q번 할 것이다.  
```
import Foundation

let word = Array(readLine()!)
let question = Int(readLine()!)!
var d = Array(repeating: Array(repeating: 0, count : word.count), count : 26)

for i in 0..<26 {
	var ch = Character(UnicodeScalar(97+i)!)	// a부터 z까지 ch에 입력
	if word[0] == ch { d[i][0] = 1 }	// word[0]이 a라면? ~ z라면?
	for j in 1..<word.count {
		if word[j] == ch { d[i][j] = d[i][j-1] + 1 }
		else { d[i][j] = d[i][j-1] }
	}
}

for i in 0..<question {
	let input = readLine()!.components(separatedBy:" ")
	let (a,start,end) = (Int(UnicodeScalar(input[0])!.value), Int(input[1])!, Int(input[2])!)
	start == 0 ? print(d[a-97][end]) : print(d[a-97][end] - d[a-97][start-1])
}
```
알파벳을 숫자로 순서대로 변경시켜 누적합을 시켜주는 문제이다.   
components나 UnicodeScalar를 너무 오랜만에 써서 오래 걸렸다.   
```
import Foundation

let word = readLine()!.map{String($0)}
let question = Int(readLine()!)!

var d = Array(repeating: Array(repeating: 0, count : 26), count : word.count)

for i in 0..<word.count {
	if i != 0 {
		for j in 0..<26 {
			d[i][j] = d[i-1][j]
		}
	}
	d[i][Int(UnicodeScalar(word[i])!.value) - 97] += 1
	// 주어진 word를 숫자로 반환하여 해당 숫자가 i번째에 몇개 있는지 확인
	// i = 1에는 s가 +1
	// i = 2에는 i = 1 일때에 더해 e가 + 1 
}

for _ in 0..<question {
	let input = readLine()!.split(separator:" ").map{String($0)}
	let index = Int(UnicodeScalar(input[0])!.value) - 97
	// 입력받은 a를 숫자로 다시 변환 -> 0이 반환된다.
	let start = Int(input[1])! , end = Int(input[2])!
	
	if start - 1 >= 0 {
		print(d[end][index] - d[start-1][index])
	} else {
		print(d[end][index])
	}
	// 입력받은 a의 숫자인 0이 몇개있는지 확인
}
```
같은 방식으로 풀어진 문제인데 밑에 정답제출은 100점이 나온다.   

## 10986 나머지 합
수 N개 A1, A2, ..., AN이 주어진다. 이때, 연속된 부분 구간의 합이 M으로 나누어 떨어지는 구간의 개수를 구하는 프로그램을 작성하시오.   
즉, Ai + ... + Aj (i ≤ j) 의 합이 M으로 나누어 떨어지는 (i, j) 쌍의 개수를 구해야 한다.   
```
import Foundation
 
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (m,n) = (input[0],input[1])
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    var cnt = 0
    
    var dp = Array(repeating: Array(repeating : 0 , count : arr.count), count : arr.count)
    for i in 0..<m {
        dp[0][i] = arr[i]
    }
    dp[1][0] = arr[0] + arr[1]
    for i in 1..<m-1 {
        dp[1][i] = dp[1][i-1] + arr[i+1]
    }
    for i in 2..<m {
        dp[i][0] = dp[i-1][1]
        for j in 1..<m-i {
            dp[i][j] = dp[i][j-1] + arr[j+i]
        }
    }
    print(dp)
    for i in 0..<m {
        for j in 0..<m-(i+1) {
            if dp[i+1][j] % n == 0 {
                cnt += 1
            }
        }
    }
    print(cnt)
}

solution()
```
처음 풀었을 때에는 누적합을 구하는데에만 풀이할 수 밖에 없었다.   
```
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (input[0],input[1])

var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var preFix = Array(repeating: 0, count: arr.count)
var count = Array(repeating: 0, count: m)

for i in 0..<arr.count {
	if i == 0 {
		preFix[i] = arr[i]
	} else {
		preFix[i] = arr[i] + preFix[i-1]
	}
	count[preFix[i] % m] += 1
}

//print(preFix, count)

var result = 0
for i in 0..<m {
	result += (count[i] * (count[i]-1)) / 2
}
print(result + count[0])
```
i+1부터 j까지의 누적합은 곧 preFix[j] - preFix[i]이다.   
또한 m으로 나눠 0이 된다는것은 곧 (preFix[j] - preFix[i]) % m = 0 이다.   
그리고 위 점화식은 다시 말하면 (preFix[j] % m) - (preFix[i] % m) = 0이고,   
preFix[j] % m = preFix[i] % m이 된다.   
   
count의 배열에 0에는 %m이 0인 경우, 1에는 %m이 1인 경우의 규칙으로 넣어준다.   

## 11660 구간 합 구하기 5
N×N개의 수가 N×N 크기의 표에 채워져 있다. (x1, y1)부터 (x2, y2)까지 합을 구하는 프로그램을 작성하시오. (x, y)는 x행 y열을 의미한다.   
예를 들어, N = 4이고, 표가 아래와 같이 채워져 있는 경우를 살펴보자.   
   
![image](https://user-images.githubusercontent.com/60501045/219348491-5093627e-823f-47ad-85dc-5328b49ef56b.png)   
   
여기서 (2, 2)부터 (3, 4)까지 합을 구하면 3+4+5+4+5+6 = 27이고, (4, 4)부터 (4, 4)까지 합을 구하면 7이다.   
표에 채워져 있는 수와 합을 구하는 연산이 주어졌을 때, 이를 처리하는 프로그램을 작성하시오.   
```
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (input[0],input[1])

var arr = [Array(repeating: 0, count : n+1)]
var dp = Array(repeating: Array(repeating: 0 , count:n+1), count:n+1)

// arr입력
for _ in 0..<n {
    arr.append([0] + readLine()!.split(separator: " ").map{Int(String($0))!})
}
//print(arr)
// 누적합
// dp[2][3]은 정확히 가로2칸 세로3칸의 누적합을 뜻한다.
for i in 1...n {
    for j in 1...n {
        dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + arr[i][j]
    }
}
//print(dp)

for _ in 0..<m {
	let input = readLine()!.split(separator:" ").map{Int($0)!}
	let (x1,y1,x2,y2) = (input[0],input[1],input[2],input[3])
	print(dp[x2][y2] - dp[x1-1][y2] - dp[x2][y1-1] + dp[x1-1][y1-1])
}
```
누적합을 [3][3]이면 가로 3칸 세로 3칸의 누적합을 구해서 dp에 넣어준다.   
그후 x1,y1,x2,y2값을 받게 된다면 x2,y2의 누적값에 중복되어 더해진 누적합부분과 두번빼진 누적합부분을 더해준다.   
   
![image](https://user-images.githubusercontent.com/60501045/219357187-22bd8042-ae44-4550-ae9c-92cb01c536c9.png)   
   
위의 그림처럼 검정색의 누적합 - 빨간색의 누적합 - 파란색의 누적합 + 초록색의 누적합을 하게 된다면   
   
![image](https://user-images.githubusercontent.com/60501045/219357381-7c3ffd2c-e9e8-497c-bf8e-1a5657a7f70a.png)   
   
별표 친 공백칸의 누적합을 구할 수 있다.   

## 체스판 다시 칠하기2
2차원배열 누적합을 사용하여 풀이한다.   
(y,x)까지의 누적합은 (y-1)(x) + (y-1)(x) - (y)(x) + 현재 바둑판 색이다.   
이렇게 처음(0,0)이 W(흰색)으로 칠해질때와, B(검정색)으로 칠해지는   
두가지 경우의 수를 구해준다.   
K에 따라 minCount를 구해줘야할 범위가 정해지는데   
(0,0)부터 K가 3일때 (3,3)까지의 누적합은   
(3,3) - (3,0) - (0,3) + (0,0) 이다.   
(1,0)부터 (4,3)도   
(4,3) - (1,3) - (4,0) + (1,0) 이다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (N,M,K) = (input[0],input[1],input[2])
    var chess: [[String]] = []
    for _ in 0..<N {
        chess.append(readLine()!.map{String($0)})
    }
    //print(chess)
    func makeSum(_ color: String) -> [[Int]] {
        var board: [[Int]] = Array(repeating:Array(repeating: 0, count: M+1),count:N+1)
        var result = 0
        // x,y좌표에 따라 해당 color와 같은지
        for y in 0..<N {
            for x in 0..<M {
                if (y+x)%2 == 0 {
                    result = chess[y][x] == color ? 0 : 1
                } else {
                    result = chess[y][x] != color ? 0 : 1
                }
                board[y+1][x+1] = board[y][x+1] + board[y+1][x] - board[y][x] + result
            }
        }
        return board
    }
    // 최솟값 구하기
    func minCount(_ board: [[Int]]) -> Int {
        var minSum = Int.max
        for y in 1...N-K+1 {
            for x in 1...M-K+1 {
                let value = board[y+K-1][x+K-1] - board[y-1][x+K-1] - board[y+K-1][x-1] + board[y-1][x-1]
                minSum = min(minSum,value)
            }
        }
        return minSum
    }
    print(min(minCount(makeSum("B")),minCount(makeSum("W"))))
}

solution()

```
