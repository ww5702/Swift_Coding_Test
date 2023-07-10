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
