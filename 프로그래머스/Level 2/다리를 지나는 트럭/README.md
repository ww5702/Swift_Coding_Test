다리가 버틸 수 있는 무게까지 올라온뒤   
올라오지 못한다면 다리길이만큼 시간이 흐르고 remove, append를 동시에 실행하였다.   

```
import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var arrive: [Int] = []
    var on_bridge: [Int] = []
    var result = 0
    print()
    for i in 0..<truck_weights.count {
        if arrive.count == truck_weights.count { break }
        print(i)
        // 만약 다리에 아직 지나갈 수 있다면
        if (on_bridge.reduce(0){$0 + $1} + truck_weights[i]) <= weight {
            on_bridge.append(truck_weights[i])
            print("올라간 트럭 ",on_bridge)
        } else {
            // 만약 더 올라가지 못한다면 일단 다리길이+1만큼 걸렸다고 기록
            arrive.append(on_bridge[0])
            on_bridge.removeFirst()
            result += bridge_length
            print("트럭 하차 ",on_bridge)
            print("경과 시간 ",result)
            if (on_bridge.reduce(0){$0 + $1} + truck_weights[i]) <= weight {
                on_bridge.append(truck_weights[i])
                result += 1
                print("하차한 다음 승차",on_bridge)
                print("경과 시간 ",result)
            }else {
                print("하차 후 승차 실패")
                
            }
            
        }
    }
    print(on_bridge)
    return 0
}
```
