첫 제출   
귤을 sorting해서 앞에서 순차대로 k개만큼 집어넣고   
해당 배열을 set로 중복제거후 counting했을때 최소값을 return 시키려고 했다.   
하지만 해당 문제는 sorting을 개수가 많은 것들을 묶어서 정렬해줘야 한다.   
```
import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var store: [[Int]] = []
    var tangerine = tangerine
    tangerine.sort(by:<)
    var check = Set<Int>()
    var cnt = tangerine.count
    
    print(tangerine)
    for i in 0...tangerine.count-k {
        //print(i)
        //print(tangerine[i..<i+k])
        for j in tangerine[i..<i+k] {
            check.insert(j)
        }
        print(check)
        cnt = cnt < check.count ? cnt : check.count
        print(cnt)
        check = []
    }
    return 0
}
```
따라서 딕셔너리로 다시 배열로 바꾼뒤   
개수로 sorting을 해주었다.   
sorting해준값이 k를 넘어간다면 break 아니라면 result += 1을 반복해준다.
```
import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var tangerine = tangerine
    var restore: [Int:Int] = [:]
    for i in tangerine {
        // 딕셔너리 없으면 0
        let number = restore[i] ?? 0
        // print(number)
        restore[i] = number + 1
    }
    let sortedTangerine = restore.sorted{$0.1 > $1.1}
    //print(sortedTangerine)
    var number = 0
    var result = 0
    for i in sortedTangerine {
        let element = i.1
        
        if number + element >= k {
            result += 1
            break
        } else {
            number += element
            result += 1
        }
    }
    //print(result)
    return result
}
```
그 전에 풀이했던 방식   
dictionary에 무게당 1씩 추가해주고   
무게에 따라 정렬해준다.   
그리고 index, element에 따라 k를 넘으면 index+1을 return   
내림차순으로 정렬되어있기 때문에 해당값이 무조건 최소값이 된다.   
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
