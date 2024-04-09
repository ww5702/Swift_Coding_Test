어떨때 다를지 생각해봐야한다.   
만약 자리수가 다르다면 1, 10 이거나 88, 8888   
무조건 8이 안들어가게 만들 수 있다.   
하지만 같다면   
8708 8880 이라면   
천의자리부터 시작해서 서로의 숫자가 같은지 다른지 확인해줘야한다.   
다르다면 또한 다른 숫자를 만들수있다.   
하지만 8로 같은 숫자가 나온다면 8 한글자는 무조건 들어가게 된다.   
따라서 8708 8880은 1이고,   
8808 8880은 2이다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator:" ").map{String($0)}
    let (L,R) = (input[0].map{String($0)},input[1].map{String($0)})
    var result = 0
    if (L.count != R.count) {
        print(0)
    } else {
        for i in 0..<L.count {
            if L[i] == R[i] {
                if L[i] == "8" { result += 1 }
            } else {
                break
            }
        }
        print(result)
    }
}
solution()

```
