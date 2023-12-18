# 이분 탐색 알고리즘을 배워 봅시다.	
## 1920 수 찾기
이분정렬을 활용해 풀이한다.   
```
import Foundation

func solution() {
    let N = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    arr.sort()
    let M = Int(readLine()!)!
    let value = readLine()!.split(separator: " ").map{Int($0)!}
    for v in value {
        checkOk(v) ? print(1) : print(0)
    }
    
    func checkOk(_ num: Int) -> Bool {
        var start = 0, end = N-1
        while start <= end {
            let mid = (start+end)/2
            if arr[mid] == num { return true }
            
            if arr[mid] > num {
                end = mid-1
            } else {
                start = mid+1
            }
        }
        return false
    }
}

solution()

```
## 1654 랜선자르기
주어진 랜선의 크기중 start를 1로 하는것이 중요하다.   
나머지는 평범한 이분정렬처럼 구해준다.   
단, N과 같다고 바로 return해주는것이 아닌   
최대 길이를 구하는것이기에 start를 계속해서 끌어올려준다.   

```
import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let(K,N) = (input[0],input[1])
    var arr: [Int] = []
    for _ in 0..<K {
        arr.append(Int(readLine()!)!)
    }
    arr.sort()
    var start = 1
    var end = arr.last!
    var result = 0
    while start <= end {
        let mid = (start+end)/2
        var ret = 0
        for i in arr {
            ret += (i/mid)
        }
        if ret >= N {
            result = max(result,mid)
            start = mid+1
        } else {
            end = mid-1
        }
    }
    print(result)
}

solution()

```
## 2805 나무 자르기
주어진 값들을 정렬 후 이분탐색에 쓰일 start, end값을 지정한다.   
지정후 mid값을 기준으로 나무들을 잘랐을때 가져가는 나무인(temp)값이   
원하는 M의 크기보다 클 경우 바로 return해주는것이 아닌   
M을 가져갈 수 있는 최대의 나무 높이를 구하기 위해   
start 값을 mid+1로 설정해준다.   
당연히 M보다 적을 경우 자를 나무의 높이를 낮춰줘야하기에 end값을 조정해준다.   
```
import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (N,M) = (input[0],input[1])
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    arr.sort()
    var start = 1, end = arr.last!
    var result = 0
    while start <= end {
        let mid = (start+end)/2
        var temp = 0
        for a in arr {
            if a > mid {
                temp += (a-mid)
            }
        }
        if temp >= M {
            result = max(result,mid)
            start = mid + 1
        } else {
            end = mid - 1
        }
        
    }
    print(result)
}

solution()

```
