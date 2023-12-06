# if 등의 조건문을 사용해 봅시다.
## 1330
두 정수 A와 B가 주어졌을 때, A와 B를 비교하는 프로그램을 작성하시오.   
```
import Foundation

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
if(input[0] > input[1]) {
    print(">")
}else if(input[0] < input[1]) {
    print("<")
}else if(input[0] == input[1]) {
    print("==")
}
```
## 9448
시험 점수를 입력받아 90 ~ 100점은 A, 80 ~ 89점은 B, 70 ~ 79점은 C,   
60 ~ 69점은 D, 나머지 점수는 F를 출력하는 프로그램을 작성하시오.   
```
import Foundation

let input = Int(readLine()!)!         // 배열이 없으므로 input[0]은 오류
if(input >= 90) {
    print("A")
}else if (input >= 80) {
    print("B")
}else if (input >= 70) {
    print("C")
}else if (input >= 60) {
    print("D")
}else {
    print("F")
}                 
```
## 2753
연도가 주어졌을 때, 윤년이면 1, 아니면 0을 출력하는 프로그램을 작성하시오.   
윤년은 연도가 4의 배수이면서, 100의 배수가 아닐 때 또는 400의 배수일 때이다.   
예를 들어, 2012년은 4의 배수이면서 100의 배수가 아니라서 윤년이다. 1900년은 100의 배수이고   
400의 배수는 아니기 때문에 윤년이 아니다. 하지만, 2000년은 400의 배수이기 때문에 윤년이다.   
```
import Foundation

let input = Int(readLine()!)!
if((input % 4 == 0) && (input % 100 != 0) || (input % 400 == 0)) {
    print("1")
} else {
    print("0")
}
```
## 14681
흔한 수학 문제 중 하나는 주어진 점이 어느 사분면에 속하는지 알아내는 것이다.   
사분면은 아래 그림처럼 1부터 4까지 번호를 갖는다. "Quadrant n"은 "제n사분면"이라는 뜻이다.   
![image](https://user-images.githubusercontent.com/60501045/207786710-d717e24e-e48b-43d4-ac45-44b5a8205645.png)

   
예를 들어, 좌표가 (12, 5)인 점 A는 x좌표와 y좌표가 모두 양수이므로 제1사분면에 속한다. 점 B는 x좌표가 음수이고 y좌표가 양수이므로 제2사분면에 속한다.   
점의 좌표를 입력받아 그 점이 어느 사분면에 속하는지 알아내는 프로그램을 작성하시오. 단, x좌표와 y좌표는 모두 양수나 음수라고 가정한다.   
```
import Foundation

let A = Int(readLine()!)!
let B = Int(readLine()!)!

if(A > 0 && B > 0) {
    print("1")
}else if(A < 0 && B > 0) {
    print("2")
}else if(A < 0 && B < 0) {
    print("3")
}else if(A > 0 && B < 0) {
    print("4")
}else {
    print("(0,0)입니다.")
}
```
## 2884
상근이는 매일 아침 알람을 듣고 일어난다. 알람을 듣고 바로 일어나면 다행이겠지만, 항상 조금만 더 자려는 마음 때문에 매일 학교를 지각하고 있다.   
상근이는 모든 방법을 동원해보았지만, 조금만 더 자려는 마음은 그 어떤 것도 없앨 수가 없었다.   
이런 상근이를 불쌍하게 보던, 창영이는 자신이 사용하는 방법을 추천해 주었다.   
바로 "45분 일찍 알람 설정하기"이다.   
이 방법은 단순하다. 원래 설정되어 있는 알람을 45분 앞서는 시간으로 바꾸는 것이다.   
어차피 알람 소리를 들으면, 알람을 끄고 조금 더 잘 것이기 때문이다.   
이 방법을 사용하면, 매일 아침 더 잤다는 기분을 느낄 수 있고, 학교도 지각하지 않게 된다.   
현재 상근이가 설정한 알람 시각이 주어졌을 때, 창영이의 방법을 사용한다면,   
이를 언제로 고쳐야 하는지 구하는 프로그램을 작성하시오.   
```
import Foundation

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
var hour = input[0]             // var 조심
var min = input[1]

if(min < 45) {
    min += 15
    hour -= 1
} else if(min >= 45) {
    min -= 45
}

if(hour < 0) {
    hour += 24
}
print("\(hour) \(min)")
```
## 2525
KOI 전자에서는 건강에 좋고 맛있는 훈제오리구이 요리를 간편하게 만드는 인공지능 오븐을 개발하려고 한다.   
인공지능 오븐을 사용하는 방법은 적당한 양의 오리 훈제 재료를 인공지능 오븐에 넣으면 된다.   
그러면 인공지능 오븐은 오븐구이가 끝나는 시간을 분 단위로 자동적으로 계산한다.    
또한, KOI 전자의 인공지능 오븐 앞면에는 사용자에게 훈제오리구이 요리가 끝나는 시각을 알려 주는 디지털 시계가 있다.   
훈제오리구이를 시작하는 시각과 오븐구이를 하는 데 필요한 시간이 분단위로 주어졌을 때,   
오븐구이가 끝나는 시각을 계산하는 프로그램을 작성하시오.   
```
import Foundation

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let time = Int(readLine()!)!

var hour = input[0]
var min = input[1]

min += time

if (min >= 60) {
    hour += (min / 60)
    min %= 60
}
if (hour >= 24) {
    hour -= 24
}

print("\(hour) \(min)")
```
## 2480
1에서부터 6까지의 눈을 가진 3개의 주사위를 던져서 다음과 같은 규칙에 따라 상금을 받는 게임이 있다.   
   
1. 같은 눈이 3개가 나오면 10,000원+(같은 눈)×1,000원의 상금을 받게 된다.   
2. 같은 눈이 2개만 나오는 경우에는 1,000원+(같은 눈)×100원의 상금을 받게 된다.   
3. 모두 다른 눈이 나오는 경우에는 (그 중 가장 큰 눈)×100원의 상금을 받게 된다.    
   
예를 들어, 3개의 눈 3, 3, 6이 주어지면 상금은 1,000+3×100으로 계산되어 1,300원을 받게 된다.   
또 3개의 눈이 2, 2, 2로 주어지면 10,000+2×1,000 으로 계산되어 12,000원을 받게 된다.   
3개의 눈이 6, 2, 5로 주어지면 그중 가장 큰 값이 6이므로 6×100으로 계산되어 600원을 상금으로 받게 된다.   
3개 주사위의 나온 눈이 주어질 때, 상금을 계산하는 프로그램을 작성 하시오.   
```
import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
let set = Set<Int>(input)

if set.count == 3 {
    print(input[0] * 100)
} else if set.count == 2 {
    print(1000 + input[1] * 100)
} else {
    print(10000 + input[0] * 1000)
}
```
