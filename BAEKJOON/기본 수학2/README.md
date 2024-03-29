# 소수와 기하 구하기 챕터   
## 2501 약수 구하기
어떤 자연수 p와 q가 있을 때, 만일 p를 q로 나누었을 때 나머지가 0이면 q는 p의 약수이다.   
6을 예로 들면   
6 ÷ 1 = 6 … 0   
6 ÷ 2 = 3 … 0   
6 ÷ 3 = 2 … 0   
6 ÷ 4 = 1 … 2   
6 ÷ 5 = 1 … 1   
6 ÷ 6 = 1 … 0   
그래서 6의 약수는 1, 2, 3, 6, 총 네 개이다.   
두 개의 자연수 N과 K가 주어졌을 때, N의 약수들 중 K번째로 작은 수를 출력하는 프로그램을 작성하시오.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
let (n,k) = (input[0],input[1]-1)
var arr : [Int] = []
for i in 1..<n {
	if n % i == 0 { arr.append(i) }
}
if arr.count < k {
	print("0")
} else {
	print(arr[k])
}
```
10,000까지 n이 있기때문에 무작정 n을 1씩 증가시켜 찾는방법은 시간복잡도가 O(n)으로 옳지 않다.   

```
import Foundation

let input = readLine()!.split(separator:" ").map{Int($0)!}
let (n,k) = (input[0],input[1])

var arr : [Int] = []
for i in 1...Int(sqrt(Double(n))) {
	if n % i == 0 { 
		arr.append(i)
		arr.append(n/i)
	}
}
arr = Array(Set(arr)).sorted(by:<)
if arr.count < k {
	print("0")
} else {
	print(arr[k-1])
}
```
반면에 n의 제곱근까지의 값을 가지고도 약수를 구할 수 있는데, n의 제곱근까지의 값들중 나머지가 0이면 그 값들은 당연히 약수가 될 것이고,   
해당 값으로도 n을 나눠줄 수 있기 때문에 시간이 훨씩 절약된다.   
단, 25일때 1 5 5 25가 배열에 입력되기 때문에 Set로 바꿔주는 과정이 필요하다.   
   
## 9506 약수들의 합
어떤 숫자 n이 자신을 제외한 모든 약수들의 합과 같으면, 그 수를 완전수라고 한다.   
예를 들어 6은 6 = 1 + 2 + 3 으로 완전수이다.   
n이 완전수인지 아닌지 판단해주는 프로그램을 작성하라.   
```
import Foundation

while(true) {
	let input = Int(readLine()!)!
	let n = input
	if n == -1 { break; }
	var arr : [Int] = []
	for i in 1...Int(sqrt(Double(n))) {
		if n % i == 0 { 
			arr.append(i)
			arr.append(n/i)
		}
	}
	var setarr = Array(Set(arr)).sorted(by:<)
	let last = setarr.removeLast()
	let sumarr = setarr.reduce(0){$0 + $1}
	//print(setarr, sumarr)
	//print(last)
	if last == sumarr { print("\(last) = "+setarr.map{String($0)}.joined(separator:" + ")) }
	else { print("\(last) is NOT perfect.") }
}

```
위 문제에 마지막 index를 제외한 나머지값들을 따로 저장해주고, 같다면 joined(separator)을 통해 조건에 맞게 출력해준다.   

## 1978 소수 찾기
주어진 수 N개 중에서 소수가 몇 개인지 찾아서 출력하는 프로그램을 작성하시오.   
```
import Foundation

let N = Int(readLine()!)!
let input = readLine()!.split(separator:" ").map{Int($0)!}
var cnt: Int = 0

func isPrime(num: Int) -> Bool {
	if(num < 4) {
		return num == 1 ? false : true
	}
	for i in 2...Int(sqrt(Double(num))) {
		if (num % i == 0) {
		return false
		}
	}
	return true
}

