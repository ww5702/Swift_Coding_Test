항상 생각하지만 백준 문제중에서는 검증된 문제가 아니면   
설명이 제대로 안되있는 문제들이 많은것 같다.   
```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    let max = arr.max()!
    var board = Array(repeating: false, count: 10000001)
    for num in arr {
        board[num] = true
    }
    
    var result = 0
    for num in arr {
        if num >= m { continue }
        if board[m-num] {
            result += 1
            board[num] = false
            board[m-num] = false
        }
    }
    
    print(result)
}
solution()

```
위 방식은 고유 번호가 존재한다기에 중복된 숫자가 없다고 판단하여 배열을 만들어   
재료로 사용했을때 없애주는 방식으로 풀이하였다.   
하지만 중복된 재료가 있는 모양이다.   
따라서 이분탐색으로 한칸씩 줄이면서, m이 맞으면 다음 번호로 넘어가는 방식으로 풀이했다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    arr.sort()
    var (start, end) = (0,n-1)
    var cnt = 0
    
    while start < end {
        if arr[start] + arr[end] > m {
            end = end - 1
        } else if arr[start] + arr[end] < m {
            start = start + 1
        } else {
            cnt += 1
            end = end-1
            start = start+1
        }
    }
    
    print(cnt)
}
solution()

```
