```
import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var sorttarget = targets
    sorttarget.sort(by:{$0[1]<$1[1]})
    //print(sorttarget)
    var (s,e) = (0,0)
    var answer = 0
    // greedy 문제로 주어진 target을 y좌표로 sort한뒤
    // 하나씩 확인하면서 이전의 x값이 다음나올 x보다 작다면 
    // answer += 1 그리고 e를 해당target의 y좌표로 변환
    // 즉 다음 y좌표보다 큰 수가 나올떄까지는 지금 요격한 미사일로
    // 전부 요격이 가능하다는 뜻
    for i in sorttarget {
        if i[0] >= e {
            answer += 1
            e = i[1]
            //print(e)
        }
    }
    return answer
}
```
