# 다양한 기하 문제를 연습해 봅시다.	
## 4153
과거 이집트인들은 각 변들의 길이가 3, 4, 5인 삼각형이 직각 삼각형인것을 알아냈다. 주어진 세변의 길이로 삼각형이 직각인지 아닌지 구분하시오.   
   
<img width="250" alt="스크린샷 2023-01-13 오후 3 32 49" src="https://user-images.githubusercontent.com/60501045/212253149-f0d0faf4-cd4b-4ed9-93a7-05ffc26f51ee.png">   
   
```
for _ in 0...1000 {
	var input = readLine()!.split(separator:" ").map{Int($0)!}
	if input[0] == 0 { break }
	var sum = input[0]*input[0] + input[1]*input[1]
	if sum == input[2]*input[2] {
		print("right")
	} else {
		print("wrong")
	}
}

```
pow() 함수를 이용해 풀려 했으나 pow 함수는 실수형이 필요하다.   
변환해주기는 귀찮아서 하드코딩으로 풀었다.   
```
import Foundation
while true {
    let inputs = readLine()!.split(separator: " ").map { Double(String($0))! }.sorted()
    let a = inputs[0]
    let b = inputs[1]
    let c = inputs[2]
    
	// a, b, c가 0 0 0이면 탈출
    if a + b + c == 0 { break }

    if pow(a, 2) + pow(b, 2) == pow(c, 2) {
        print("right")
    } else {
        print("wrong")
    }
}
```
pow로 푸려면 받는 input 값을 double로 해야하고   
import Foundation이 필수적이다.   

## 2477
시골에 있는 태양이의 삼촌 댁에는 커다란 참외밭이 있다.   
문득 태양이는 이 밭에서 자라는 참외가 도대체 몇 개나 되는지 궁금해졌다.   
어떻게 알아낼 수 있는지 골똘히 생각하다가 드디어 좋은 아이디어가 떠올랐다.   
유레카! 1m^2의 넓이에 자라는 참외 개수를 헤아린 다음,   
참외밭의 넓이를 구하면 비례식을 이용하여 참외의 총개수를 구할 수 있다.   
   
1m2의 넓이에 자라는 참외의 개수는 헤아렸고, 이제 참외밭의 넓이만 구하면 된다.   
참외밭은 ㄱ-자 모양이거나 ㄱ-자를 90도, 180도, 270도 회전한 모양   
(┏, ┗, ┛ 모양)의 육각형이다.   
다행히도 밭의 경계(육각형의 변)는 모두 동서 방향이거나 남북 방향이었다.   
밭의 한 모퉁이에서 출발하여 밭의 둘레를 돌면서 밭경계 길이를 모두 측정하였다.   
   
<img width="224" alt="스크린샷 2023-01-14 오후 3 55 28" src="https://user-images.githubusercontent.com/60501045/212460046-afa5aecf-2f43-443a-a26e-09795db5f6d5.png">     
   
예를 들어 참외밭이 위 그림과 같은 모양이라고 하자.   
그림에서 오른쪽은 동쪽, 왼쪽은 서쪽, 아래쪽은 남쪽, 위쪽은 북쪽이다.   
이 그림의 왼쪽위 꼭짓점에서 출발하여, 반시계방향으로 남쪽으로 30m, 동쪽으로 60m,   
남쪽으로 20m, 동쪽으로 100m, 북쪽으로 50m, 서쪽으로 160m 이동하면   
다시 출발점으로 되돌아가게 된다.   
   
위 그림의 참외밭  면적은 6800m^2이다.   
만약 1m2의 넓이에 자라는 참외의 개수가 7이라면, 이 밭에서 자라는 참외의 개수는 47600으로 계산된다.   
   
