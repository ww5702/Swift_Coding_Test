# 정수론과 조합론을 배워 봅시다.
## 15439 베라의 패션
```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    print(N*(N-1))
}
solution()

```
## 24723 녹색 거탑
```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    print(pow(2.0, N))
}
solution()

```

## 5086 / 배수와 약수
4 × 3 = 12이다.   
이 식을 통해 다음과 같은 사실을 알 수 있다.   
3은 12의 약수이고, 12는 3의 배수이다.   
4도 12의 약수이고, 12는 4의 배수이다.   
두 수가 주어졌을 때, 다음 3가지 중 어떤 관계인지 구하는 프로그램을 작성하시오.   
   
1. 첫 번째 숫자가 두 번째 숫자의 약수이다.
2. 첫 번째 숫자가 두 번째 숫자의 배수이다.
3. 첫 번째 숫자가 두 번째 숫자의 약수와 배수 모두 아니다.
```
while(true){
	let input = readLine()!.split(separator:" ").map{Int($0)!}
	if input[0] == 0 && input[1] == 0{ break }
	if input[1] % input[0] == 0 {
		print("factor")
	} else if input[0] % input[1] == 0 {
		print("multiple")
	} else {
		print("neither")
	}
}
```
## 1037 / 약수
양수 A가 N의 진짜 약수가 되려면, N이 A의 배수이고, A가 1과 N이 아니어야 한다.   
어떤 수 N의 진짜 약수가 모두 주어질 때, N을 구하는 프로그램을 작성하시오.   
```
let cnt = Int(readLine()!)!
let input = readLine()!.split(separator:" ").map{Int($0)!}
print(input.min()! * input.max()!)
```
1과 n본인의 수를 뺐을때 가장 작은 수 X 가장 큰 수가 N이 나오는 규칙성을 찾는다.   
## 2609 / 최대공약수와 최소공배수
두 개의 자연수를 입력받아 최대 공약수와 최소 공배수를 출력하는 프로그램을 작성하시오.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
var result = 0
var cnt = 1
while true {
	if input[0] % cnt == 0 && input[1] % cnt == 0 {
		result = cnt
	}
	if cnt % input[0] == 0 && cnt % input[1] == 0 {
		break
	}
	cnt += 1
}
print("\(result)\n\(cnt)")
```
최대공약수와 최소공배수를 구해주는 문제   
하지만 위의 풀이방식은 1씩 증가시켜주는 풀이로 시간이 오래 걸린다.   
```
import Foundation

let nums = readLine()!.split(separator: " ").map{Int(String($0))!}

var max = nums.max()!
var min = nums.min()!
var r = max%min

while r > 0 {
    max = min
    min = r
    r = max%min
}

print(min)
print(nums[0]*nums[1]/min)
```
유클리드 호제법을 사용하면 더 빠르게 구할 수 있다.   
최대공약수는 a/b를 했을 때 나머지가 0이라면 b가 a와 b의 최대공약수이고   
나머지가 0이 아니라면 b를 나머지로 다시 나눠준다.   
b를 나머지로 나눈 나머지가 0이라면 그 나머지가 a와 b의 최대공약수이고 또 0이 아니라면 계속해서 나머지로 나눠준다.   
최소공배수는 최대공약수를 이용하면 쉽게 풀수 있는데 a x b / 최대공약수 = 최소공배수 라는 공식을 이용한다.   
## 1934 / 최소공배수
두 자연수 A와 B에 대해서, A의 배수이면서 B의 배수인 자연수를 A와 B의 공배수라고 한다.   
이런 공배수 중에서 가장 작은 수를 최소공배수라고 한다.   
예를 들어, 6과 15의 공배수는 30, 60, 90등이 있으며, 최소 공배수는 30이다.   
   
두 자연수 A와 B가 주어졌을 때, A와 B의 최소공배수를 구하는 프로그램을 작성하시오.   
```
let t = Int(readLine()!)!
var cnt = 1
for _ in 0..<t {
	while true {
		let input = readLine()!.split(separator:" ").map{Int($0)!}
		if cnt % input[0] == 0 && cnt % input[1] == 0 {
			print(cnt)
			break
		}
	}
}
```
이 문제도 전 문제와 같은 방식으로 풀 수 있지만 입력값이 45000과 같은 큰 값일 경우 계산을 45000번 해줘야한다는 단점이 있다.   
```
//최소공배수 = 두 자연수의 곱 / 최대공약수
let t = Int(readLine()!)!
for _ in 0..<t {
	let input = readLine()!.split(separator:" ").map{Int($0)!}
	var max = input.max()!
	var min = input.min()!
	var r = max % min
 
	while r > 0 {
		max = min
		min = r
		r = max % min
	}
	print(input[0] * input[1] / min)
 
}
```
따라서 유클리드 호제법을 이용해 최대공약수를 구한 후   
최소공배수 = 두 자연수의 곱 / 최대공약수 라는 공식을 이용해 풀어준다.   
## 2981 / 검문
트럭을 타고 이동하던 상근이는 경찰의 검문을 받게 되었다.   
경찰은 상근이가 운반하던 화물을 하나하나 모두 확인할 것이기 때문에, 검문하는데 엄청나게 오랜 시간이 걸린다.   
   
상근이는 시간을 때우기 위해서 수학 게임을 하기로 했다.   
먼저 근처에 보이는 숫자 N개를 종이에 적는다. 그 다음, 종이에 적은 수를 M으로 나누었을 때,   
나머지가 모두 같게 되는 M을 모두 찾으려고 한다. M은 1보다 커야 한다.   
   
N개의 수가 주어졌을 때, 가능한 M을 모두 찾는 프로그램을 작성하시오.   
```
import Foundation