for i in input {
	if isPrime(num: i) {
		cnt += 1
	}
}
print(cnt)
```
소수를 구할 줄 아는가에 대한 문제   
## 2581 
자연수 M과 N이 주어질 때 M이상 N이하의 자연수 중 소수인 것을 모두 골라 이들 소수의 합과 최솟값을 찾는 프로그램을 작성하시오.   
   
예를 들어 M=60, N=100인 경우 60이상 100이하의 자연수 중 소수는    
61, 67, 71, 73, 79, 83, 89, 97 총 8개가 있으므로, 이들 소수의 합은 620이고, 최솟값은 61이 된다.   
```
import Foundation

let M = Int(readLine()!)!
let N = Int(readLine()!)!
var cnt: [Int] = []
var sum: Int = 0

func isPrime(num: Int) -> Bool {
	if(num < 4) {
		return num == 1 ? false : true
	}
	for i in 2...Int(sqrt(Double(num))) {
		if (num % i == 0) {
		return false
		}
	}
	return true
}

for i in M...N {
	if isPrime(num: i) {
		cnt.append(i)
        sum += i
	}
}

if(cnt.isEmpty == true) {
	print("-1")
} else {
	print(sum)
	print(cnt.min()!)
}
```
윗 문제에서 응용한 문제   
### 11653 소인수분해
정수 N이 주어졌을 때, 소인수분해하는 프로그램을 작성하시오.   
```
import Foundation

var N = Int(readLine()!)!
if N == 1 {
	print("")
}

for i in stride(from: 2, through: N, by: 1) {
	while N % i == 0 {
		N /= i
		print("\(i)")
	}
}
```

## 13241 최소공배수
정수 B에 0보다 큰 정수인 N을 곱해 정수 A를 만들 수 있다면, A는 B의 배수이다.   
예:   
10은 5의 배수이다 (5*2 = 10)   
10은 10의 배수이다(10*1 = 10)   
6은 1의 배수이다(1*6 = 6)   
20은 1, 2, 4,5,10,20의 배수이다.   
다른 예:   
2와 5의 최소공배수는 10이고, 그 이유는 2와 5보다 작은 공배수가 없기 때문이다.   
10과 20의 최소공배수는 20이다.   
5와 3의 최소공배수는 15이다.   
당신은 두 수에 대하여 최소공배수를 구하는 프로그램을 작성 하는 것이 목표이다.   
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
// min = 최대공약수
// 최소공배수 = 두 자연수의 곱 / 최대공약수

print(nums[0]*nums[1]/min)
```
유클리도 호제법을 이용해 최대공약수나 최소공배수를 구한다면 시간복잡도를 O(N)에서 O(logN)으로 바꿀 수 있다.   
최대공약수는 더 큰값(a)를 작은값인(b)로 나눈 후 나머지가 0이 아니라면 b가 큰값으로 바뀌고 나머지가 작은값으로 바뀐뒤   
또 다시 두 수를 나누게 된다.   
나누다 나머지가 0이 된 순간 나눈 작은값이 최대공약수가 되는것이다   
ex) 42 % 21 = 0 일때 21이 최대공약수가 된다.   
그리고 최소공배수는 첫 두 자연수의 곱 / 최대공약수가 된다.   

## 1735 분수 합
분수 A/B는 분자가 A, 분모가 B인 분수를 의미한다. A와 B는 모두 자연수라고 하자.   
두 분수의 합 또한 분수로 표현할 수 있다. 두 분수가 주어졌을 때, 그 합을 기약분수의 형태로 구하는 프로그램을 작성하시오.   
기약분수란 더 이상 약분되지 않는 분수를 의미한다.   
```
import Foundation

let num1 = readLine()!.split(separator: " ").map{Int(String($0))!}
let num2 = readLine()!.split(separator: " ").map{Int($0)!}
let renum : [Int] = [((num1[0]*num2[1]) + (num1[1]*num2[0])), num1[1]*num2[1]]
var max = renum.max()!
var min = renum.min()!
var r = max%min

while r > 0 {
    max = min
    min = r
    r = max%min
}
if r == 1 {
	print(renum[0], renum[1])
} else {
	print(renum[0]/min, renum[1]/min)
}
```
두 분모가 주어졌을때 한 분모로 합쳐준 뒤, 해당 분모의 분자와 분모를 유클리드호제법을 이용해 최대공약수를 구해본다.   
최대공약수가 1이라면 두 수는 서로 나눠지는 값이 없는 기약분수이기 때문에 그대로 출력해주고, 1이 아니라면 최대공약수로   
분자와 분모에 나눠준뒤 출력해준다.   

