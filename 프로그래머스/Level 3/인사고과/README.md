```
import Foundation

func solution(_ scores:[[Int]]) -> Int {
    /*
    인센티브를 받지 못하는 사람들을 걸러낸다.
    받을 수있는 사람들을 점수의 합으로 내림차순으로 정렬한다
    
    정렬이 가장 중요한 문제였다
    우선 근무 태도를 기준으로 내림차순으로 정렬하였다
    5번째 사람이 만약 그 전 사람들까지 중 평가 점수도 적다면
    5번째 사람은 인센티브를 받지 못하는 구조이다.
    
    하지만 문제는 같은 점수일때이다.
    5,5 가 있고 5,4가 있다
    위의 기준이라면 이미 내림차순으로 정렬되어있고 4가 5보다 작기 떄문에
    인센티브를 받지 못하는 사람으로 선별되어버린다.
    
    즉 근무태도 점수로 내림차순으로 정렬하지만 동률인 경우를 위해
    근무 태도가 같은 경우에는 동료 평가 점수를 오름차순으로 정렬해준다.
    그럼 5,4 5,5 와 같은 순서로 정렬되어 문제가 없이 해결이 된다.
    
    */
    // 근무태도가 같다면 동료 평가를 오름차순으로 아니라면 기본적으로는 근무태도를 기준으로 내림차순
    let sortedScores = scores.sorted(by: {$0[0] == $1[0] ? $0[1] < $1[1] : $0[0] > $1[0]})
    var wanho = scores[0]
    var wanhoScore = wanho.reduce(0,+)
    var result = 1
    // 비교할 대상의 전 사람의 동료평가 점수를 판단하기 위한 변수
    var ytemp = 0
    
    for score in sortedScores {
        //만약 완호가 받지 못하면 -1
        if wanho[0] < score[0] && wanho[1] < score[1] {
            return -1
        }
        // ytemp보다 크다면 인센티브를 받을 수 있는 사람
        // 여기서 완호의 점수와 해당 사람의 총 점수를 비교해서
        // 더 크다면 완호의 등수가 밀려난다
        // 그리고 받은 사람의 동료평가 점수를 max점수로 바꿔준다.
        if ytemp <= score[1] {
            let total = score.reduce(0,+)
            if wanhoScore < total {
                result += 1
            }
            ytemp = score[1]
        }
    }
    return result
}
```