let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
	arr.append(Int(readLine()!)!)
}

var result = Set<Int>()
for i in 0..<n-1 {
	var max = arr[i+1]
	var min = arr[i]
	var r = max%min

	while r > 0 {
    	max = min
    	min = r
	 	result.insert(min)
		r = max%min
	}
}
result.sorted(by:<)
for i in result {
	print(i, terminator:" ")
}
```
예를 들어 24와 45를 7로 나눈 나머지가 3으로 같을 때,   
큰수인 45 - 작은수인 24를 했을때 21, 즉 7의 배수가 나오게 된다.   
이를 이용해 배열속의 수를 서로 뺀 후 두 수 의 최대공약수를 중복저장이 안되는 set배열속에 저장하여 출력해보았다.   
하지만 첫 제출은 출력초과가 나온다. 위 제출은 수가 세개일때만 가능했던 정답이기에 수가 여러개일수록 허점이 있다.   
```
import Foundation
var arr: [Int] = []
var tmp: [Int] = []
for _ in 0 ..< Int(readLine()!)! {
    arr.append(Int(readLine()!)!)
}
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    else { return gcd(b, a % b)}
}

func cd(_ a: Int) -> [Int] {
    var result: [Int] = []
    for i in 2..<Int(sqrt(Double(a))+1) {
        if a % i == 0 {
            result.append(i)
            result.append(a / i)
        }
    }
    result.append(a)
    return result
}

for i in 1..<arr.count {
    tmp.append(abs(arr[i]-arr[i-1]))
}
var n = tmp[0]
for i in 1..<tmp.count {
    n = gcd(n, tmp[i])
}
var result = Array(Set(cd(n))).sorted()
for i in result {
    print(i, terminator: " ")
}
```

## 3036 / 링
상근이는 창고에서 링 N개를 발견했다. 상근이는 각각의 링이 앞에 있는 링과 뒤에 있는 링과 접하도록 바닥에 내려놓았다.   
   
<img width="276" alt="스크린샷 2023-01-18 오후 3 08 52" src="https://user-images.githubusercontent.com/60501045/213097355-55bbc127-a17b-4673-93bb-d3357d3750f5.png">   
   
상근이는 첫 번째 링을 돌리기 시작했고, 나머지 링도 같이 돌아간다는 사실을 발견했다.   
나머지 링은 첫 번째 링 보다 빠르게 돌아가기도 했고, 느리게 돌아가기도 했다.   
이렇게 링을 돌리다 보니 첫 번째 링을 한 바퀴 돌리면, 나머지 링은 몇 바퀴 도는지 궁금해졌다.   
   
링의 반지름이 주어진다. 이때, 첫 번째 링을 한 바퀴 돌리면, 나머지 링은 몇 바퀴 돌아가는지 구하는 프로그램을 작성하시오.   
```
let n = Int(readLine()!)!
let input = readLine()!.split(separator:" ").map{Int($0)!}
for i in 1..<n {
	var max = input[0]
	var min = input[i]
	var r = max % min
	
	while r > 0 {
		max = min
		min = r
		r = max % min
	}
	
	print("\(input[0]/min)/\(input[i]/min)")
	
}
```
A/B를 약분하여 기약분수의 형태로 나타내는꼴이므로 더이상 약분할 수 없을때까지 약분하는것은   
A와 B에 최대공약수를 나누는것과 같다.   

## 11050 / 이항 계수 1
자연수 N과 정수 K가 주어졌을 때 이항 계수를 구하는 프로그램을 작성하시오.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}

func factorial (_ n : Int) -> Int {
	if n == 1 {
		return 1
	} else {
		return n * factorial(n-1)
	}
}
var a = factorial(input[0])
var b = factorial(input[1])
var c = factorial(input[0]-input[1])
print(a/(b*c))
```
이항계수를 알고 팩토리얼을 쓸 수 있다면 풀기 쉬운 문제였다.   
이항계수 (n,k)는 n!/k!(n-k)! 이다   
하지만 위 풀이방식은 n이 15만 넘어도 계산이 1조가 넘는다.   
따라서 동적 계획법을 사용해 풀이   
동적계획법이란 쉽게 말해서 기억하며 풀기이다.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}

