첫 제출때는 택배 배달과 수거를 이중반복문으로 따로 계산해서 수행하였다.   
하지만 최악의 경우 O(n^2)일때 100,000 x 100,000은 시간초과를 야기시켰다.   
따라서 다른 사람의 코드 중 한번의 반복문으로 배달과 수거를 동시에 진행할 수 있는 방법을 발견하였다.   

```
import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var deliveries = deliveries
    var pickups = pickups
    // 가져간 택배의 개수 deliver, 가져올수있는 택배의 개수 pickup
    var (deliver, pickup, result) = (0,0,0)
    // 거꾸로 끝에서부터 0까지 내려오면서 반복
    for i in stride(from: n-1, through: 0, by:-1) {
        if deliveries[i] != 0 || pickups[i] != 0 {
            // cnt를 0으로 초기설정해야 왔다 갔다를 계산할때 용이하다
            var cnt = 0
            // 하나라도 적다면 물류센터에 가서 충전시켜온다는 의미
            while deliver < deliveries[i] || pickup < pickups[i] {
                // cnt가 갔다왔다를 표현해줄수있다.
                cnt += 1
                deliver += cap
                pickup += cap
            }
            // 배달하거나 수거한다
            deliver -= deliveries[i]
            pickup -= pickups[i]
            print(deliver, pickup)
            // 갔다온 거리를 (x2) 결과에 추가해준다.
            // 만약 deliver이나 pickup이 남는다면 충전을 안시키고도 배달하거나 수거할 수 있으므로
            // cnt가 0인 상태에서 delivers, pickups를 뺄수있다.
            result += (i+1) * cnt * 2
            print(result)
            print("종료")
        }
    }
    
    return Int64(result)
}
```
cnt를 0으로 중간중간 초기화시켜줌으로서 배달하거나 수거할수있는 양이 남아있다면 거리계산을 추가해주지않으면서   
확인해줄 수 있다.   
