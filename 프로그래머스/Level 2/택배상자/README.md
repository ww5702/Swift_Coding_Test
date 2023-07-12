첫 제출   
예비 컨테이너 레일을 스택처럼 구현하고,   
조건에 맞을때마다 popLast해주거나 appen해준다.   
만약 배열의 last가 목표 택배와 다르거나, 목표택배가 원래 컨테이너 박스의 숫자보다 작을경우 뽑아낼 수 없으므로   
해당 경우일 때 break   
```
import Foundation

func solution(_ order:[Int]) -> Int {
    var nowNum = 1
    var nowOrder = 0
    var i = 0
    var answer = 0
    var spare: [Int] = []
    while true {
        nowOrder = order[i]
        // 만약 컨테이너 번호가 필요한 번호와 같다면
        if nowOrder == nowNum { 
            answer += 1
            nowNum += 1
            if i < order.count-1 { i += 1 }
            
        } else if spare.last == nowOrder {
            // 스패어에 있는 제일 마지막 물품이 같다면 빼주기
            answer += 1
            if i < order.count-1 { i += 1 }
            // 마지막 택배 제거
            if spare.count != 0 { spare.popLast() }
        } else{
            spare.append(nowNum)
            nowNum += 1
        }
        // print("현재 컨테이너 번호 ",nowNum)
        // print("현재 스패어 ", spare)
        // print(answer, nowOrder)
        if spare.last != order[i] && order[i] < nowNum {
            break
        }
        
    }
    return answer
}
/*
        1 / 0
        2 / 1
        3 / 2 1
        4 / 3 2 1
        5 / 3 2 1
        5 / 2 1 
        
        1 / 0
        2 / 1
        3 / 2 1
        4 / 3 2 1
        5 / 4 3 2 1
        6 / 4 3 2 1
        6 / 3 2 1
        6 / 2 1
        6 / 1
        
        */
```
