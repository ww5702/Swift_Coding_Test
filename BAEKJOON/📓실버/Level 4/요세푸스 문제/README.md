양이 적어서 remove를 사용해서 풀이가 가능하다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,k) = (input[0],input[1])
    var list = [Int](1...n)
    var answer = [Int]()
    var cnt = k
    while !list.isEmpty {
        if cnt <= list.count {
            answer.append(list[cnt-1])
            list.remove(at: cnt-1)
            cnt = cnt + k - 1
        } else {
            cnt -= list.count
        }
    }
    //print(answer)
    print("<"+answer.map{String($0)}.joined(separator: ", ")+">")
}
solution()



```
