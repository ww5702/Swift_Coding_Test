## 1712
월드전자는 노트북을 제조하고 판매하는 회사이다. 노트북 판매 대수에 상관없이   
매년 임대료, 재산세, 보험료, 급여 등 A만원의 고정 비용이 들며, 한 대의 노트북을 생산하는 데에는 재료비와 인건비 등 총 B만원의 가변 비용이 든다고 한다.   
   
예를 들어 A=1,000, B=70이라고 하자. 이 경우 노트북을 한 대 생산하는 데는 총 1,070만원이 들며, 열 대 생산하는 데는 총 1,700만원이 든다.   

노트북 가격이 C만원으로 책정되었다고 한다. 일반적으로 생산 대수를 늘려 가다 보면 어느 순간   
총 수입(판매비용)이 총 비용(=고정비용+가변비용)보다 많아지게 된다.   
최초로 총 수입이 총 비용보다 많아져 이익이 발생하는 지점을 손익분기점(BREAK-EVEN POINT)이라고 한다.   
   
A, B, C가 주어졌을 때, 손익분기점을 구하는 프로그램을 작성하시오.   
처음에 해본것   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
var breakEvenPoint = 0

repeat {
    breakEvenPoint += 1
}while (input[0] + (input[1]*breakEvenPoint) > input[2] * breakEvenPoint)

