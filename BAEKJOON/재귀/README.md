# 재귀함수를 다뤄 봅시다.
## 27433 팩토리얼2   
```
import Foundation
func solution() {
    let N = Int(readLine()!)!
    var sum = 1
    if N == 0 { print(1) }
    else {
        for i in 1...N {
            sum *= i
        }
        print(sum)
    }
    
}

solution()

```
## 10872 팩토리얼
0보다 크거나 같은 정수 N이 주어진다. 이때, N!을 출력하는 프로그램을 작성하시오.   
```
let n = Int(readLine()!)!
var sum = 1

for i in stride(from:n, to:0, by:-1) {
	sum *= i
}
print(sum)
```
for문을 역으로 사용하기만 하면 됐었다.   
```
let n = Int(readLine()!)!
func factorial(_ n:Int) -> Int {
	if n == 0 {return 1}
	return n*factorial(n-1)
}
print(factorial(n))
```
하지만 팩토리얼 함수로도 풀 수 있었다.
## 10870 피보나치 수 5
피보나치 수는 0과 1로 시작한다. 0번째 피보나치 수는 0이고, 1번째 피보나치 수는 1이다.   
그 다음 2번째 부터는 바로 앞 두 피보나치 수의 합이 된다.   
이를 식으로 써보면 Fn = Fn-1 + Fn-2 (n ≥ 2)가 된다.   
n=17일때 까지 피보나치 수를 써보면 다음과 같다.   
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597.  
n이 주어졌을 때, n번째 피보나치 수를 구하는 프로그램을 작성하시오.   
```
let n = Int(readLine()!)!
func pibo(_ n:Int) -> Int {
	if n == 0{ return 0 }
	else if n == 1 { return 1}
	return pibo(n-1) + pibo(n-2)
}
print(pibo(n))
```
피보나치 함수를 만들어 풀이.   

## 25501 재귀의 귀재
정휘는 후배들이 재귀 함수를 잘 다루는 재귀의 귀재인지 알아보기 위해 재귀 함수와 관련된 문제를 출제하기로 했다.   
팰린드롬이란, 앞에서부터 읽었을 때와 뒤에서부터 읽었을 때가 같은 문자열을 말한다.   
팰린드롬의 예시로 AAA, ABBA, ABABA 등이 있고, 팰린드롬이 아닌 문자열의 예시로 ABCA, PALINDROME 등이 있다.   
   
어떤 문자열이 팰린드롬인지 판별하는 문제는 재귀 함수를 이용해 쉽게 해결할 수 있다.   
아래 코드의 isPalindrome 함수는 주어진 문자열이 팰린드롬이면 1, 팰린드롬이 아니면 0을 반환하는 함수다.   
   