1m2의 넓이에 자라는 참외의 개수와, 참외밭을 이루는 육각형의 임의의 한 꼭짓점에서   
출발하여 반시계방향으로 둘레를 돌면서 지나는 변의 방향과 길이가 순서대로 주어진다.   
이 참외밭에서 자라는 참외의 수를 구하는 프로그램을 작성하시오.   
```
let K = Int(readLine()!)!
var sides = [Int]()

for _ in 0..<6 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

    sides.append(input[1])
}

let maxIndex = sides.firstIndex(of: sides.max()!)!

if sides[(maxIndex + 1) % 6] > sides[(maxIndex + 5) % 6] {
    print(K * (sides[maxIndex] * sides[(maxIndex + 1) % 6] - sides[(maxIndex + 3) % 6] * sides[(maxIndex + 4) % 6]))
} else {
    print(K * (sides[maxIndex] * sides[(maxIndex + 5) % 6] - sides[(maxIndex + 2) % 6] * sides[(maxIndex + 3) % 6]))
}
```
## 3053
19세기 독일 수학자 헤르만 민코프스키는 비유클리드 기하학 중 택시 기하학을 고안했다.   
택시 기하학에서 두 점 T1(x1,y1), T2(x2,y2) 사이의 거리는 다음과 같이 구할 수 있다.   
   
D(T1,T2) = |x1-x2| + |y1-y2|     
두 점 사이의 거리를 제외한 나머지 정의는 유클리드 기하학에서의 정의와 같다.   
따라서 택시 기하학에서 원의 정의는 유클리드 기하학에서 원의 정의와 같다.   
원: 평면 상의 어떤 점에서 거리가 일정한 점들의 집합.  
반지름 R이 주어졌을 때, 유클리드 기하학에서 원의 넓이와, 택시 기하학에서 원의 넓이를 구하는 프로그램을 작성하시오.   
```
import Foundation

let r = Double(readLine()!)!
let sol1: Double = r*r*3.14159265358
let sol2: Double = 2*r*r
let digit: Double = pow(10,6)
print("\(ceil(sol1 * digit) / digit)\n\(ceil(sol2*digit) / digit)")
```
유클리드 값과 택시 값을 따로 구해준 후 소수점 6자리에서 반올림해주기 위해 10^6을 곱해준후 다시 나눠준다.   
```
import Foundation

let input = Int(readLine()!)!
var p = 3.14159265358979

print(String(format: "%.6f", Double(input * input) * p))
print(String(format: "%.6f", Double(input * input * 2)))
```
하지만 답은 882.000000과 같이 0을 표시해주길 바라므로 format을 사용해서 0을 강제로 찍어준다.   
## 1002
A와 B는 터렛에 근무하는 직원이다. 하지만 워낙 존재감이 없어서 인구수는 차지하지 않는다.   
이석원은 A와 B에게 상대편 마린(C)의 위치를 계산하라는 명령을 내렸다.   
A와 B는 각각 자신의 터렛 위치에서 현재 적까지의 거리를 계산했다.   
   
A의 좌표 (x1, y1)와 B의 좌표 (x2, y2)가 주어지고,   
A가 계산한 C와의 거리 r1과 B가 계산한 C와의 거리 r2가 주어졌을 때,   
C가 있을 수 있는 좌표의 수를 출력하는 프로그램을 작성하시오.
```
import Foundation

for _ in 0..<Int(readLine()!)! {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (x1,y1,r1,x2,y2,r2) = (t[0],t[1],t[2],t[3],t[4],t[5])

	let d = sqrt(Double((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2)))

	//두 원이 일치
	if x1 == x2 && y1 == y2 && r1 == r2 {
		print(-1)
	} 
	//두 점에서 만난다
	else if Double(abs(r1-r2)) < d && d < Double(r1+r2) {
		print(2)
	} 
    	//한 점에서 만난다.
    	else if Double(r1+r2) == d || Double(abs(r1-r2)) == d {
		print(1)
	} 
    	//만나지 않는다
   	else {
		print(0)
	}
}
```
좌표값을 일일이 확인한 다음 카운팅을 해주려 했는데 그럴 필요가 없는 문제였다.   
만약 두 원이 완벽하게 일치할 경우 값은 무한대로 나올것이고   
한점이나 두 점에서 만날 경우에 따라 출력해주면 되는 문제이다.   