print(breakEvenPoint+1)
```
생각해보니 21억번이라는 숫자가 나올경우 끝날 기미가 안보인다.   
너무 반복문의 굴레에 빠지는것이 아닌 수학적으로 접근할 경우 더 쉬웠다.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
let A = input[0]
let B = input[1]
let C = input[2]

if B >= C {
    print("-1")
}else {
    print("\((A/(C-B)+1))")
}
```
## 2292
![image](https://user-images.githubusercontent.com/60501045/208901460-5145c513-7d1d-428d-8538-82fb5bab3eb3.png)   
위의 그림과 같이 육각형으로 이루어진 벌집이 있다.   
그림에서 보는 바와 같이 중앙의 방 1부터 시작해서 이웃하는 방에 돌아가면서 1씩 증가하는 번호를 주소로 매길 수 있다.   
숫자 N이 주어졌을 때, 벌집의 중앙 1에서 N번 방까지 최소 개수의 방을 지나서 갈 때   
몇 개의 방을 지나가는지(시작과 끝을 포함하여)를 계산하는 프로그램을 작성하시오.   
예를 들면, 13까지는 3개, 58까지는 5개를 지난다.   
```
// 규칙만 파악
import Foundation

let input = Int(readLine()!)!

var cnt: Int = 0
var sum: Int = 0

while input > sum {
    cnt += 1
    sum = sum + (cnt * 6)
}
input == 1 ? print("1") : print(cnt+1)
```
## 1193
무한히 큰 배열에 다음과 같이 분수들이 적혀있다.   
![image](https://user-images.githubusercontent.com/60501045/208904352-d363b789-d3d4-427e-b456-df590b34e460.png)   
이와 같이 나열된 분수들을 1/1 → 1/2 → 2/1 → 3/1 → 2/2 → … 과 같은 지그재그 순서로 차례대로 1번, 2번, 3번, 4번, 5번, … 분수라고 하자.   
X가 주어졌을 때, X번째 분수를 구하는 프로그램을 작성하시오.   
```
import Foundation
var input = Int(readLine()!)!
var cnt: Int = 1 // 구하고자 하는 구간의 합
while true {
	let temp = input - cnt
	if temp <= 0 {
		if cnt % 2 == 0 {
			print("\(input)/\(cnt-input+1)")
			break
		}else {
			print("\(cnt-input+1)/\(input)")
			break
		}
		
	} else if temp > 0 {
		input = temp
		cnt += 1
	}
}
```
규칙찾는데 생각보다 오래걸렸다.   
## 2869
땅 위에 달팽이가 있다. 이 달팽이는 높이가 V미터인 나무 막대를 올라갈 것이다.  
달팽이는 낮에 A미터 올라갈 수 있다. 하지만, 밤에 잠을 자는 동안 B미터 미끄러진다.   
또, 정상에 올라간 후에는 미끄러지지 않는다.   
   
달팽이가 나무 막대를 모두 올라가려면, 며칠이 걸리는지 구하는 프로그램을 작성하시오.   
```
import Foundation

let input = readLine()!.split(separator:" ").map{Int($0)!}
// 올라갈수있는 거리, 자는동안 미끄러지는 거리, 총 가야하는 거리
var cnt: Int = 1
var sum: Int = 0

while sum < input[2] {
	sum += input[0]
	if(sum >= input[2]) {
		break
	}
	sum -= input[1]
	cnt += 1
}
print(cnt)
```
정답은 나오지만 시관초과로 오류가 난다.   
반복문을 쓰게 되고 변수가 10000 이렇게 들어가니 시간초과   
따라서 일방적으로 답을 구해낸다.   
```
import Foundation

let input = readLine()!.split(separator:" ").map{Double($0)!}
let A = input[0]
let B = input[1]
let C = input[2]
// ceil = 소수점 올림
print(Int(ceil((C-B) / (A-B))))
```
## 10250
ACM 호텔 매니저 지우는 손님이 도착하는 대로 빈 방을 배정하고 있다.   
고객 설문조사에 따르면 손님들은 호텔 정문으로부터 걸어서 가장 짧은 거리에 있는 방을 선호한다고 한다.   
여러분은 지우를 도와 줄 프로그램을 작성하고자 한다.   
즉 설문조사 결과 대로 호텔 정문으로부터 걷는 거리가 가장 짧도록 방을 배정하는 프로그램을 작성하고자 한다.   
   
문제를 단순화하기 위해서 호텔은 직사각형 모양이라고 가정하자.   
각 층에 W 개의 방이 있는 H 층 건물이라고 가정하자 (1 ≤ H, W ≤ 99).   
그리고 엘리베이터는 가장 왼쪽에 있다고 가정하자(그림 1 참고).   
이런 형태의 호텔을 H × W 형태 호텔이라고 부른다.   
호텔 정문은 일층 엘리베이터 바로 앞에 있는데, 정문에서 엘리베이터까지의 거리는 무시한다.   
또 모든 인접한 두 방 사이의 거리는 같은 거리(거리 1)라고 가정하고 호텔의 정면 쪽에만 방이 있다고 가정한다.   
<img width="559" alt="스크린샷 2022-12-22 오후 3 00 42" src="https://user-images.githubusercontent.com/60501045/209067501-fa0db29f-5c4e-41ae-8443-b5e580971af8.png">   
방 번호는 YXX 나 YYXX 형태인데 여기서 Y 나 YY 는 층 수를 나타내고   
XX 는 엘리베이터에서부터 세었을 때의 번호를 나타낸다.   
즉, 그림 1 에서 빗금으로 표시한 방은 305 호가 된다.   
   
손님은 엘리베이터를 타고 이동하는 거리는 신경 쓰지 않는다.   
다만 걷는 거리가 같을 때에는 아래층의 방을 더 선호한다.   
예를 들면 102 호 방보다는 301 호 방을 더 선호하는데,   
102 호는 거리 2 만큼 걸어야 하지만 301 호는 거리 1 만큼만 걸으면 되기 때문이다.   
같은 이유로 102 호보다 2101 호를 더 선호한다.   
   
여러분이 작성할 프로그램은 초기에 모든 방이 비어있다고 가정하에    
이 정책에 따라 N 번째로 도착한 손님에게 배정될 방 번호를 계산하는 프로그램이다.    
첫 번째 손님은 101 호, 두 번째 손님은 201 호 등과 같이 배정한다.    
그림 1 의 경우를 예로 들면, H = 6이므로 10 번째 손님은 402 호에 배정해야 한다.   
```
let T = Int(readLine()!)!

for _ in 1...T {
	let input = readLine()!.split(separator:" ").map{Int($0)!}
	let H: Int = input[0] // 6 30
	let _: Int = input[1] // 12 50
	let N: Int = input[2] // 10 72

	let roomnumber = N / H + 1	// 2 3
	let floor = N % H			// 4 12

	if (roomnumber < 10) {
		print("\(floor)0\(roomnumber)")
	} else {
		print("\(floor)\(roomnumber)")
	}
}
```
## 2775
평소 반상회에 참석하는 것을 좋아하는 주희는 이번 기회에 부녀회장이 되고 싶어   
각 층의 사람들을 불러 모아 반상회를 주최하려고 한다.   
   
이 아파트에 거주를 하려면 조건이 있는데,   
“a층의 b호에 살려면 자신의 아래(a-1)층의 1호부터 b호까지 사람들의 수의 합만큼 사람들을 데려와 살아야 한다”   
는 계약 조항을 꼭 지키고 들어와야 한다.
   
아파트에 비어있는 집은 없고 모든 거주민들이 이 계약 조건을 지키고 왔다고 가정했을 때,   
주어지는 양의 정수 k와 n에 대해 k층에 n호에는 몇 명이 살고 있는지 출력하라.   
단, 아파트에는 0층부터 있고 각층에는 1호부터 있으며, 0층의 i호에는 i명이 산다.   
```
import Foundation

let T = Int(readLine()!)!

for _ in 1...T {
	let k = Int(readLine()!)!	//층
	let n = Int(readLine()!)!	//호수
	var arr = Array(repeating: Array(repeating: 0, count: n+1), count: k+1)
	// 2차원 배열 초기화
	for i in 0...k {
		for j in 0...n {
			if i == 0 {
				arr[i][j] = j + 1
			} else {
				if j == 0 {
					arr[i][j] = j + 1
				} else {
					arr[i][j] = arr[i][j-1] + arr[i-1][j]
				}
			}
		}
	}
	print(arr[k][n-1])
}

/*
1 4 10 20 25 49
1 3 6  10 15 21
1 2 3   4  5  6 
*/
```
## 2839
상근이는 요즘 설탕공장에서 설탕을 배달하고 있다.   
상근이는 지금 사탕가게에 설탕을 정확하게 N킬로그램을 배달해야 한다.   
설탕공장에서 만드는 설탕은 봉지에 담겨져 있다. 봉지는 3킬로그램 봉지와 5킬로그램 봉지가 있다.   
   
상근이는 귀찮기 때문에, 최대한 적은 봉지를 들고 가려고 한다.   
예를 들어, 18킬로그램 설탕을 배달해야 할 때, 3킬로그램 봉지 6개를 가져가도 되지만,   
5킬로그램 3개와 3킬로그램 1개를 배달하면, 더 적은 개수의 봉지를 배달할 수 있다.   
   
상근이가 설탕을 정확하게 N킬로그램 배달해야 할 때,   
봉지 몇 개를 가져가면 되는지 그 수를 구하는 프로그램을 작성하시오.   
```
func solution() -> Int {
	var n = Int(readLine()!)!
	var result: Int = 0
	
	if n % 5 == 0 {
		return n / 5
	}
	
	while n >= 0 {
		n -= 3
		result += 1
		if n % 5 == 0 {
			return result + (n / 5)
		}
		if n < 3 {
			return -1
		}
	}
	return result
}
print(solution())
```
예를 들어 14킬로그램의 설탕을 옮기고 싶다면 5킬로그램 3개를 옮기면 안된다.   
즉 5킬로그램 1개와 3킬로그램 2개를 옮겨야 하기 때문에 모든 무게에 대하여 5킬로그램부터 고려하면 안된다.   
3씩 계속 빼주다가 5의 배수가 된다면 그때가 가장 최적의 방법으로 가져갈 수있다는 것을 알게되었다.   
## 10757
두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.   
```
let input = readLine()!.split{$0 == " "}
var inputA = Array(input[0]).map{Int(String($0))!}
var inputB = Array(input[1]).map{Int(String($0))!}

if inputA.count > inputB.count {
    let diff = inputA.count - inputB.count
    for _ in 0..<diff {    // A가 B보다 더 크다면 B의 앞에 0을 붙여줘서 계산
        inputB.insert(0, at:inputB.startIndex)    
    }
} else {
    let diff = inputB.count - inputA.count
    for _ in 0..<diff {
        inputA.insert(0, at:inputA.startIndex)
    }
}
// 계산 시작
for i in 0..<inputA.count {
    inputA[i] += inputB[i]
}

// 뒤부터 10이 넘으면 한자리 씩 올려주기
for i in (1..<inputA.count).reversed() {
    if (inputA[i] >= 10) {
        inputA[i-1] += 1
    }
    inputA[i] = inputA[i] % 10    // 10 올려주고 남은 뒷자리는 나머지로 return
}
var StringA = inputA.map{String($0)}    
let result = StringA.joined(separator: "")    //다시 하나의 string으로
print(result)
```
swift는 python과는 다르게 input에 들어왔을 때 처리를 자동으로 해주지 않는다.   
따라서 input을 String으로 바꿔서 자리마다 따로 게산한 후 하나의 String으로 출력해준다.   
