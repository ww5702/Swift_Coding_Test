너무 어렵게 생각해서 어렵던 문제이다.   
쉽게 생각해서 지금 당장 카드를 갖지 않더라도 임시로 저장후   
필요할때마다 코인을 써서 가져온다면   
해당 경우가 최대의 경우이다.   

```
import Foundation

func solution(_ coin:Int, _ cards:[Int]) -> Int {
    var coin = coin
    var n = cards.count
    var idx = n/3
    var hand = Set<Int>(cards[..<idx])
    var storeCards = Set<Int>()
    var isOk = false
    var result = 1
    while idx < n {
        isOk = false
        
        storeCards.insert(cards[idx])
        storeCards.insert(cards[idx+1])
        idx += 2
        
        // print("저장",hand)
        // print("저장",storeCards)
        
        // 먼저 손에 있는거로 가능?
        for num in hand {
            let restNum = (n+1)-num
            if hand.contains(restNum) {
                hand.remove(num)
                hand.remove(restNum)
                isOk = true
                break
            }
        }
        
        // print(hand)
        // print(storeCards)
        
        if isOk {
            result += 1
            continue
        }
        
        // print("손에 있던걸로 실패")
        
        // 코인 하나 쓰고 손에 있던거 하나, 저장 하나
        if coin >= 1 {
            for num in hand {
                print(num)
                let restNum = (n+1)-num
                if storeCards.contains(restNum) {
                    print(num, restNum)
                    hand.remove(num)
                    storeCards.remove(restNum)
                    coin -= 1
                    isOk = true
                    break
                }
            }
        }
        
        // print(hand)
        // print(storeCards)
        
        if isOk {
            result += 1
            continue
        }
        
        // print("코인 하나 쓰고 실패")
        
        if coin >= 2 {
            for temp in storeCards {
                let restNum = (n+1)-temp
                if storeCards.contains(restNum) {
                    storeCards.remove(temp)
                    storeCards.remove(restNum)
                    coin -= 2
                    isOk = true
                    break
                }
            }
        }
        // print(hand)
        // print(storeCards)
        
        if isOk {
            result += 1
            continue
        } else {
            break
        }
    }
    return result
}
```