## 2485 가로수
직선으로 되어있는 도로의 한 편에 가로수가 임의의 간격으로 심어져있다.   
KOI 시에서는 가로수들이 모두 같은 간격이 되도록 가로수를 추가로 심는 사업을 추진하고 있다.   
KOI 시에서는 예산문제로 가능한 한 가장 적은 수의 나무를 심고 싶다.   
   
편의상 가로수의 위치는 기준점으로 부터 떨어져 있는 거리로 표현되며, 가로수의 위치는 모두 양의 정수이다.   
예를 들어, 가로수가 (1, 3, 7, 13)의 위치에 있다면 (5, 9, 11)의 위치에 가로수를 더 심으면 모든 가로수들의 간격이 같게 된다.   
또한, 가로수가 (2, 6, 12, 18)에 있다면 (4, 8, 10, 14, 16)에 가로수를 더 심어야 한다.   
   
심어져 있는 가로수의 위치가 주어질 때, 모든 가로수가 같은 간격이 되도록 새로 심어야 하는 가로수의 최소수를 구하는 프로그램을 작성하라.   
단, 추가되는 나무는 기존의 나무들 사이에만 심을 수 있다.   
```
let n = Int(readLine()!)!
var arr : [Int] = []
var diffarr : [Int] = []
for _ in 0..<n {
	arr.append(Int(readLine()!)!)
}
for i in 1..<n {
	diffarr.append(arr[i]-arr[i-1])
}
var max = diffarr.max()!
var min = diffarr.min()!
var r = max % min

while r > 0 {
	max = min
	min = r
	r = max % min
}
var count = 0
for i in 1..<n {
	if arr[i]-arr[i-1] != min {
		count += ((arr[i]-arr[i-1])/min)-1
	}
}
print(count)
```
도로들 사이에 같은 간격을 가지고 나무를 심는 문제이다.   
규칙을 잘 찾아내면 쉽게 풀수 있다.   
먼저 주어진 거리들의 차이를 구한다 (ex : 1 3 7 13)일때 (2 4 6) 이때   
minimun과 maximum의 최소공배수를 구하면 최대의 간격으로 나무를 심을 수 있다.   
```
let n = Int(readLine()!)!
var arr : [Int] = []
var diffarr : [Int] = []
for _ in 0..<n {
	arr.append(Int(readLine()!)!)
}
for i in 1..<n {
	diffarr.append(arr[i]-arr[i-1])
}
var max = diffarr.max()!
var min = diffarr.min()!
var r = max % min

while r > 0 {
	max = min
	min = r
	r = max % min
}
print(((arr[n-1]-arr[0])/min)+1 - arr.count)

```
처음에는 count를 따로 생각하여 i+1 - i가 최소공배수가 아니라면 그 차이만큼 count를 추가해주는 방식으로 풀었으나,   
너무 오래걸리게 되는 이유로 다시 생각하여 배열의 last - 배열의 first 를 최소공배수로 나눠주면   
심어야하는 나무의 그가 나온다 (ex : (13 - 1) / 2 + 1 = 7)   
여기에 이미 심어져있던 나무를 빼준다면 심어야하는 나무의 그루가 나온다.   

```
let n = Int(readLine()!)!
var arr : [Int] = []

for _ in 0..<n {
	arr.append(Int(readLine()!)!)
}
var mid = 0
func gcd(_ a: Int, _ b: Int) -> Int {
	if b == 0 {
		return a
	}
	return gcd(b, a%b)
}
for i in 1..<n {
	mid = gcd(mid,arr[i] - arr[i-1])
}
print((arr.last! - arr.first!)/mid - n + 1)
```
하지만 또 오래 걸려 틀린 관계로 for문을 줄여주는 방법을 찾았다.   
두 나무 사이의 거리를 저장해주는 diffarr을 만들지 않고 for문 안에서 최소공배수와 한번에 구할 수 있도록 만들었다.   
count를 구하는 방법은 그 전과 동일하게 처리하였다.   

