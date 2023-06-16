.firstIndex로 배열에 할당된 인덱스를 가져오고   
.swapAt을 이용해 두 배열의 순서를 바꿔준다.   
```
import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var result = players
    for i in callings {
        let index = result.firstIndex(of: i)
        result.swapAt(index!-1,index!)
    }
    return result
}
```
