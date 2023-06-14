```
import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    // 일단 정렬
    var sortedtangerine: [Int] = []
    for i in tangerine {
        sortedtangerine.append(i)
    }
    sortedtangerine.sort(by:<)
    print(sortedtangerine)
    var box = Set<Int>()
    var count = 0
    var min = 100000
    for i in 0...sortedtangerine.count-k {
        count += 1
        box.insert(sortedtangerine[i])
        for j in i+1..<sortedtangerine.count {
            count += 1
            box.insert(sortedtangerine[j])
            if count == k {
                break
            }
        }
        print("\(box)")
        if box.count < min {
            min = box.count
        }
        count = 0
        box.removeAll()
    }
    return min
}
```
1 2 2 3 3 4 5 5 일때 그냥 밑에서부터 확인하면서 테스트하였으나
사실 2 2 3 3 5 5 가 제일 적다   
4를 빼고 계산을 했었어야했다.   
