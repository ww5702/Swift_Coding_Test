구현 문제이다.   
레이저로 자를때() 지금까지 열려있는 (의 개수만큼 결과값에 더해주고,   
막대기까 끝난 ) 표시일때마다 막대기 하나를 빼줌과 동시에 결과값+1을 해준다.    

```
import Foundation
func solution(){
    let input = Array(readLine()!).map{String($0)}
    var arr: [String] = []
    //print(input)
    
    var idx = 0, result = 0, cnt = 0
    while idx < input.count {
        if input[idx] == "(" && input[idx+1] == ")" {
            result += cnt
            idx += 2
        } else if input[idx] == "(" && input[idx+1] != ")" {
            cnt += 1
            idx += 1
        } else if input[idx] == ")" {
            cnt -= 1
            result += 1
            idx += 1
        }
    }
    //print(arr)
    
    //3 3 1 3 1 2 1 1 1 1
    print(result)
}
solution()

```
