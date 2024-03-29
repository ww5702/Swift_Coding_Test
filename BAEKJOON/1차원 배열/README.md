# 배열을 사용해 봅시다.
## 10807 개수 세기
총 N개의 정수가 주어졌을 때, 정수 v가 몇 개인지 구하는 프로그램을 작성하시오.   
```
import Foundation

let N = Int(readLine()!)!
var input = [Int](readLine()!.split(separator:" ").map{Int($0)!})
let K = Int(readLine()!)!
var count: Int = 0
for i in 0...N-1 {
    if(K == input[i]) { count += 1 }
}
print(count)
```
1차 수정   
```
import Foundation

let N = Int(readLine()!)!
let input = [Int](readLine()!.split(separator:" ").map{Int($0)!})
let K = Int(readLine()!)!
var count: Int = 0
for i in input {              // for문 적을때 i에 input숫자를 하나씩 넣어줄 수 있다.
    if K == i { count += 1 }
}
print(count)
```
## 10871 X보다 작은 수 
정수 N개로 이루어진 수열 A와 정수 X가 주어진다. 이때, A에서 X보다 작은 수를 모두 출력하는 프로그램을 작성하시오.   
```
import Foundation

let input = readLine()!.split(separator:" ").map{Int($0)!}
let nums = [Int](readLine()!.split(separator:" ").map{Int($0)!})

for i in nums {
    if(input[1] > i) { print(i) }
}
```
## 10818 최소, 최대
N개의 정수가 주어진다. 이때, 최솟값과 최댓값을 구하는 프로그램을 작성하시오.   
```
import Foundation

let input = Int(readLine()!)!
let nums = [Int](readLine()!.split(separator:" ").map{Int($0)!})
var Max: Int = nums[0]
var Min: Int = nums[0]
for i in nums {
    if (i >= Max) { Max = i }
    else if (i <= Min) { Min = i }
}
print("\(Min) \(Max)")
```
1차 수정   
```
let input = Int(readLine()!)!
let nums = [Int](readLine()!.split(separator:" ").map{Int($0)!})
print(nums.min()!, nums.max()!)              // 배열에는 min() max()기능이 이미 들어가있음
```
## 2562 최댓값
9개의 서로 다른 자연수가 주어질 때, 이들 중 최댓값을 찾고 그 최댓값이 몇 번째 수인지를 구하는 프로그램을 작성하시오.   
예를 들어, 서로 다른 9개의 자연수   
3, 29, 38, 12, 57, 74, 40, 85, 61   
이 주어지면, 이들 중 최댓값은 85이고, 이 값은 8번째 수이다.   
```
var nums: [Int] = []

for _ in 1...9 {
    nums.append(Int(readLine()!)!)
}
let Max = nums.max()!
let indexOfMax = nums.firstIndex(of: Max)! + 1      // firstIndex(of: 대상)을 통해 순서를 찾을 수 있다.
print(Max)
print(indexOfMax)
```
## 10810 공 넣기
도현이는 바구니를 총 N개 가지고 있고, 각각의 바구니에는 1번부터 N번까지 번호가 매겨져 있다.   
또, 1번부터 N번까지 번호가 적혀있는 공을 매우 많이 가지고 있다.   
가장 처음 바구니에는 공이 들어있지 않으며, 바구니에는 공을 1개만 넣을 수 있다.   
   
도현이는 앞으로 M번 공을 넣으려고 한다.   
도현이는 한 번 공을 넣을 때, 공을 넣을 바구니 범위를 정하고, 정한 바구니에 모두 같은 번호가 적혀있는 공을 넣는다.   
만약, 바구니에 공이 이미 있는 경우에는 들어있는 공을 빼고, 새로 공을 넣는다. 공을 넣을 바구니는 연속되어 있어야 한다.   
   
공을 어떻게 넣을지가 주어졌을 때, M번 공을 넣은 이후에 각 바구니에 어떤 공이 들어 있는지 구하는 프로그램을 작성하시오.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var arr = Array(repeating: "0", count: n)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (i,j,k) = (input[0],input[1],input[2])
        for res in i...j {
            arr[res-1] = "\(k)"
        }
    }
    print(arr.joined(separator: " "))
    
}
solution()
```
배열을 따로 저장하여 덮어쓰기 형식으로 값을 지정해준다.   

## 10813 공 바꾸기
도현이는 바구니를 총 N개 가지고 있고, 각각의 바구니에는 1번부터 N번까지 번호가 매겨져 있다.   
바구니에는 공이 1개씩 들어있고, 처음에는 바구니에 적혀있는 번호와 같은 번호가 적힌 공이 들어있다.   
   
도현이는 앞으로 M번 공을 바꾸려고 한다. 도현이는 공을 바꿀 바구니 2개를 선택하고, 두 바구니에 들어있는 공을 서로 교환한다.   
공을 어떻게 바꿀지가 주어졌을 때, M번 공을 바꾼 이후에 각 바구니에 어떤 공이 들어있는지 구하는 프로그램을 작성하시오.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var arr = Array(1...n)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (a,b) = (input[0]-1, input[1]-1)
        let temp = arr[a]
        arr[a] = arr[b]
        arr[b] = temp
    }
    print(arr.map{String($0)}.joined(separator: " "))
    
}
solution()
```
이 문제 또한 위 문제와 비슷하게 덮어씌우는 방식으로 풀이한다.   

