1번은 무조건 자기보다 큰 숫자들밖에 없으니 해당 자리에 넣어준다.   
그리고 그 뒤 숫자부터 0이거나 자기보다 더 큰 수가 들어가있다면 -1해준다.   
-1이 되는 순간이 해당 숫자의 자리이다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var result = Array(repeating: 0, count: n+1)
    result[input[0]+1] = 1
    for i in 1..<n {
        let num = i+1
        var cnt = input[i]
        //print(num, cnt)
        for i in 1...n {
            if result[i] == 0 || result[i] > num {
                cnt -= 1
            }
            if cnt == -1 {
                result[i] = num
                break
            }
        }
        //print(result[1...n])
    }
    print(result[1...n].map{String($0)}.joined(separator: " "))
}
solution()

```
