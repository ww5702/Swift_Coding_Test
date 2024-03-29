# 특정 원소가 속해 있는지 빠르게 찾거나, 각 원소에 대응되는 원소를 빠르게 찾는 자료구조를 배워 봅시다.
## 10815
숫자 카드는 정수 하나가 적혀져 있는 카드이다. 상근이는 숫자 카드 N개를 가지고 있다.   
정수 M개가 주어졌을 때, 이 수가 적혀있는 숫자 카드를 상근이가 가지고 있는지 아닌지를 구하는 프로그램을 작성하시오.
```
func solution() {
	let n = Int(readLine()!)!
	var card = readLine()!.split(separator:" ").map{Int($0)!}
	let m = Int(readLine()!)!
	let user = readLine()!.split(separator:" ").map{Int($0)!}
	var answer: [String] = []
	
	card.sort()
	
	for i in user {
		if binarySearch(0, n-1, i, card) {
			answer.append("1")
		} else {
			answer.append("0")
		}
	}
	print(answer.joined(separator:" "))
}

func binarySearch(_ left: Int, _ right: Int, _ number: Int, _ array:[Int]) -> Bool {
	var result = false
	if left > right {
		return false
	}
	let middle: Int = (left + right) / 2
	if array[middle] > number {
		result = binarySearch(left, middle-1, number, array)
	} else if array[middle] < number {
		result = binarySearch(middle+1, right, number ,array)
	} else {
		return false
	}
	
	return result
}

solution()

```
이분탐색을 사용하는 문제이다.   
Binary Search - 시간복잡도 O(logn)은 절반씩 제외시키면서 찾는다.   
따라서 최대 log2(n)번만에 정답을 찾을 수 있다.   

## 14425
총 N개의 문자열로 이루어진 집합 S가 주어진다.   
입력으로 주어지는 M개의 문자열 중에서 집합 S에 포함되어 있는 것이 총 몇 개인지 구하는 프로그램을 작성하시오.   
```
import Foundation
let input = readLine()!.split(separator:" ").map{Int($0)!}
let n = input[0], m = input[1]
var arr: [String] = []
var check: [String] = []
for _ in 0..<n {
	arr.append(readLine()!)
}
for _ in 0..<m {
	check.append(readLine()!)
}

func solution(_ arr:[String], _ check:[String]) -> Int{
	var cnt = 0
	for i in 0..<n {
		for j in 0..<m {
			if arr[i].contains(check[j]) {
				cnt += 1
			}
		}
	}
	return cnt-1
}

print(solution(arr,check))
```
첫 제출   
시간초과가 발생   
```
let n = readLine()!.split(separator: " ").map { Int($0)! }
var s = Set<String>()
var s2: [String] = []
for _ in 0..<n[0] {
    s.insert(readLine()!)
}
for _ in 0..<n[1] {
	s2.append(readLine()!)
}
var count = 0
for i in 0..<n[1] {
    if s.contains(s2[i]) { count += 1 }
}
print(count)
```
두번째 제출   
코드 단축을 시켜보았다.
```
let n = readLine()!.split(separator: " ").map { Int($0)! }
var s = Set<String>()
for _ in 0..<n[0] {
    s.insert(readLine()!)
}
var count = 0
for _ in 0..<n[1] {
    if s.contains(readLine()!) { count += 1 }
}
print(count)
```
세번째 제출
배열을 하나로 줄여 시간을 더욱 단축시킬 수 있었다.   

## 7785 회사에 있는 사람   
삭제 remove는 시간복잡도가 O(n)이다.   
삭제 행동이 시간복잡도가 O(1)으로 사용가능한 배열은   
dictionary, set이다.   
```
import Foundation
func solution() {
    var N = Int(readLine()!)!
    var arr = Set<String>()
    for _ in 1...N {
        var str = readLine()!.split(separator: " ").map{String($0)}
        if str[1] == "enter" {
            arr.insert(str[0])
        } else {
            arr.remove(str[0])
        }
    }
    for i in arr.sorted(by: >) {
        print(i)
    }
}
solution()

```

