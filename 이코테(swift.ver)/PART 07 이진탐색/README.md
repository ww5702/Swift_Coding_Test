# 범위를 반씩 좁혀가는 탐색
이번에는 리스트 내에서 데이터를 아주 빠르게 탐색하는 이진 탐색 알고리즘에 대해서 공부한다.   
이진 탐색을 공부하기 전에 가장 기본 탐색 방법인 순차 탐색에 대해 먼저 이해할 필요가 있다.   
N개의 데이터가 있을 때, 그 데이터를 차례대로 하나씩 확인하여 처리한 경우도 많았는데 이를 순차 탐색이라고 할 수도 있다.   
이와 같이 순차 탐색이란 '리스트 안에 있는 특정한 데이터를 찾기 위해 앞에서부터 데이터를 하나씩 차례대로 확인하는 방법'이다. 
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{String($0)}
    func sequential_search(_ n: Int, _ target: String, _ arr: [String]) -> Int{
        var result = 0
        for i in 0..<n {
            if arr[i] == target {
                result = i+1
                break
            }
        }
        return result
    }
    let (n,target) = (Int(input[0])!,input[1])
    let arr = readLine()!.split(separator:" ").map{String($0)}
    print(sequential_search(n, target, arr))
}
solution()
```
데이터가 N개일 때 N번 비교연산을 하므로 공간복잡도는 O(N)이다.   
   
## 이진 탐색: 반으로 쪼개면서 탐색하기
본론인 이진탐색으로 넘어가자.   
이진 탐색은 배열 내부의 데이터가 이미 정렬되어있어야 사용할 수 있는 알고리즘이다.   
데이터가 무작위일떄는 사용할 수 없지만, 이미 정렬되어있다면 빠르게 찾을 수 있다.   
탐색 범위를 절반으로 좁혀가며 데이터를 탐색하는 특징이 있다.   
시작점, 끝점, 중간점 이 3개의 변수를 사용해 탐색한다.   
0 2 4 6 8 10 12 13 16 18   
위의 이미 정렬되어 있는 리스트가 있을 때 4인 원소를 찾는 방법은 이렇다.   
시작점은 0 끝점은 18 두 지점을 합친후 반으로 나눈것이 중간점이다.   
중간점이 실수일때는 소수점 이하를 버린다.   
시작점이 0, 끝점은 18, 중간점은 8이다.   
중간점 8과 찾아야하는 값 4를 비교한다.   
중간점이 더 크므로 중간점 이후의 값은 비교할 이유가 없다.   
끝점을 18에서 중간점 8 바로 전인 6으로 옮긴다.
위의 과정을 반복해 결과값을 찾아내는 구조이다.   
전체 데이터의 개수는 10개이지만 총 3번의 탐색으로 원소를 찾을 수 있었다.   
따라서 시간복잡도는 O(logN)이다.   
절반씩 데이터가 줄어들도록 만든다는 점에서 앞서 다룬 퀵 정렬과 공통점이 있따.   
   
위 이진탐색 알고리즘을 구현하는 방법에는 2가지 방법이 있는데 하나는 재귀함수를 이용하는 것이고,   
다른 하나는 반복문을 이용하는 방법이다.   
먼저 재귀함수를 이용해 구현해보자.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,target) = (input[0],input[1])
    let arr = Array(readLine()!.split(separator: " ").map{Int($0)!})
    
    func binary_sarch(_ arr: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int?{
        if start > end { return nil }
        var mid: Int = (start + end) / 2
        
        if arr[mid] == target {
            return mid
        }else if arr[mid] > target {
            return binary_sarch(arr, target, start, mid - 1)
        } else {
            return binary_sarch(arr, target, mid + 1, end)
        }
    }
    let result = binary_sarch(arr, target, 0, n-1)
    print(result!+1)
}
solution()
```
