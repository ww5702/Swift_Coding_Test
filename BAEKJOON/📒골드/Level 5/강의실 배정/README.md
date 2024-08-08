전형적인 그리디 문제이다.   
강의실이 시작되는 시간에 +1   
끝나는 시간에 -1을 해주는것이다.   
시간순서대로 정렬했기에 정답이 출력된다.   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var arr: [(Int,Bool)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        arr.append((input[0],true))
        arr.append((input[1],false))
    }
    arr.sort(by: {$0.0 == $1.0 ? !$0.1 : $0.0 < $1.0})
    //print(arr)
    var result = -1
    var cur = 0
    for i in 0..<arr.count {
        if arr[i].1 {
            cur += 1
            result = max(result, cur)
        } else {
            cur -= 1
        }
    }
    print(result)
}


solution()
/*
 */

```
