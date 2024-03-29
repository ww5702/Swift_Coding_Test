# 특정 상황에서 성립하는 그리디 알고리즘을 배워 봅시다.
## 11047 동전 0
준규가 가지고 있는 동전은 총 N종류이고, 각각의 동전을 매우 많이 가지고 있다.   
동전을 적절히 사용해서 그 가치의 합을 K로 만들려고 한다. 이때 필요한 동전 개수의 최솟값을 구하는 프로그램을 작성하시오.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
var (n,k) = (input[0],input[1])
var arr : [Int] = []
var count = 0
for i in 0..<n {
	arr.append(Int(readLine()!)!)
}
for i in arr.reversed() {
	if k >= i {
		count += (k / i)
		k %= i
	}
}
print(count)
```
그리디 알고리즘을 사용하는 가장 대표적인 문제 중 하나라고 봐도 무방하다.   
그리디 알고리즘이라는 맥락만 파악한다면 정말 쉬운 문제   

## 1931 회의실 배정
한 개의 회의실이 있는데 이를 사용하고자 하는 N개의 회의에 대하여 회의실 사용표를 만들려고 한다.   
각 회의 I에 대해 시작시간과 끝나는 시간이 주어져 있고, 각 회의가 겹치지 않게 하면서 회의실을 사용할 수 있는 회의의 최대 개수를 찾아보자.   
단, 회의는 한번 시작하면 중간에 중단될 수 없으며 한 회의가 끝나는 것과 동시에 다음 회의가 시작될 수 있다.   
회의의 시작시간과 끝나는 시간이 같을 수도 있다. 이 경우에는 시작하자마자 끝나는 것으로 생각하면 된다.   
```
let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating : 0, count : 2), count : n)
for i in 0..<n {
	let input = readLine()!.split(separator:" ").map{Int($0)!}
	arr[i][0] = input[0]
	arr[i][1] = input[1]
}
var count = 1
//print(arr)
var end = arr[0][1]
for i in 1..<n {
	if arr[i][0] > end {
		count += 1
		end = arr[i][1]
	}
}
print(count)
```
끝나는 시간을 기준으로 생각하려 했으나 실패   
```
// we read standard input line by line
let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating : 0, count : 2), count : n)
for i in 0..<n {
	let input = readLine()!.split(separator:" ").map{Int($0)!}
	arr[i][0] = input[0]
	arr[i][1] = input[1]
}
//print(arr)
let sortedarr = arr.sorted(by: {($0[1], $0[0]) < ($1[1], $1[0])})
//print(sortedarr)
var now: Int = -1
var count = 0

for i in sortedarr {
	if i[0] >= now {
		now = i[1]
		count += 1
	}
}
print(count)
```
비슷한 생각으로 접근하는것은 맞았으나 정렬을 먼저 해줬어야 했다.   
끝나는 시간을 기준으로 정렬하되, 만약 끝나는 시간이 같다면 먼저 끝나는 회의를 기준으로 정렬해주고,   
값을 찾아준다.   

## ATM
인하은행에는 ATM이 1대밖에 없다. 지금 이 ATM앞에 N명의 사람들이 줄을 서있다.   
사람은 1번부터 N번까지 번호가 매겨져 있으며, i번 사람이 돈을 인출하는데 걸리는 시간은 Pi분이다.   
   
사람들이 줄을 서는 순서에 따라서, 돈을 인출하는데 필요한 시간의 합이 달라지게 된다.   
예를 들어, 총 5명이 있고, P1 = 3, P2 = 1, P3 = 4, P4 = 3, P5 = 2 인 경우를 생각해보자.   
[1, 2, 3, 4, 5] 순서로 줄을 선다면, 1번 사람은 3분만에 돈을 뽑을 수 있다.   
2번 사람은 1번 사람이 돈을 뽑을 때 까지 기다려야 하기 때문에, 3+1 = 4분이 걸리게 된다.   
3번 사람은 1번, 2번 사람이 돈을 뽑을 때까지 기다려야 하기 때문에, 총 3+1+4 = 8분이 필요하게 된다.   
4번 사람은 3+1+4+3 = 11분, 5번 사람은 3+1+4+3+2 = 13분이 걸리게 된다.   
이 경우에 각 사람이 돈을 인출하는데 필요한 시간의 합은 3+4+8+11+13 = 39분이 된다.   
   
줄을 [2, 5, 1, 4, 3] 순서로 줄을 서면, 2번 사람은 1분만에,   
5번 사람은 1+2 = 3분, 1번 사람은 1+2+3 = 6분, 4번 사람은 1+2+3+3 = 9분, 3번 사람은 1+2+3+3+4 = 13분이 걸리게 된다.   
각 사람이 돈을 인출하는데 필요한 시간의 합은 1+3+6+9+13 = 32분이다. 이 방법보다 더 필요한 시간의 합을 최소로 만들 수는 없다.   
   
줄을 서 있는 사람의 수 N과 각 사람이 돈을 인출하는데 걸리는 시간 Pi가 주어졌을 때,   
각 사람이 돈을 인출하는데 필요한 시간의 합의 최솟값을 구하는 프로그램을 작성하시오.   
```
let n = Int(readLine()!)!
var arr = Array(readLine()!.split(separator:" ").map{Int($0)!})
arr.sort(by:<)
//print(arr)
var now = 0
var sum = 0
for i in arr {
	now += i
	sum += now
}
print(sum)
```
주어진 인출시간을 오름차순으로 정렬한다음 누적합을 구하면 되는 기본적인 문제   

## 1541 잃어버린 괄호
세준이는 양수와 +, -, 그리고 괄호를 가지고 식을 만들었다. 그리고 나서 세준이는 괄호를 모두 지웠다.   
그리고 나서 세준이는 괄호를 적절히 쳐서 이 식의 값을 최소로 만들려고 한다.   
괄호를 적절히 쳐서 이 식의 값을 최소로 만드는 프로그램을 작성하시오.   
```
import Foundation
 