## 1620
그럼 다솜아 이제 진정한 포켓몬 마스터가 되기 위해 도감을 완성시키도록 하여라.   
일단 네가 현재 가지고 있는 포켓몬 도감에서 포켓몬의 이름을 보면 포켓몬의 번호를 말하거나,   
포켓몬의 번호를 보면 포켓몬의 이름을 말하는 연습을 하도록 하여라.   
나의 시험을 통과하면, 내가 새로 만든 도감을 주도록 하겠네.
```
let input = readLine()!.split(separator: " ").map { Int($0)! }
var res1 = [String : Int]()
var res2 = [Int : String]()

for i in 0..<input[0] {
    let pokemon = readLine()!
    res1[pokemon] = i + 1
    res2[i + 1] = pokemon
}

for _ in 0..<input[1] {
    let who = readLine()!
    
    if let isint = Int(who) {
        print(res2[isint]!)
    } else {
        print(res1[who]!)
    }
}
```
포켓몬 이름과 포켓몬 번호를 동시에 저장하는 방법이 생각이 안나 그냥 배열 두개로 일단 풀었다.   
dictionary를 이용해서 저장하는 방법도 해봤다
```
var dict: [Int: String] = [:]

for i in 0..<input[0] {
	dict.updateValue(readLine()!, forKey: i+1)

}
var keys = dict.map{$0.0}
var values = dict.map{$0.1}
```
위와 같은 방법으로 포켓몬의 이름과 순서마다 번호를 붙여주었지만 출력하는 방법이 마땅히 생각나지 않았다.   
## 10816
숫자 카드는 정수 하나가 적혀져 있는 카드이다. 상근이는 숫자 카드 N개를 가지고 있다.   
정수 M개가 주어졌을 때, 이 수가 적혀있는 숫자 카드를 상근이가 몇 개 가지고 있는지 구하는 프로그램을 작성하시오.   
```
let n = Int(readLine()!)!
var narr = readLine()!.split(separator:" ").map{Int($0)!}

let m = Int(readLine()!)!
var marr =  readLine()!.split(separator:" ").map{Int($0)!}

var dict = [Int:Int]()
var result: [Int] = []

narr.sort()

for i in narr {
	if dict.keys.contains(i) {
		dict[i]! += 1
	} else {
		dict[i] = 1
	}
}

for j in marr {
	if dict.keys.contains(j) {
		result.append(dict[j]!)
	} else {
		result.append(0)
	}
}

print(result.map{String($0)}.joined(separator:" "))
```
dictionary를 이용하여 풀이하였다   
## 1764
김진영이 듣도 못한 사람의 명단과, 보도 못한 사람의 명단이 주어질 때,   
듣도 보도 못한 사람의 명단을 구하는 프로그램을 작성하시오.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
var heararr = Set<String>()
var lookarr = Set<String>()

for _ in 0..<input[0] {
	heararr.insert(readLine()!)
}
for _ in 0..<input[1] {
	lookarr.insert(readLine()!)
}

let set = heararr.intersection(lookarr).sorted()

print(set.count)
print(set.joined(separator:"\n"))
```
set에는 union(합집합) intersection(교집합)등의 메서드가 있어 쉽게 풀 수있었다.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
var arr: [String] = []
for _ in 0..<input[0] {
	arr.append(readLine()!)
}
arr.sort()

func binarySearch(array: [String], item: String) -> Bool {
	var low = 0
	var high = array.count - 1
	
	while low <= high {
		let mid = (low + high) / 2
		let guess = array[mid]
		if guess == item {
			return true
		} else if guess > item {
			high = mid - 1
		} else {
			low = mid + 1
		}
	}
	
	return false
}

var cnt = 0
var res: [String] = []
for _ in 0..<input[1] {
	let read = readLine()!
	if binarySearch(array: arr, item: read) {
		cnt += 1
		res.append(read)
	}
}

print(cnt)
res.sort()
res.forEach{print($0)}
```
코드의 길이는 더 길어지지만 시간상으로는 이분탐색이 더 빠르다   
## 1269
자연수를 원소로 갖는 공집합이 아닌 두 집합 A와 B가 있다.   
이때, 두 집합의 대칭 차집합의 원소의 개수를 출력하는 프로그램을 작성하시오.   
두 집합 A와 B가 있을 때, (A-B)와 (B-A)의 합집합을 A와 B의 대칭 차집합이라고 한다.   
   
