# 입력, 출력과 사칙연산을 연습해 봅시다. Hello World!
## 2557 Hello World
Hello World! 출력
```
import Foundation
print("Hello World!")
```
## 1000 A + B
A+B
```
import Foundation

let input = readLine()!.components(separatedBy: " ")
let A: Int = Int(input[0])!
let B: Int = Int(input[1])!
print(A+B)
```
## 1001 A - B
A-B
```
import Foundation

let input = readLine()!.components(separatedBy:" ")
let A = Int(input[0])!
let B = Int(input[1])!
print(A-B)
```
## 10998 A x B
두 정수 A와 B를 입력받은 다음, A×B를 출력하는 프로그램을 작성하시오.
```
import Foundation

let input = readLine()!.components(separatedBy:" ")
let A = Int(input[0])!
let B = Int(input[1])!
print(A*B)
            
```
## 1008 A / B
두 정수 A와 B를 입력받은 다음, A/B를 출력하는 프로그램을 작성하시오.
```
import Foundation

let input = readLine()!.components(separatedBy:" ")

let A = Double(input[0])!
let B = Double(input[1])!
print(A/B)
```
## 10869 사칙연산
두 자연수 A와 B가 주어진다. 이때, A+B, A-B, A*B, A/B(몫), A%B(나머지)를 출력하는 프로그램을 작성하시오. 
```
import Foundation

let input = readLine()!.components(separatedBy:" ")

let A = Int(input[0])!
let B = Int(input[1])!

print(A+B)
print(A-B)
print(A*B)
print(A/B)
print(A%B)
```
## 10926 ??!
준하는 사이트에 회원가입을 하다가 joonas라는 아이디가 이미 존재하는 것을 보고 놀랐다.   
준하는 놀람을 ??!로 표현한다. 준하가 가입하려고 하는 사이트에 이미 존재하는 아이디가 주어졌을 때,   
놀람을 표현하는 프로그램을 작성하시오.
```
let input = readLine()!
print(input+"??!")
```
## 18108 1998년생인 내가 태국에서는 2541년생?!
ICPC Bangkok Regional에 참가하기 위해 수완나품 국제공항에 막 도착한 팀 레드시프트 일행은 눈을 믿을 수 없었다.   
공항의 대형 스크린에 올해가 2562년이라고 적혀 있던 것이었다.   
   
불교 국가인 태국은 불멸기원(佛滅紀元), 즉 석가모니가 열반한 해를 기준으로 연도를 세는 불기를 사용한다.   
반면, 우리나라는 서기 연도를 사용하고 있다. 불기 연도가 주어질 때 이를 서기 연도로 바꿔 주는 프로그램을 작성하시오.   
```
import Foundation

let input = Int(readLine()!)!
print(input - 543)
```
## 3003 
동혁이는 오래된 창고를 뒤지다가 낡은 체스판과 피스를 발견했다.   
체스판의 먼지를 털어내고 걸레로 닦으니 그럭저럭 쓸만한 체스판이 되었다.    
하지만, 검정색 피스는 모두 있었으나, 흰색 피스는 개수가 올바르지 않았다.   
체스는 총 16개의 피스를 사용하며, 킹 1개, 퀸 1개, 룩 2개, 비숍 2개, 나이트 2개, 폰 8개로 구성되어 있다.   
동혁이가 발견한 흰색 피스의 개수가 주어졌을 때, 몇 개를 더하거나 빼야 올바른 세트가 되는지 구하는 프로그램을 작성하시오.   
```
import Foundation

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
print(1-input[0], 1-input[1], 2-input[2], 2-input[3], 2-input[4], 8-input[5])
```
## 10430 나머지
(A+B)%C는 ((A%C) + (B%C))%C 와 같을까?   
(A×B)%C는 ((A%C) × (B%C))%C 와 같을까?   
세 수 A, B, C가 주어졌을 때, 위의 네 가지 값을 구하는 프로그램을 작성하시오.   
```
import Foundation

let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let A = input[0], B = input[1], C = input[2]
print((A+B)%C)
print(((A%C)+(B%C))%C)
print((A*B)%C)
print(((A%C)*(B%C))%C)
```
## 2558 곱셈
(세 자리 수) × (세 자리 수)는 다음과 같은 과정을 통하여 이루어진다.   
<img width="248" alt="스크린샷 2022-12-14 오후 5 35 03" src="https://user-images.githubusercontent.com/60501045/207546202-612fa42f-872d-4e37-87aa-71bea3e3af36.png">
   
(1)과 (2)위치에 들어갈 세 자리 자연수가 주어질 때   
(3), (4), (5), (6)위치에 들어갈 값을 구하는 프로그램을 작성하시오.   
```
import Foundation

let input1 = Int(readLine()!)!
let input2 = Int(readLine()!)!

print(input1 * (input2%10))
print(input1 * ((input2%100)/10)
print(input1 * (input2/100))
print(input1 * input2)
```
## 11382 꼬마 정민
꼬마 정민이는 이제 A + B 정도는 쉽게 계산할 수 있다. 이제 A + B + C를 계산할 차례이다!   
```
import Foundation
 
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (A,B,C) = (input[0],input[1],input[2])
    
    print(A+B+C)
}

solution()
```
## 10171 고양이
아래 예제와 같이 고양이를 출력하시오.   
<img width="121" alt="스크린샷 2022-12-14 오후 5 45 35" src="https://user-images.githubusercontent.com/60501045/207548628-3fff4cc6-d4bc-4959-ac83-83397918938d.png">
   
```
print("\\    /\\")
print(" )  ( ')")
print("(  /  )")
print(" \\(__)|")        // Escape sequence 에 의해 \\ 두번씩 출력해야함.
```
## 10172 개
아래 예제와 같이 개를 출력하시오.   
![image](https://user-images.githubusercontent.com/60501045/207783072-a1fe71af-0eff-4a71-b3fe-ffb3ca3ed0a1.png)
   
```
print("|\\_/|")
print("|q p|   /}")
print("( 0 )\"\"\"\\")
print("|\"^\"`    |")
print("||_/=\\\\__|")   // ""(큰따옴표)를 출력하려면 \" 와 같이 사용
```
## 25083
아래 예제와 같이 새싹을 출력하시오.   
![image](https://user-images.githubusercontent.com/60501045/207783273-af0cef20-9ead-4c4b-8335-d608aedc2947.png)
```
print("         ,r'\"7")
print("r`-_   ,'  ,/")
print(" \\. \". L_r'")
print("   `~\\/")
print("      |")
print("      |")
```
   