![image](https://user-images.githubusercontent.com/60501045/225313679-3b8c5deb-1cf3-4437-9079-b8ca916a3ade.png)   
   
정휘는 위에 작성된 isPalindrome 함수를 이용하여 어떤 문자열이 팰린드롬인지 여부를 판단하려고 한다.   
구체적으로는, 문자열 S를 isPalindrome 함수의 인자로 전달하여 팰린드롬 여부를 반환값으로 알아낼 것이다.   
더불어 판별하는 과정에서 recursion 함수를 몇 번 호출하는지 셀 것이다.   
   
정휘를 따라 여러분도 함수의 반환값과 recursion 함수의 호출 횟수를 구해보자.   
```
let t = Int(readLine()!)!
var sum = 0
func recursion(_ arr : [Character], _ start : Int, _ end : Int) -> Int{
	sum += 1
	if start >= end { return 1 }
	else if arr[start] != arr[end] { return 0}
	else { return recursion(arr, start+1, end-1) }
}
func isPalindrome(_ arr : [Character]) -> Int {
	return recursion(arr, 0, arr.count-1)
}
for _ in 0..<t {
	let arr = Array(readLine()!)
	print(isPalindrome(arr),sum)
	sum = 0
}
```
보기에서 함수를 주어줬기 때문에 따라 만들고 문제 출력 양식에 따라 print문을 변경시켜준다.   

## 24060 알고리즘 수업 - 병합 정렬1
오늘도 서준이는 병합 정렬 수업 조교를 하고 있다. 아빠가 수업한 내용을 학생들이 잘 이해했는지 문제를 통해서 확인해보자.  
N개의 서로 다른 양의 정수가 저장된 배열 A가 있다. 병합 정렬로 배열 A를 오름차순 정렬할 경우 배열 A에 K 번째 저장되는 수를 구해서 우리 서준이를 도와주자.   
크기가 N인 배열에 대한 병합 정렬 의사 코드는 다음과 같다.   
   
![image](https://user-images.githubusercontent.com/60501045/225317350-00ac512e-b678-46ef-8dc1-195d731f33ab.png)   
   
```
let input = readLine()!.split(separator:" ").map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var numArray = readLine()!.split(separator:" ").map{Int(String($0))!}
var count = 0
var answer = -1

func mergeSort(_ array: [Int], _ start: Int, _ end: Int) {
    if array.count <= 1 { return }
    if start < end && count < K {
        let center = (start + end) / 2
        mergeSort(array, start, center)
        mergeSort(array, center + 1, end)
        merge(start, center, end)
    }
}

func merge(_ start: Int, _ center: Int, _ end: Int) {
    var i = start
    var j = center + 1
    var t = 0
    var temp = [Int]()
    
    while i <= center && j <= end {
        if numArray[i] <= numArray[j] {
            temp.append(numArray[i])
            i += 1
        } else {
            temp.append(numArray[j])
            j += 1
        }
    }
    
    while i <= center {
        temp.append(numArray[i])
        i += 1
    }
    
    while j <= end {
        temp.append(numArray[j])
        j += 1
    }
    
    i = start
    while i <= end {
        numArray[i] = temp[t]
        count += 1
        if count == K {
            answer = temp[t]
            break
        }
        i += 1
        t += 1
    }
}

mergeSort(numArray, 0, N - 1)
print(answer)
```
재귀함수로 병합정렬을 만들고 count를 따로 선언하여 count값을 출력해준다.   

## 4779 칸토어 집합
재귀함수를 이용해 line + 띄어쓰기 + line만큼을 만든다.   
3일때 9 line 9띄어쓰기 9 line이고   
9line은   
3line 3띄어쓰기 3line 이다.   
```
import Foundation
func solution() {
    func split(_ n: Double) -> String{
        if n == 0 { return "-"}
        let line = split(n-1)
        return line + String(repeating: " ", count: Int(pow(3, n-1))) + line
    }
    while let input = readLine(), let n = Double(input) {
        print(split(n))
    }
}

solution()

```
## 2447 별 찍기 - 10
재귀적인 패턴으로 별을 찍어 보자. N이 3의 거듭제곱(3, 9, 27, ...)이라고 할 때, 크기 N의 패턴은 N×N 정사각형 모양이다.   
크기 3의 패턴은 가운데에 공백이 있고, 가운데를 제외한 모든 칸에 별이 하나씩 있는 패턴이다.   
<img width="730" alt="스크린샷 2023-01-06 오후 3 07 37" src="https://user-images.githubusercontent.com/60501045/210940757-837c474c-e260-47bc-a8dd-107358f83c7d.png">   
N이 3보다 클 경우, 크기 N의 패턴은 공백으로 채워진 가운데의 (N/3)×(N/3) 정사각형을 크기 N/3의 패턴으로 둘러싼 형태이다.   
예를 들어 크기 27의 패턴은 예제 출력 1과 같다.   
<img width="344" alt="스크린샷 2023-01-06 오후 3 11 00" src="https://user-images.githubusercontent.com/60501045/210941188-b1b86aed-4a6c-4b7f-887b-b8b4e300d4d6.png">   
```
let n = Int(readLine()!)!
func starprint(count: Int, pattern:[String]) {
	if count == 1 {
		pattern.forEach{print($0)}
		return
	}
	let row1: [String] = pattern.map{$0+$0+$0}
	let row2: [String] = pattern.map{$0 + String(repeating:" ", count: $0.count) + $0}
	let newPattern: [String] = row1 + row2 + row1
	
	starprint(count: count/3, pattern: newPattern)
}

starprint(count: n, pattern:["*"])
```
***   
* *   
***   이라는 패턴을 만드는게 중심인 문제
전체를 9칸으로 생각해서 가운데에만 공백을 넣고 계속해서 같은 문양들을 집어넣어준다.  
## 11729 하노이 탑 이동 순서
세 개의 장대가 있고 첫 번째 장대에는 반경이 서로 다른 n개의 원판이 쌓여 있다.   
각 원판은 반경이 큰 순서대로 쌓여있다. 이제 수도승들이 다음 규칙에 따라 첫 번째 장대에서 세 번째 장대로 옮기려 한다.   
   
1. 한 번에 한 개의 원판만을 다른 탑으로 옮길 수 있다.
2. 쌓아 놓은 원판은 항상 위의 것이 아래의 것보다 작아야 한다.
   
이 작업을 수행하는데 필요한 이동 순서를 출력하는 프로그램을 작성하라. 단, 이동 횟수는 최소가 되어야 한다.   
아래 그림은 원판이 5개인 경우의 예시이다.   
<img width="497" alt="스크린샷 2023-01-06 오후 3 51 06" src="https://user-images.githubusercontent.com/60501045/210946496-f3c9c5b6-3f9c-4e92-8f31-0b2c8e3aada6.png">   
   
<img width="493" alt="스크린샷 2023-01-06 오후 3 51 40" src="https://user-images.githubusercontent.com/60501045/210946552-80c4b0d2-1439-403e-bf14-9408503859e4.png">   

```
let n = Int(readLine()!)!
var cnt = 0

func hanoi(_ n:Int) -> Int {	// 이동횟수
	if n == 0 { return 1 }
	else {
		return hanoi(n-1) * 2
	}
}

func hanoimove(_ n: Int, _ start: Int, _ end: Int) {	// 이동경로
	if n == 1 { 
		print("\(start) \(end)")
		return 
	}
	hanoimove(n-1, start, (6-start-end))
	print(start,end)
	hanoimove(n-1, 6-start-end, end)
	
}

print(hanoi(n)-1)
hanoimove(n,1,3)
```
하노이탑 이동횟수는 구하기 쉬웠으나 이동경로는 규칙성을 찾기 어려웠다.   