func solution() {
    let minusSplit = readLine()!.split(separator: "-").map{String($0)}
    //print(minusSplit)
    let plus = minusSplit[0].split(separator: "+").map{Int(String($0))!}
    //print(plus)
    var result = 0
    // 처음 플러스값 다 더하기
    for i in plus {
        result += i
    }
    var minusTotal = 0
    for i in 1..<minusSplit.count {
        let minus = minusSplit[i].split(separator: "+").map{Int(String($0))!}
        for j in minus {
            minusTotal += j
        }
    }
    print(result - minusTotal)
}

solution()

```
먼저 -를 기준으로 배열을 만들어 준다.   
처음 -가 나오기 전까지 모든 합들을 더해주고(plus)   
다음 -가 나올때까지의 값들을 따로 더해주고(minus)   
위의 과정들이 끝날때가지 다 더해준다(minusTotal)   
그리고 minustotal값들을 처음 plus값들에서 빼준다면 최소값이 나온다.   

## 13305 주유소
어떤 나라에 N개의 도시가 있다. 이 도시들은 일직선 도로 위에 있다.   
편의상 일직선을 수평 방향으로 두자. 제일 왼쪽의 도시에서 제일 오른쪽의 도시로 자동차를 이용하여 이동하려고 한다.   
인접한 두 도시 사이의 도로들은 서로 길이가 다를 수 있다. 도로 길이의 단위는 km를 사용한다.   
   
처음 출발할 때 자동차에는 기름이 없어서 주유소에서 기름을 넣고 출발하여야 한다.   
기름통의 크기는 무제한이어서 얼마든지 많은 기름을 넣을 수 있다.   
도로를 이용하여 이동할 때 1km마다 1리터의 기름을 사용한다.   
각 도시에는 단 하나의 주유소가 있으며, 도시 마다 주유소의 리터당 가격은 다를 수 있다. 가격의 단위는 원을 사용한다.   
   
예를 들어, 이 나라에 다음 그림처럼 4개의 도시가 있다고 하자.   
원 안에 있는 숫자는 그 도시에 있는 주유소의 리터당 가격이다. 도로 위에 있는 숫자는 도로의 길이를 표시한 것이다.   
   
<img width="301" alt="스크린샷 2023-02-24 오후 5 19 37" src="https://user-images.githubusercontent.com/60501045/221128444-03a0c39d-6226-4569-9591-a0fd006379c9.png">   
   
제일 왼쪽 도시에서 6리터의 기름을 넣고, 더 이상의 주유 없이 제일 오른쪽 도시까지 이동하면 총 비용은 30원이다.   
만약 제일 왼쪽 도시에서 2리터의 기름을 넣고(2×5 = 10원)   
다음 번 도시까지 이동한 후 3리터의 기름을 넣고(3×2 = 6원)   
다음 도시에서 1리터의 기름을 넣어(1×4 = 4원) 제일 오른쪽 도시로 이동하면, 총 비용은 20원이다.   
또 다른 방법으로 제일 왼쪽 도시에서 2리터의 기름을 넣고(2×5 = 10원)   
다음 번 도시까지 이동한 후 4리터의 기름을 넣고(4×2 = 8원) 제일 오른쪽 도시까지 이동하면, 총 비용은 18원이다.   
   
각 도시에 있는 주유소의 기름 가격과, 각 도시를 연결하는 도로의 길이를 입력으로 받아   
제일 왼쪽 도시에서 제일 오른쪽 도시로 이동하는 최소의 비용을 계산하는 프로그램을 작성하시오.   
```
import Foundation
 
func solution() {
    let n = Int(readLine()!)!
    var km = readLine()!.split(separator: " ").map{Int($0)!}
    var value = readLine()!.split(separator: " ").map{Int($0)!}
    //print(km,value)
    var total = 0
    // 현재 가격
    var nowprice = value[0]
    // 현재 가격보다 싼 곳이 나올때까지 거리 x 기름
    for i in 0..<km.count {
        // 만약 현재 value값이 now값보다 싸다면 now값을 변환
        if nowprice > value[i] {
            nowprice = value[i]
        }
        // 아니라면 예전 가격으로 왓던 km수 만큼 더하기
        total += (nowprice * km[i])
    }
    print(total)
}

solution()
```
현재 기름값을 now에 넣어준다.   
그 후 현재 기름값인 now보다 싼 기름값이 나올때까지 이동한 거리를 now의 기름값으로 계산한다.   
만약 더 싼 기름값이 나온다면 now값을 그 순간 그 장소의 기름값으로 변경시켜준다.   
