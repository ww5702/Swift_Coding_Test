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
좀더 직관성있도록 구조를 바꾸었다.   
다리의 체중을 넘기지 않으면서 트럭들이 전부 다리를 넘어가면 반환해주는 문제이다.   
다리위에 아무것도 없을때까지 반복해주는 코드인데   
[7,4,5,6]이라면   
[0,0]   
[0,7]   
[7,0]   
[0,4]   
[4,5]   
[5,0]   
[0,6]   
[6]   
[]   
이런 형식으로 진행된다.   

```
import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = Array(repeating: 0, count: bridge_length)
    var trucks = truck_weights
    var result = 0
    var bridgeWeight = 0
    
    // 다리의 빈 공간만큼 배열을 만들고 반복문이 실행될때마다 트럭의 배열을 삭제
    while !bridge.isEmpty {
        print(bridge)
        result += 1
        // 제일 앞의 배열을 삭제 (나감)
        bridgeWeight -= bridge.removeFirst()
        
        // 남아있는 truck들이 있을때만 반복
        // 다리에 진입할 무게와 비교해 안넘으면 추가
        if let t = trucks.first {
            // 무게를 넘지 않았으므로 한대 다리로 진입
            if t + bridgeWeight <= weight {
                bridgeWeight += trucks.removeFirst()
                bridge.append(t)
            } else {
                bridge.append(0)
            }
        }
    }
    print(result)
    return 0
}
```