func factorial (_ n : Int, _ k : Int) -> Int {
	if k == 0 || n == k {
		return 1
	}
	return factorial(n-1, k) + factorial(n-1, k-1)
}

print(factorial(input[0], input[1]))
```
두번째 풀이이다.   
이 풀이로 메모리 단축에 성공하였지만 부분문제의 중복으로 성능이 치명적으로 나쁘다.   
아래는 피보나치 수열에 대한 반복구현 실행흐름이다.   
   
<img width="521" alt="스크린샷 2023-01-17 오후 4 23 53" src="https://user-images.githubusercontent.com/60501045/212834869-54a7f14e-86d9-4202-8fd4-fb81d141e37a.png">   
   
위와 같이 같은 피보나치 수열이 반복해서 수행된다는 점에서 쓸데없는 시간을 잡아먹고 있다는 것이다.   
동적 계획법은 이미 구한 부분문제의 대답을 캐쉬에 저장해 또 구해야할 답을 계산할 필요를 없애준다.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
var cash = Array(repeating:Array(repeating:0, count: input[1]+1), count: input[0]+1)

func bino_coef (_ n : Int, _ k : Int) -> Int {
	for i in 0...n {
		cash[i][0] = 1
	}
	for i in 0...k {
		cash[i][i] = 1
	}
	
	for i in 1...n {
		for j in 1...k {
			cash[i][j] = cash[i-1][j] + cash[i-1][j-1]
		}
	}
	return cash[n][k]
}

print(bino_coef(input[0], input[1]))
```
세번째 풀이이다.   
2차원배열로 부분문제의 이항계수를 한번 계산 후 저장해준다.   
   
<img width="244" alt="스크린샷 2023-01-17 오후 5 04 40" src="https://user-images.githubusercontent.com/60501045/212842259-dddaa0b1-0a85-4d5a-ba9b-d11803162e6b.png">   
   
그림과 같이 [i][0]과 [i][i]은 1로 고정되어있기에 고정시켜준 뒤 나머지 계산을 끝낸 후 저장해준다.   


***
위의 두 방법은 가장 일반적이고 유용하지만 확장과는 거리가 있어 새로운 방법을 공부해봤다.   
계산이 아닌 뽑는다는 개념으로 접근한다.   
n에 대해 k개의 아이템을 뽑는다. 즉 아이템을 선택할 기회가 n번 있을 때 결국 k를 뽑았을 경우의 수와 일치한다.   
주어진 기회는 n번이며 선택할 수 있는 경우는 1 고른다 0 고르지 않는다 두개 뿐이다.   
func(times, got)   
***

## 11051 / 이항 계수 2
자연수 N과 정수 K가 주어졌을 때 이항 계수를 10,007로 나눈 나머지를 구하는 프로그램을 작성하시오.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
var cash = Array(repeating:Array(repeating:0, count: input[0]+1), count: input[0]+1)

func bino_coef (_ n : Int, _ k : Int) -> Int {
	for i in 0...n {
        for j in 0...i {
            if i == 0 || j == 0 || i == j {
                cash[i][j] = 1
            } else {
                cash[i][j] = (cash[i-1][j-1] % 10007 + cash[i-1][j] % 10007) % 10007
            }
        }
    }
	return cash[n][k]
}