## 1929 다음 소수
M이상 N이하의 소수를 모두 출력하는 프로그램을 작성하시오.   
```
import Foundation

let input = readLine()!.split(separator:" ").map{Int($0)!}

func isPrime(num: Int) -> Bool {
	if(num < 4) {
		return num == 1 ? false : true
	}
	for i in 2...Int(sqrt(Double(num))) {
		if(num % i == 0) {
			return false	
		}
	}
	return true
}

for i in input[0]...input[1] {
	if isPrime(num : i) {
		print("\(i)")
	}
}
```
소수 구하는 문제   
## 4948 베르트랑 공준
베르트랑 공준은 임의의 자연수 n에 대하여, n보다 크고, 2n보다 작거나 같은 소수는 적어도 하나 존재한다는 내용을 담고 있다.   
이 명제는 조제프 베르트랑이 1845년에 추측했고, 파프누티 체비쇼프가 1850년에 증명했다.   
예를 들어, 10보다 크고, 20보다 작거나 같은 소수는 4개가 있다.   
(11, 13, 17, 19) 또, 14보다 크고, 28보다 작거나 같은 소수는 3개가 있다. (17,19, 23)   
자연수 n이 주어졌을 때, n보다 크고, 2n보다 작거나 같은 소수의 개수를 구하는 프로그램을 작성하시오.   
```
import Foundation

while true {
	let n = Int(readLine()!)!
	let n2 = n * 2
	var count = 0
	
	if n == 0 { break }
	
	var prime = [Bool](repeating: true, count: n2+1)
	prime[1] = false
	
	for i in 2...n2 {
		if !prime[i] { continue }
		
		for j in stride(from: i+i, through: n2, by: i) {
			prime[j] = false
		}
	}
	for i in n+1...n2 {
		if prime[i] { count += 1 }
	}
	print(count)
}
```
## 9020 골드바흐의 추측
1보다 큰 자연수 중에서  1과 자기 자신을 제외한 약수가 없는 자연수를 소수라고 한다.   
예를 들어, 5는 1과 5를 제외한 약수가 없기 때문에 소수이다.   
하지만, 6은 6 = 2 × 3 이기 때문에 소수가 아니다.   
   
골드바흐의 추측은 유명한 정수론의 미해결 문제로, 2보다 큰 모든 짝수는 두 소수의 합으로 나타낼 수 있다는 것이다.   
이러한 수를 골드바흐 수라고 한다. 또, 짝수를 두 소수의 합으로 나타내는 표현을 그 수의 골드바흐 파티션이라고 한다.   
예를 들면, 4 = 2 + 2, 6 = 3 + 3, 8 = 3 + 5, 10 = 5 + 5,   
12 = 5 + 7, 14 = 3 + 11, 14 = 7 + 7이다.   
10000보다 작거나 같은 모든 짝수 n에 대한 골드바흐 파티션은 존재한다.   
   
2보다 큰 짝수 n이 주어졌을 때, n의 골드바흐 파티션을 출력하는 프로그램을 작성하시오.   
만약 가능한 n의 골드바흐 파티션이 여러 가지인 경우에는 두 소수의 차이가 가장 작은 것을 출력한다.   
```
let limit = 10000

func getPrime() -> [Bool]{
	var prime = [false,false] + Array(repeating: true, count: limit-1)
	for i in 2...limit {
		if prime[i] {
			for j in stride(from: i*2, to: limit+1, by: i) {
				prime[j] = false
			}
		}
	}
	return prime
}

let primes = getPrime()
let T = Int(readLine()!)!

for _ in 0..<T {
	let n = Int(readLine()!)!
	// n/2 이하의 소수들을 모두 구합니다.
	let list = primes[...n].enumerated().filter{$0.element && $0.offset <= n/2}.map{$0.offset}
	
	// 두 수의 차이가 최소인 경우가 답이기 때문에, list를 거꾸로 탐색하여
	// a,b 모두 소수인 첫번째 경우를 찾는다
	for a in list.reversed() {
		let b = n-a
		if primes[a] && primes[b] {
			print(a,b)
			break
		}
	}
	
}
```
