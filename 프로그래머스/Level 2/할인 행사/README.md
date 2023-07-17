첫 제출   
원하는 할인목록과 상점리스트를 [String:Int] 딕셔너리 배열로 만들어준다.   
그 후 비교했을 때 상점 리스트가 원하는 할인목록보다 큰건 상관없지만 작다면 문제가 된다.   
작은 경우에는 false를 리턴해주고, 나머지 경우에는 조건을 충족시키므로 answer += 1   
그리고 다음 배열로 넘어갈때마다 맨 앞 원소는 빼주고 그 다음 원소는 더해준다음 다시 비교해준다.   
```
import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var list: [String:Int] = [:]
    for index in 0..<want.count {
        let wantItem = want[index]
        let wantNumber = number[index]
        list[wantItem] = wantNumber
    }
    var discountList: [String:Int] = [:]
    for index in 0..<10 {
        let item = discount[index]
        let number = discountList[item] ?? 0
        discountList[item] = number + 1
    }
    //print(list)
    //print(discountList)
    func isAnswer() -> Bool {
        for item in list {
            let key = item.key
            let value = item.value
            // 할인목록의 메뉴의 개수
            let discountValue = discountList[key] ?? 0
            // 원하는 할인의 개수가 더 크다면 false
            if discountValue < value {
                return false
            }
        }
        return true
    }
    
    var answer = 0
    if isAnswer() {
        answer += 1
    }
    // 첫 10개를 기준으로 계산했기에 그 뒤부터 다시 연산
    for index in 10..<discount.count {
        let plusItem = discount[index]
        let plusNumber = discountList[plusItem] ?? 0
        discountList[plusItem] = plusNumber + 1
        // 하나 추가할때마다 맨 앞은 빼주기
        let minusItem = discount[index-10]
        let minusNumber = discountList[minusItem] ?? 0
        discountList[minusItem] = minusNumber - 1
        
        // 다시 체크해보기
        if isAnswer() { answer += 1}
    }
    //print(answer)
    return answer
}
```
