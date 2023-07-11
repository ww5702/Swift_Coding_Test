첫 제출   
반복문을 하나만 써서 구현한다면 쉽게 풀 수 있는 문제이다.   
범위의 삭제인 a.removeSubrange만 알고있다면 풀 수 있다.   
```
import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var hamburger: [Int] = []
    var result = 0
    for i in ingredient {
        hamburger.append(i)
        // 4개가 채워져있을떄
        //print(hamburger)
        if hamburger.count >= 4 {
            // 마지막 4개의 순서가 1 2 3 1 이라면
            let end = hamburger.count
            if hamburger[end-4..<end] == [1,2,3,1] {
                result += 1
                hamburger.removeSubrange(end-4..<end)
            }
            
        }
    }
    //print(result)
    return result
}
```
