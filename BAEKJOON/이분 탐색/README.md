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
