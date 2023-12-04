# 간단한 도형으로 기하 문제풀이를 시작해 봅시다.	
## 27323 직사각형 
넓이를 구해준다.   
```
import Foundation
func solution() {
    var A = Int(readLine()!)!
    var B = Int(readLine()!)!
    print(A*B)
}
solution()
```

## 1085 직사각형에서 탈출
한수는 지금 (x, y)에 있다.   
직사각형은 각 변이 좌표축에 평행하고, 왼쪽 아래 꼭짓점은 (0, 0), 오른쪽 위 꼭짓점은 (w, h)에 있다.   
직사각형의 경계선까지 가는 거리의 최솟값을 구하는 프로그램을 작성하시오.   
```
let input = readLine()!.split(separator:" ").map{Int($0)!}
let x = input[0], y = input[1], w = input[2], h = input[3]
var arr: [Int] = []
arr.append(x)
arr.append(y)
arr.append(w-x)
arr.append(h-y)

print(arr.min()!)
```
각 변으로의 거리값을 구한뒤 최소값을 출력   
```
var input = readLine()!.split(separator:" ").map{Int($0)!}

input[2] -= input[0]
input[3] -= input[1]

print(input.min()!)
```
선언 순간부터 뺄셈을 넣고 시작하니 코드를 더 줄일 수 있었다.   
## 3009 네 번째 점
세 점이 주어졌을 때, 축에 평행한 직사각형을 만들기 위해서 필요한 네 번째 점을 찾는 프로그램을 작성하시오.   
```
let arr1 = readLine()!.split(separator: " ").map{Int($0)!}
let arr2 = readLine()!.split(separator: " ").map{Int($0)!}
let arr3 = readLine()!.split(separator: " ").map{Int($0)!}
var arr4:[Int] = []
var temp = 0
for i in 0..<arr1.count {
    if arr1[i] == arr2[i] {
        arr4.append(arr3[i])
    }else if arr2[i] == arr3[i]  {
        arr4.append(arr1[i])
    }else if arr1[i] == arr3[i] {
        arr4.append(arr2[i])
    }
}
print("\(arr4[0]) \(arr4[1])")
```
x좌표가 같은게 2개, y좌표가 같은게 2개이기 때문에 하나씩 있다면 하나를 더 늘려줬다.   
```
var location = (0, 0)

for _ in 0..<3 {
    let point = readLine()!.split(separator: " ").map { Int(String($0))! }
    location.0 ^= point[0]
    location.1 ^= point[1]
}

print("\(location.0) \(location.1)")
```
비트연산자로도 풀이가 가능했다.   

## 15894 수학은 체육과목 입니다.
변이 아무리 커도 둘러쌓인 길이는 x 4 이다.   
```
import Foundation
func solution() {
    var n = Int(readLine()!)!
    print(n*4)
}
solution()

```
## 9063 대지 
입력받은 좌표들중 x,y좌표의 최대 최소값을 정한뒤 넓이를 구한다.   

```
import Foundation
func solution() {
    var N = Int(readLine()!)!
    var point: [[Int]] = []
    for _ in 0..<N {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        point.append([value[0],value[1]])
    }
    let maxX = point.map{$0[0]}.max()!
    let minX = point.map{$0[0]}.min()!
    let maxY = point.map{$0[1]}.max()!
    let minY = point.map{$0[1]}.min()!
    print((maxX-minX) * (maxY - minY))
}
solution()

```

## 10101 삼각형 외우기
조건에 따라 출력값을 변경해준다.   
```
import Foundation
func solution() {
    var A = Int(readLine()!)!
    var B = Int(readLine()!)!
    var C = Int(readLine()!)!
    var sum = A+B+C
    if (A == 60 && B == 60 && C == 60) {
        print("Equilateral")
    } else {
        if sum == 180 {
            if (A == B || B == C || C == A) {
                print("Isosceles")
            } else {
                print("Scalene")
            }
        } else {
            print("Error")
        }
    }
    
}
solution()

```
## 삼각형과 세 변
조건에 맞춰서 출력문을 
```
import Foundation
func solution() {
    while true {
        var input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if input.reduce(0, +) == 0 {
            break
        }
        input.sort(by:>)
        if input[0] >= input[1]+input[2] {
            print("Invalid")
        } else {
            if (input[0] == input[1]) && (input[1] == input[2]){
                print("Equilateral")
            } else {
                if (input[0] == input[1]) || (input[1] == input[2]) || (input[2] == input[0]) {
                    print("Isosceles")
                } else {
                    print("Scalene")
                }
            }
        }
        
    }
}
solution()

```
## 14215 세 막대
상황에 맞는 값을 출력해준다.   
```
import Foundation
func solution() {
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    input.sort()
    print(input[0]+input[1]+min(input[2], input[0]+input[1]-1))
}
solution()


```
