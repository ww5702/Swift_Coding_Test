50 이하라 플로이드 워셜 가능   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = Array(repeating: Array(repeating: "N", count: n), count: n)
    for i in 0..<n {
        let input = Array(readLine()!.map{String($0)})
        arr[i] = input
    }
    var cnt = 0
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    for k in 0..<n {
       for i in 0..<n {
          // i부터 j까지 가는데 k를 거쳐서 가는게 더 빠르다면 변경
          for j in 0..<n {
              if i == j { continue }
              else {
                  if arr[i][j] == "Y" || (arr[i][k] == "Y" && arr[k][j] == "Y") {
                      result[i][j] = 1
                  }
              }
          }
       }
    }
    //print(result)
    for i in 0..<n {
        let sum = result[i].reduce(0, +)
        cnt = max(cnt, sum)
    }
    print(cnt)
}
solution()
```
