```
import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    // 일단 정렬
    var sortedtangerine: [Int] = []
    for i in tangerine {
        sortedtangerine.append(i)
    }
    sortedtangerine.sort(by:<)
    
    var box: [Int] = []
    var min = 100000
    var count = 0
    for i in 0..<sortedtangerine.count-k {
        while box.count - k != 0 {
            box.append(sortedtangerine[i])
            // 중복 무게 카운트
            count = 1
            for j in i+1..<sortedtangerine.count {
                box.append(sortedtangerine[j])
                if box[i] != box[j] {
                    count += 1
                }
            }
        }
        // 만약 종류가 더 적다면
        if count < min {
            min = count
        }
        // 초기화
        box.removeAll()
    }
    return min
}
```
