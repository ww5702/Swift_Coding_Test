주어진 Int 배열을 map을 이용해 String으로 변환시킨 뒤, 정렬을 사용하여 풀이한다.   
```
import Foundation
func solution(_ numbers:[Int]) -> String {
    let answer: String = numbers.map{String($0)}.sorted{$0+$1 > $1+$0}.joined()
    //print(answer)
    return answer.first == "0" ? "0" : answer
}
```
$0+$1 > $1+$0은   
[6, 10, 2] 일때 610이 큰지 106이 큰지 비교해주는 정렬이다.   
