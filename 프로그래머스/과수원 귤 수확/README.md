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
```
import Foundation
func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var numberDict = [Int:Int]()
    for t in tangerine {
        let number = numberDict[t] ?? 0
        print("number",number)
        numberDict[t] = number + 1
    }
    print("1",numberDict)
    let sortedNumbers = numberDict.values.sorted(by: >)
    var number = 0
    var answer = 0
    print("2",sortedNumbers)
    print("3",sortedNumbers.enumerated())
    for item in sortedNumbers.enumerated() {
        let index = item.offset
        let element = item.element
        
        if number + element >= k {
            answer = index + 1
            break
        }
        number += element
    }
    return answer
}
let k = 6
let tanerine: [Int] = [1,3,2,5,4,5,2,3]
print(solution(k, tanerine))

```
따라서 dictionary에 무게당 1씩 추가해주고   
무게에 따라 정렬해준다.   
그리고 index, element에 따라 k를 넘으면 index+1을 return   
내림차순으로 정렬되어있기 때문에 해당값이 무조건 최소값이 된다.   
