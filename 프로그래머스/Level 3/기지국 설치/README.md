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
하지만 newstreet나 street나 필요없는 배열을 만들고 있었다.   
구조는 위와 같으나 코드를 줄여 풀이하면 다음과 같다.   
```
import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0, start = 0
    for s in stations {
        answer += Int(ceil(Double(s - w - start)/Double(2*w+1)))
        start = s + w + 1
    }
    // 아직 뒤가 남았다면
    if start <= n {
        answer += Int(ceil(Double(n - w - start)/Double(2*w+1)))
    }
    return answer
}
```
start부터 처음 기지국 사이의 거리를 구해 필용한 기지국의 개수를 구해준다.   
ceil함수를 씀으로써 소수점이 있을경우 반올림하여 +1하여 값을 더해주고,   
start를 에너지가 닿는 지점까지로 옮겨 다음 기지국까지의 거리를 다시 구한다.   
마지막 기지국까지 더했음에도 마지막 아파트까지 닿지 않았다면   
해당 아파트까지의 거리를 다시 앞선 방식과 똑같이 필요한 기지국을 구해 정답에 더해준다.   