예를 들어, A = { 1, 2, 4 } 이고, B = { 2, 3, 4, 5, 6 } 라고 할 때,    
A-B = { 1 } 이고, B-A = { 3, 5, 6 } 이므로,   
대칭 차집합의 원소의 개수는 1 + 3 = 4개이다.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
let res = readLine()!.split(separator:" ").map{Int($0)!}
let res2 = readLine()!.split(separator:" ").map{Int($0)!}

var a = Set<Int>()
var b = Set<Int>()
for i in 0..<input[0] {
	a.insert(res[i])
}
for j in 0..<input[1] {
	b.insert(res2[j])
}

var asubnum = Set<Int>()
var bsubnum = Set<Int>()
asubnum = a.subtracting(b)
bsubnum = b.subtracting(a)

print(asubnum.count + bsubnum.count)
```
첫 제출은 set의 차집합 메서드를 사용해서 제출했다.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}

var a = Set<Int>()
var b = Set<Int>()
a = Set(readLine()!.split(separator:" ").map{Int($0)!})
b = Set(readLine()!.split(separator:" ").map{Int($0)!})

var asubnum = Set<Int>()
var bsubnum = Set<Int>()
asubnum = a.subtracting(b)
bsubnum = b.subtracting(a)

print(asubnum.count + bsubnum.count)
```
set선언을 더 짧게 만들어서 제출할 수 있었다.   
코드는 더 짧아졌지만 메모리는 더 크게 발생했다.   
## 11478
문자열 S가 주어졌을 때, S의 서로 다른 부분 문자열의 개수를 구하는 프로그램을 작성하시오.  
부분 문자열은 S에서 연속된 일부분을 말하며, 길이가 1보다 크거나 같아야 한다.  
예를 들어, ababc의 부분 문자열은 a, b, a, b, c, ab, ba, ab, bc, aba, bab, abc, abab, babc, ababc가 있고,   
서로 다른것의 개수는 12개이다.   
```
let arr = Array(readLine()!)
var s = Set<String>()

for i in 0..<arr.count {
	for j in 0..<arr.count-i {
		if i == 0 {
			s.insert("\(arr[j])")
		} else if i == 1 {
			s.insert("\(arr[j])\(arr[j+1])")
		} else if i == 2 {
			s.insert("\(arr[j])\(arr[j+1])\(arr[j+2])")
		} else if i == 3 {
			s.insert("\(arr[j])\(arr[j+1])\(arr[j+2])\(arr[j+3])")
		} else {
			s.insert("\(arr[j])\(arr[j+1])\(arr[j+2])\(arr[j+3])\(arr[j+4])")
		}
	}
}
print(s.count)
```
set에 하나씩 저장해주는 방법으로 첫 제출을 했다.   
부분합을 보다 쉽게 입력할수 있는 방법을 생각해봐야겠다.   
```
let input = readLine()!
var res: Set<Substring> = []
for cnt in 1 ... input.count {
    for start in 0 ... input.count - cnt {
        res.insert(input[String.Index.init(encodedOffset: start) ..< String.Index.init(encodedOffset: start + cnt)])
    }	
}
print(res.count)
```
검색하다보니 string.index로 이를 표현할 수 있었다.   
string.startIndex 가 abcd의 String의 첫 글자를 뜻하는 문법이다.   
또한 String.Index(encodedOffset: 0) 도 첫번째 글자를 의미한다.   
