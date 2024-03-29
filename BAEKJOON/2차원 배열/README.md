# 배열 안에 배열이 있다면 어떨까요? 2차원 배열을 만들어 봅시다.
## 2738 행렬 덧셈
N*M크기의 두 행렬 A와 B가 주어졌을 때, 두 행렬을 더하는 프로그램을 작성하시오.   
```
import Foundation

func solution(_ x: Int, _ y: Int) -> [[Int]] {
    var res = [[Int]]()
    let A = maker(x, y)
    let B = maker(x, y)
    for i in 0 ..< x {
        res.append([])
        for j in 0 ..< y {
            res[i].append(A[i][j] + B[i][j])
        }
    }
    return res
}

func maker(_ x: Int, _ y: Int) -> [[Int]] {
    var res = [[Int]]()
    for i in 0 ..< x {
        res.append([])
        res[i].append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
    }
    return res
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let x = input[0], y = input[1]
let result = solution(x, y)
for i in 0 ..< x {
    for j in 0 ..< y {
        print(result[i][j], terminator: " ")
    }
    print()
}
```
## 2566 최댓값
<그림 1>과 같이 9×9 격자판에 쓰여진 81개의 자연수 또는 0이 주어질 때,   
이들 중 최댓값을 찾고 그 최댓값이 몇 행 몇 열에 위치한 수인지 구하는 프로그램을 작성하시오.   
   
예를 들어, 다음과 같이 81개의 수가 주어지면   
<img width="363" alt="스크린샷 2023-01-03 오후 5 21 10" src="https://user-images.githubusercontent.com/60501045/210321245-2be83674-bb2a-44c6-86ac-ffcd45eb7b54.png">   
이들 중 최댓값은 90이고, 이 값은 5행 7열에 위치한다.   
```
var res = [[Int]](repeating:[Int](repeating:0, count:9),count:9)
var (max, a, b) = (-1, 0, 0)		// 이런 형식으로 다수를 변수선언 가능

for i in 0..<9 {
	let input = readLine()!.split(separator:" ").map{Int($0)!}
	for j in 0..<9 {
		res[i][j] = input[j]
		//print(res[i][j],terminator:" ")
		if(res[i][j] > max) {
			max = res[i][j]
			a = i
			b = j
		}
	}
	//print()
}
print(max)
print("\(a+1) \(b+1)")
```
## 10798 세로읽기
아직 글을 모르는 영석이가 벽에 걸린 칠판에 자석이 붙어있는 글자들을 붙이는 장난감을 가지고 놀고 있다.   
이 장난감에 있는 글자들은 영어 대문자 ‘A’부터 ‘Z’, 영어 소문자 ‘a’부터 ‘z’, 숫자 ‘0’부터 ‘9’이다.   
영석이는 칠판에 글자들을 수평으로 일렬로 붙여서 단어를 만든다. 다시 그 아래쪽에 글자들을 붙여서 또 다른 단어를 만든다.   
이런 식으로 다섯 개의 단어를 만든다. 아래 그림 1은 영석이가 칠판에 붙여 만든 단어들의 예이다.   
   
![image](https://user-images.githubusercontent.com/60501045/224992123-7f16167d-b66f-46bc-a24f-29973f9c927c.png)   
   
한 줄의 단어는 글자들을 빈칸 없이 연속으로 나열해서 최대 15개의 글자들로 이루어진다.   
또한 만들어진 다섯 개의 단어들의 글자 개수는 서로 다를 수 있다.   
심심해진 영석이는 칠판에 만들어진 다섯 개의 단어를 세로로 읽으려 한다.   
세로로 읽을 때, 각 단어의 첫 번째 글자들을 위에서 아래로 세로로 읽는다. 다음에 두 번째 글자들을 세로로 읽는다.   
이런 식으로 왼쪽에서 오른쪽으로 한 자리씩 이동 하면서 동일한 자리의 글자들을 세로로 읽어 나간다.   
위의 그림 1의 다섯 번째 자리를 보면 두 번째 줄의 다섯 번째 자리의 글자는 없다.   
이런 경우처럼 세로로 읽을 때 해당 자리의 글자가 없으면, 읽지 않고 그 다음 글자를 계속 읽는다. 그림 1의 다섯 번째 자리를 세로로 읽으면 D1gk로 읽는다.   
   
그림 1에서 영석이가 세로로 읽은 순서대로 글자들을 공백 없이 출력하면 다음과 같다:   
Aa0aPAf985Bz1EhCz2W3D1gkD6x   
칠판에 붙여진 단어들이 주어질 때, 영석이가 세로로 읽은 순서대로 글자들을 출력하는 프로그램을 작성하시오.   
```
var arr : [[String]] = Array(repeating:Array(repeating : "!", count : 15), count : 5)
for i in 0..<5 {
	let input = Array(readLine()!)
	//print(input)
	for j in 0..<input.count {
		arr[i][j] = String(input[j])
	}
}
var answer : [String] = []
for i in 0..<15 {
	for j in 0..<5 {
		if arr[j][i] != "!" { answer.append(arr[j][i]) }
	}
}
print(answer.joined(separator:""))
```
replaceSubrane를 사용하면 더 깔끔하게 풀 수 있을거 같아서 바꿔보았다.     
```
var arr : [[String]] = Array(repeating:Array(repeating : "", count : 15), count : 5)
for i in 0..<5 {
	let input = readLine()!.map{String($0)}
	arr[i].replaceSubrange(0..<input.count-1, with: input)
}
for i in 0..<15 {
	for j in 0..<5 {
		print(arr[j][i], terminator:"")
	}
}
```
하지만 처리시간은 12ms 로 전에 풀었던 8ms보다는 길게 나왔다.   

 ## 2563 색종이
 가로, 세로의 크기가 각각 100인 정사각형 모양의 흰색 도화지가 있다.   
 이 도화지 위에 가로, 세로의 크기가 각각 10인 정사각형 모양의 검은색 색종이를 색종이의 변과 도화지의 변이 평행하도록 붙인다.   
 이러한 방식으로 색종이를 한 장 또는 여러 장 붙인 후 색종이가 붙은 검은 영역의 넓이를 구하는 프로그램을 작성하시오.   
 <img width="296" alt="스크린샷 2023-01-04 오후 2 35 06" src="https://user-images.githubusercontent.com/60501045/210490780-e93c6d12-5ab8-4911-ae34-ea603bf577fa.png">    
예를 들어 흰색 도화지 위에 세 장의 검은색 색종이를 그림과 같은 모양으로 붙였다면 검은색 영역의 넓이는 260이 된다.   
```
let input = Int(readLine()!)!
var paper: [[Int]] = Array(repeating: [Int](repeating: 0, count: 100), count:100)
var result = 0
for _ in 0..<input {
	var a = readLine()!.split(separator:" ").map{Int($0)!}
	let x = a[0]
	let y = a[1]
	for i in x..<x+10 {
		for j in y..<y+10 {
			if paper[i][j] == 0 {
				result += 1
				paper[i][j] = 1
			}
		}
	}
	
}
print(result)
```
곱셈을 하려고 너무 애쓰다보니 시간을 생각보다 잡아먹었다.   
그냥 채워지는 곳마다 +1을 해주니 쉽게 풀림.
