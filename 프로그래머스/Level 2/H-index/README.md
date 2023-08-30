단순하게 0..<i / i...arr.count-1 으로 잘라서 0..<i가 더 커지는 부분을 잘라서   
return해주는 문제가 아니다.   
만약 [10,100]이 있다면 결과값은 10이 아니라 2이다.   
10번 이상 인용된 횟수가 10 이상이어야 10이 반환된다.   
따라서 내림차순으로 정렬 한 뒤, index값이 인용횟수보다 크거나 같은 지점일때 반환을 해준다.   
하지만 만약 index값이 인용횟수보다 커진적이 없다면 10,100처럼 10개의 논문이 없다는 의미이므로   
배열의 count를 return 해준다.   

```
import Foundation

func solution(_ citations:[Int]) -> Int {
    var arr = citations.sorted(by: >)
    for i in 0..<arr.count {
        if i >= arr[i] {
            return i
        }
    }
    return arr.count
}
```