print(bino_coef(input[0], input[1]))
```
미리 전 문제에서 더 자세하게 풀이한 덕분에 쉽게 풀 수 있었다.   
요점은 print(bino_coef(input[0], input[1])) 에 깡으로   
print(bino_coef(input[0], input[1]) % 10007)을 해주는것이 아닌 계산식때부터 10007을 나눠줘 저장해주는 것이다.   

## 1010 / 다리 놓기
재원이는 한 도시의 시장이 되었다. 이 도시에는 도시를 동쪽과 서쪽으로 나누는 큰 일직선 모양의 강이 흐르고 있다.   
하지만 재원이는 다리가 없어서 시민들이 강을 건너는데 큰 불편을 겪고 있음을 알고 다리를 짓기로 결심하였다.   
강 주변에서 다리를 짓기에 적합한 곳을 사이트라고 한다.   
재원이는 강 주변을 면밀히 조사해 본 결과 강의 서쪽에는 N개의 사이트가 있고   
동쪽에는 M개의 사이트가 있다는 것을 알았다. (N ≤ M)   
   
재원이는 서쪽의 사이트와 동쪽의 사이트를 다리로 연결하려고 한다. (이때 한 사이트에는 최대 한 개의 다리만 연결될 수 있다.)    
재원이는 다리를 최대한 많이 지으려고 하기 때문에 서쪽의 사이트 개수만큼 (N개) 다리를 지으려고 한다.   
다리끼리는 서로 겹쳐질 수 없다고 할 때 다리를 지을 수 있는 경우의 수를 구하는 프로그램을 작성하라.   
   
<img width="325" alt="스크린샷 2023-01-18 오후 3 30 44" src="https://user-images.githubusercontent.com/60501045/213100622-f11bf36d-d119-4e6e-aaf1-89639b230b30.png">   
   
```
// 비 중복조합 공식
// nCk = C(n,k) = n! / (n-k)!k!

let t = Int(readLine()!)!

func solution(_ n : Int, _ k : Int) -> Int {
	if n == k || k == 0 { return 1 }
	return solution(n-1, k) + solution(n-1, k-1)
}
for _ in 0..<t {
	let input = readLine()!.split(separator:" ").map{Int($0)!}
	let (m, n) = (input[0],input[1])
	print(solution(n,m))
}

```
중복조합 공식 그리고 이항계수 공식과 같았기에 똑같이 풀이했지만 시관초과.   
따라서 2차원배열을 선언 후 저장하여 출력하는 형식으로 동적계획법으로 풀이한다.   
```
// 비 중복조합 공식
// nCk = C(n,k) = n! / (n-k)!k!

let t = Int(readLine()!)!

for _ in 0..<t {
	let input = readLine()!.split(separator:" ").map{Int($0)!}
	let (m, n) = (input[0],input[1])
	var cash = Array(repeating: Array(repeating:0, count: m+1), count: n+1)
	
	func solution(_ n : Int, _ k : Int) -> Int {
		for i in 0...n {
			cash[i][0] = 1
		}
		for i in 0...k {
			cash[i][i] = 1
		}
		
		for i in 1...n {
			for j in 1...k {
				cash[i][j] = cash[i-1][j] + cash[i-1][j-1]
			}
		}
		return cash[n][k]
		}

	print(solution(n,m))
}
```
코드를 정리하여 좀더 시간 단축을 할 수 있었다.   
```
// 비 중복조합 공식
// nCk = C(n,k) = n! / (n-k)!k!

let t = Int(readLine()!)!
func solution(_ n : Int, _ k : Int) -> Int {
	var cash = Array(repeating: Array(repeating:0, count: k+1), count: n+1)
	for i in 0...n {
		cash[i][0] = 1
	}
	for i in 0...k {
		cash[i][i] = 1
	}
	
	for i in 1...n {
		for j in 1...k {
			cash[i][j] = cash[i-1][j] + cash[i-1][j-1]
		}
	}
	return cash[n][k]
}
for _ in 0..<t {
	let input = readLine()!.split(separator:" ").map{Int($0)!}
	let (m, n) = (input[0],input[1])

	print(solution(n,m))
}
```
## 9375 패션왕 신해빈
해빈이는 패션에 매우 민감해서 한번 입었던 옷들의 조합을 절대 다시 입지 않는다.   
예를 들어 오늘 해빈이가 안경, 코트, 상의, 신발을 입었다면, 다음날은 바지를 추가로 입거나 안경대신 렌즈를 착용하거나 해야한다.   
해빈이가 가진 의상들이 주어졌을때 과연 해빈이는 알몸이 아닌 상태로 며칠동안 밖에 돌아다닐 수 있을까?   
```
import Foundation
let t = Int(readLine()!)!	// 테스트 케이스의 수

