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