## 10811 바구니 뒤집기
도현이는 바구니를 총 N개 가지고 있고, 각각의 바구니에는 1번부터 N번까지 번호가 순서대로 적혀져 있다.   
바구니는 일렬로 놓여져 있고, 가장 왼쪽 바구니를 1번째 바구니, 그 다음 바구니를 2번째 바구니, ...,   
가장 오른쪽 바구니를 N번째 바구니라고 부른다.   
   
도현이는 앞으로 M번 바구니의 순서를 역순으로 만들려고 한다.   
도현이는 한 번 순서를 역순으로 바꿀 때, 순서를 역순으로 만들 범위를 정하고, 그 범위에 들어있는 바구니의 순서를 역순으로 만든다.   
   
바구니의 순서를 어떻게 바꿀지 주어졌을 때, M번 바구니의 순서를 역순으로 만든 다음,   
바구니에 적혀있는 번호를 가장 왼쪽 바구니부터 출력하는 프로그램을 작성하시오.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var arr = Array(1...n)
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (i,j) = (input[0]-1, input[1]-1)
        arr.replaceSubrange(i...j, with: arr[i...j].reversed())
        
    }
    print(arr.map{String($0)}.joined(separator: " "))
}
solution()
```
replaceSubragne를 사용하면 쉽게 해결할 수 있다.   
arr = [1,2,3]일때   
replaceSubrange(0...2, with: [10,20,30]) 이라면 arr[0~2]까지의 범위를 10~30으로 바꿔준다는 의미이다.   
즉 arr[i...j]까지의 범위를 arr[i...j].reversed()로 바꿔준다는 뜻이다.   

## 5597 과제 안내신 분..?
X대학 M교수님은 프로그래밍 수업을 맡고 있다. 교실엔 학생이 30명이 있는데,   
학생 명부엔 각 학생별로 1번부터 30번까지 출석번호가 붙어 있다.   
교수님이 내준 특별과제를 28명이 제출했는데,   
그 중에서 제출 안 한 학생 2명의 출석번호를 구하는 프로그램을 작성하시오.   
```
var nums: [Int] = []
var counts: [Int] = []

for _ in 1...28 {
    nums.append(Int(readLine()!)!)
}
for i in 1...30 {
    if(nums.firstIndex(of: i) == nil) {
        counts.append(i)
    }
}
print("\(counts.min()!)\n\(counts.max()!)")
```
## 3052
두 자연수 A와 B가 있을 때, A%B는 A를 B로 나눈 나머지 이다.   
예를 들어, 7, 14, 27, 38을 3으로 나눈 나머지는 1, 2, 0, 2이다.   
수 10개를 입력받은 뒤, 이를 42로 나눈 나머지를 구한다.   
그 다음 서로 다른 값이 몇 개 있는지 출력하는 프로그램을 작성하시오.   
```
var nums = Set<Int>()        // 중복없는 배열
for _ in 0...9 {
    let input = Int(readLine()!)!
    nums.insert(input%42)
}
print(nums.count)
```
## 1546 평균
세준이는 기말고사를 망쳤다. 세준이는 점수를 조작해서 집에 가져가기로 했다.   
일단 세준이는 자기 점수 중에 최댓값을 골랐다. 이 값을 M이라고 한다.   
그리고 나서 모든 점수를 점수/M*100으로 고쳤다.   
예를 들어, 세준이의 최고점이 70이고, 수학점수가 50이었으면 수학점수는 50/70*100이 되어 71.43점이 된다.   
세준이의 성적을 위의 방법대로 새로 계산했을 때, 새로운 평균을 구하는 프로그램을 작성하시오.   
```
let count = Double(readLine()!)!
let input = readLine()!.split(separator:" ").map{Double($0)!}
var Maximum = input.max()!
let secondInput = input.map{$0 / Maximum * 100}
var sum: Double = 0.0
for i in secondInput {
    sum += i
}
print(sum/count)
```
## 8958
"OOXXOXXOOO"와 같은 OX퀴즈의 결과가 있다. O는 문제를 맞은 것이고, X는 문제를 틀린 것이다.   
문제를 맞은 경우 그 문제의 점수는 그 문제까지 연속된 O의 개수가 된다. 예를 들어, 10번 문제의 점수는 3이 된다.   
"OOXXOXXOOO"의 점수는 1+2+0+0+1+0+0+1+2+3 = 10점이다.   
OX퀴즈의 결과가 주어졌을 때, 점수를 구하는 프로그램을 작성하시오.   
```
let count = Int(readLine()!)!

for _ in 0..<count {
    print(readLine()!.split(separator: "X").reduce(0){
        $0 + ($1.count * ($1.count + 1) / 2)
    })
}

```
## 4344
대학생 새내기들의 90%는 자신이 반에서 평균은 넘는다고 생각한다.   
당신은 그들에게 슬픈 진실을 알려줘야 한다.   
```
import Foundation

let count = Int(readLine()!)!
for _ in 0..<count {
    var result: Int = 0
    var num: [Int] = readLine()!.split(separator:" ").map{Int($0)!}
    let stunum : Int = num[0]
    num.removeFirst()        // 1번항 제거
    
    for i in 0..<stunum {
        if num[i] > num.reduce(0, {$0 + $1}) / stunum {
            result += 1
        }
    }
    print(String(format: "%.3f",Float(result) / Float(stunum) * 100),"%",separator: "")
}
```
