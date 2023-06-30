
```
import Foundation
var user: [[Int]] = []
var emoticon: [Int] = []
var finalEmtiPlusCnt = 0
var finalSum = 0

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    user = users.sorted(by:{$0[0] > $1[0] })
    emoticon = emoticons
    
    // 어차피 user들중 최저의 할인율보다는 높아야 구매를 결정하기 때문에
    // filter를 돌려 가장 뒤의 할인률보다는 높은 퍼센트만 추가
    dfs(0, [], emoticon.count, [10,20,30,40].filter({$0 >= user.last![0] }))
    
    return [finalEmtiPlusCnt, finalSum]
    
}

// dfs재귀함수를 만들어서 할인율을 돌며 array에 추가
func dfs(_ index: Int, _ arr: [Int], _ max: Int, _ sales: [Int]) {
    // 이모티콘의 할인가격 조합인 arr가 emoticon의 개수와 일치할때
    if index == max {
        // 해당 할인가격 조합의 이모티콘 플러스 가입자수와
        // 판매액이 최대값인지 확인
        getResult(arr)
        return
    }
    
    // 재귀함수 호출 10,20,30,40 할인율을 돌며 arr에 더해준다
    // 이모티콘의 할인가격 조합이 arr에 더해진다
    for sale in sales {
        dfs(index+1, arr + [sale], max, sales)
    }
}

// 이모티콘 플러스 가입자수와 판매액을 도출하고 최대값인지 비교
func getResult(_ arr: [Int]) {
    var emtiPlusCnt = 0
    var sum = 0
    
    for u in user {
        var userSum = 0
        for (index, p) in arr.enumerated() {
            // 유저의 기준에 맞는 임티 선별
            if p >= u[0] {
                userSum += DiscountPrice(emoticon[index], p)
            }
        }
        // 만약 총 값이 유저의 기준을 넘겨 임티 플러스에 가입해야하는가
        if userSum >= u[1] {
            emtiPlusCnt += 1
        } else {
            // 아니라면 가격만 추가
            sum += userSum
        }
    }
    
    // 현재 할인 비율이 최대 임티 플러스 가입자를 만들었는가
    if emtiPlusCnt > finalEmtiPlusCnt {
        finalEmtiPlusCnt = emtiPlusCnt
        finalSum = sum
    } else if emtiPlusCnt == finalEmtiPlusCnt {
        // 가입자는 같은데 구매액이 더 높은가
        finalSum = sum > finalSum ? sum : finalSum
    }
}

// 이모티콘 할인가격 계산
func DiscountPrice(_ origin: Int, _ percent: Int) -> Int {
    return origin - ((origin/100)*percent)
}
```
