최대로 바꿔주기 위해 5의 최대배수부터 역으로 순환한다.   
만약 5원으로 바꾼값이 2원으로도 바꿔줄수 있다면 해당값이 최소값이다.   

```
import Foundation
func solution(){
    var input = Int(readLine()!)!
    var count = 0

    for i in (0...input/5).reversed() {
        if (input-(5*i)) % 2 == 0 {
            count = i + (input-(5*i))/2
            break
        }
    }
    print(count == 0 ? -1 : count)
}
solution()

```
