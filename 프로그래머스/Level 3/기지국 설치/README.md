전파가 거리가 닿는 지점은 (w 기지 w) 총 2 x w + 1의 거리만큼 닿는다.   
5만큼 거리가 간다고 가정하고 아파트의 수가 6이면 필요한 기지국은 2개가 된다.   
즉 필요한 기지국만큼 따로 분류한다음 에너지가 닿는 거리만큼 나눈값+1을 결과에 포함하면된다.   

```
import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var street: [Int] = Array(repeating: 0, count:n)
    for s in stations {
        let start = s-w <= 0 ? 1 : s-w
        let end = s+w >= n ? n : s+w
        for i in start...end {
            street[i-1] = 1
        }
    }
    //print(street)
    var newStreet: [Int] = []
    var temp = 0
    for s in street {
        if s == 0 {
            temp += 1
        } else if s == 1 {
            if temp != 0 {
                newStreet.append(temp)
                temp = 0
            }
        }
    }
    if temp != 0 { newStreet.append(temp) }
    //print(newStreet)
    var answer = 0, energy = w*2+1
    for n in newStreet {
        if n % energy == 0 { answer += (n/energy) } 
        else { answer += (n/energy)+1 }
    }
    return answer
}
```
