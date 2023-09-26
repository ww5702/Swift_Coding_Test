첫 제출   

```
import Foundation

func solution(_ scores:[[Int]]) -> Int {
    var scores = scores
    // 근무태도와 동료평가점수가 둘다 낮다면 remove
    var removeIndex: [Int] = []
    for i in 0..<scores.count {
        var now = scores[i]
        for j in 0..<scores.count {
            var versus = scores[j]
            if now[0] < versus[0] && now[1] < versus[1] {
                //print("더이상 비교할 필요 없다",now)
                removeIndex.append(i)
                break
            }
        }
    }
    // 만약 완호가 인센티브를 받지 못하는 경우 -1
    if removeIndex.contains(0) { return -1 }
    for r in removeIndex {
        scores.remove(at: r)
    }
    //print(scores)
    
    // 이제 dictionary로 다시 만들기
    var list: [Int:Int] = [:]
    for i in 0..<scores.count {
        list[i+1] = scores[i].reduce(0,+)
    }
    //print(list)
    // 해당 list를 점수의 내림차순으로 정렬
    let sortedlist = list.sorted { $0.1 > $1.0 }
    var result = 0
    var same = 1
    var rank = 0
    for s in sortedlist {
        print(s.value)
        if rank != s.value {
            //print("현재 점수",rank)
            rank = s.value
            result += same
        } else {
            // 동점자들은 같은 등수
            if s.key == 1 {
                break
            } else {
            // 동점자들이 있다
                //print("동점")
                same += 1
            }
        }
        
    }
    return result
}
```
