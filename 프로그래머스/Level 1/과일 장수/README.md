첫 제출   
m-1부터 m씩 증가하면서 정렬된 점수상자를 지나간다.   
어차피 내림차순으로 정렬했기에 m순서때마다 걸리는 점수가 최소값이기에   
이와 같이 풀었다.   
```
import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var score = score
    score = score.sorted(by:>)
    var price = 0
    //print(score)
    for i in stride(from: m-1, through: score.count-1, by: m) {
        price += (score[i] * m)
    }
    //print(price)
    return price
}
```
