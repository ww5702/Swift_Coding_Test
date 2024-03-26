소수 구하기 알고리즘을 에라토스테네스의 체로 풀이해보자.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (start,end) = (input[0],input[1])
    var arr = Array(repeating: true, count: end+1)
    arr[0] = false
    arr[1] = false
    for i in 2...Int(sqrt(Double(end))) {
        if arr[i] == true {
            for j in 2...end/i {
                arr[i*j] = false
            }
        }
    }
    for i in start...end {
        if arr[i] { print(i) }
    }
}
solution()
```
0,1을 제외하고 2부터 반복문을 시작한다.   
x1을 제외하고 x2부터 ixj가 end를 넘지않을때까지 곱하면서 해당 인덱스를 false로 변환한다.   
arr[i]가 true일때만 반복한다 -> 2,3,5,7 등등   
