첫 제출   
반복횟수가 최대 2500회이므로 반복문 하나를 사용하여 total 금액을 구해준다면 끝   
```
import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var total = 0
    for c in 1...count {
        total += price*c
    }
    return money >= total ? Int64(0) : Int64(total-money)
}
```

수학적 사고로도 해당 문제를 풀 수 있다.   
count+1 * count / 2 * price 로 위의 수식을 단축시킬 수 있다.   
```
import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    return Int64(max((count + 1) * count / 2 * price - money , 0))
}
```