## 1004
어린 왕자는 소혹성 B-664에서 자신이 사랑하는 한 송이 장미를 위해 살아간다.   
어느 날 장미가 위험에 빠지게 된 것을 알게 된 어린 왕자는, 장미를 구하기 위해 은하수를 따라 긴 여행을 하기 시작했다.   
하지만 어린 왕자의 우주선은 그렇게 좋지 않아서 행성계 간의 이동을 최대한 피해서 여행해야 한다.   
아래의 그림은 어린 왕자가 펼쳐본 은하수 지도의 일부이다.   
   
<img width="585" alt="스크린샷 2023-01-16 오후 3 54 16" src="https://user-images.githubusercontent.com/60501045/212615921-529c27e3-6100-4571-abef-7dda60fa1ae7.png">   
   
빨간 실선은 어린 왕자가 출발점에서 도착점까지 도달하는데 있어서 필요한 행성계 진입/이탈 횟수를 최소화하는 경로이며,   
원은 행성계의 경계를 의미한다. 이러한 경로는 여러 개 존재할 수 있지만 적어도 3번의 행성계 진입/이탈이 필요하다는 것을 알 수 있다.   
   
위와 같은 은하수 지도, 출발점, 도착점이 주어졌을 때   
어린 왕자에게 필요한 최소의 행성계 진입/이탈 횟수를 구하는 프로그램을 작성해 보자.   
행성계의 경계가 맞닿거나 서로 교차하는 경우는 없다.   
또한, 출발점이나 도착점이 행성계 경계에 걸쳐진 경우 역시 입력으로 주어지지 않는다.   
```
import Foundation
var t = Int(readLine()!)!

func getDistance(x1: Int, y1: Int, x2: Int, y2: Int, r: Int) -> Bool {
	let distance = pow(Double(x1 - x2),2) + pow(Double(y1-y2), 2)
	if distance < pow(Double(r),2) {	// 출발점이 원 안에 위치한다
		return true
	} else {
		return false
	}
}

while t > 0 {
	let tmp = readLine()!.split(separator:" ").map{Int($0)!}
	let start = (x: tmp[0], y: tmp[1])
	let end = (x: tmp[3], y: tmp[4])
	
	let n = Int(readLine()!)!
	var cnt = 0
	for i in 0..<n {
		let input = readLine()!.split(separator:" ").map{Int($0)!}
		
		//출발지점과 주어진 원 비교
		var startResult = getDistance(x1: start.x, y1: start.y, x2: input[0], y2: input[1], r: input[2])
		// 도착지점과 주어진 원 비교
		var endResult = getDistance(x1: start.x, y1: start.y, x2: input[0], y2: input[1], r: input[2])
		
		// 둘중 하나만 true 이면 +1
		// 둘다 true이면 두 점이 하나의 원 안에 있다는것을 의미 카운트 x
		// 둘다 false면 아예 상관없는 원
		if startResult == true && endResult == false {
			cnt += 1
		} else if startResult == false && endResult == true {
			cnt += 1
		}
	}
	print(cnt)
	t -= 1
}
```
어렵게 생각하는 것이 아닌 문제의 본질을 파악하는게 중요한 문제이다.   
상관없는 원들이 어느것인지 파악하는것이기에 시작점과 도착점이 만약 원 안에 있다면 어쩔수없이 카운팅을 해줘야 하는 문제이다.   
그리고 두 점이 한 원안에 동시에 있다면 경계선을 지나칠 이유도 없기에 카운팅 해줄 필요가 없다    
나머지 원은 경로에 해당하지않는 원들이다.   
