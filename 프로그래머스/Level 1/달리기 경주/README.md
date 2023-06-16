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
하지만 위 문제는 players와 callings가 크기가 크고, swapAt를 사용하면 시간초과가 나는 경우가 발생한다.   
따라서 dict배열을 사용하여 관리하여 시간에 단축한다.   
딕셔너리 타입으로 접근할때는 시간복잡도가 O(1)이기 때문   
```
import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var result = players
    var dict: [String:Int] = [:]
    for (index, player) in result.enumerated() {
        dict[player] = index
    }
    for i in callings {
        let index = result[dict[i]! - 1]
        dict[index] = dict[index]! + 1
        dict[i] = dict[i]! - 1
        
        result[dict[i]!] = i
        result[dict[index]!] = index
        
    }
    return result
}
```