for _ in 0..<t {
	let n = Int(readLine()!)!	// 의상의 수
	var clothesDict: Dictionary<String, [String]> = [:]		// 의상을 저장할 dict
	
	for _ in 0..<n {
		let input = readLine()!.components(separatedBy:" ")	// 공백으로 자름
		
		if clothesDict[input.last!] == nil {	// 키가 없다면 생성
			clothesDict[input.last!] = [input.first!]
		} else { // 있다면 append
			clothesDict[input.last!]?.append(input.first!)
		}
	}
	var cnt = 1
	for clothes in clothesDict {
		cnt *= clothes.value.count + 1
	}
	print(cnt-1)
	
}
```
dictonary를 이용해서 같은 headgear 혹은 hat의 키이면 같은 칸으로 이동하여 경우의 수를 증가시키고   
옷을 안입을 경우도 존재하기 때문에 +1 하여 계산해야 한다는 점을 유의한다.   
(a+1) x (b+1) x (c+1) -1 와 같은 방식으로 계산해주는것이다.   
-1을 하는 이유는 전부 안입을 경우의 수를 빼주는것.   

## 1676 팩토리얼 0의 개수
N!에서 뒤에서부터 처음 0이 아닌 숫자가 나올 때까지 0의 개수를 구하는 프로그램을 작성하시오.   
```
let n = Int(readLine()!)!
func factorial(_ n : Int) -> Int {
	if n == 1 { return 1 }
	return n * factorial(n-1)
}

func solution(_ n: Int64) -> [Int] {
	var result: [Int] = []
	for i in String(n).reversed() {
		guard let num = Int(String(i)) else { break }
		result.append(num)
	}
	return result
}
let result = solution(Int64(factorial(n)))
var cnt = 0

for i in result {
	if i != 0 { break }
	cnt += 1
}
print(cnt)
```
풀이 과정은 나름 쉬웠다.   
해당정수의 팩토리얼 값을 구한 뒤, 그 값을 뒤에서부터 배열로 저장시킨다.   
반복문을 통해 0이 아닌 수가 나오면 cnt를 반환시켜준다.   
하지만 n<=500이기 때문에 런타임 에러가 나온다.   
```
let n = Int(readLine()!)!
var cnt = 0

for i in 1..<n+1 {
	var num = i
	while num > 0, num%5 == 0 {
		cnt += 1
		num /= 5
	}
}
print(cnt)
```
다른 방법으로는 더 단순하게 생각해서 뒤에서부터 0의 개수는 10의 배수를 의미하는데   
10은 2x5이므로 5로 나눴을때의 개수를 알면 10의 개수를 알수 있고 10의 개수당 0의 개수를 알 수 있다.
1x2x3x4x5x6x7x8x9x10 일때 5로 나눴을때 나머지가 0이면 뒷자리에 0이 하나씩 늘어난다는 것을 의미한다.   
```
import Foundation

let n = Int(readLine()!)!
print(n/5 + n/25 + n/125)
```
찾다보니 이런 풀이도 찾을 수 있었는데, 어차피 n의 max값이 500이므로 위의 풀이와 비슷하지만 나눠지는 5의 n승값은
5, 25, 125밖에 없다. 따라서 저런 풀이도 가능하다;;   

## 2004 조합 0의 개수
조합(n,m)의 끝자리 0의 개수를 출력하는 프로그램을 작성하시오.   
단 m과 n은 2,000,000,000까지 들어갈 수 있다.   
```
import Foundation

let nums = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nums[0]
let m = nums[1]

func get2(_ num: Int) -> Int {
    var count = 0
    var i = 2
    while num >= i {
        count += num/i
        i *= 2
    }
    return count
}

func get5(_ num: Int) -> Int {
    var count = 0
    var i = 5
    while num >= i {
        count += num/i
        i *= 5
    }
    return count
}

let a = get2(n) - (get2(m)+get2(n-m))
let b = get5(n) - (get5(m)+get5(n-m))

print(a>b ? b : a)
```
이 또한 입력값의 n-m부터 n까지의 개수에서 1~n-m까지의 개수를 빼주는 방식으로 풀이하였다.   
이 풀이를 가독성있게 더 줄이면
```
let n = readLine()!.split(separator: " ").map { Int($0)! }
let r = n[0]-n[1]
var i = 5, j = 2
var a = 0, b = 0
func get(_ a: Int) -> Int {
    var result = 0
    var i = a
    while i <= n[0] {
        result += n[0]/i
        result -= n[1]/i
        result -= r/i
        i *= a
    }
    return result
}
print(min(get(5), get(2)))
```
가 된다.   
