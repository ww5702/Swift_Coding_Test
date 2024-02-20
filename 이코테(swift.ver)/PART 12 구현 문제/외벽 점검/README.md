먼저 해당 문제를 어떻게 풀지 고민해보았을때   
가장 멀리 갈 수 있는 사람으로 먼저 비교해봐야겠다는 생각이 들었다.   
따라서 해당 dist를 뒤집은다음 enumerated를 통해 index와 함께 반복문을 돌려볼 수 있도록 구성했다.   
index를 같이 뽑아낸 이유는 후설하겠다.   
가장 멀리 갈수있는 사람이 갈 수 있는 방향은 2가지이다.   
시계방향 / 반시계방향   
   
해당 방향으로 가면서 들리지 않는 취약점을 filter에 저장한다.   
그리고 해당 filter를 notyet 세트함수에 넣는다.   
해당 과정은 아직 방문하지 않은 취약점들을 모아놓은 배열이다.   
set함수를 사용한 이유는 밟지않은 취약점을 중복하여 저장하지 않기 위함이다.   
   
이제 다시 밟지않은 취약점들을 다음 사람이 정방향 혹은 역방향으로 방문하면서 밟았을때   
또 다시 밟지 못한 취약점들을 저장해준다.   
하지만 어떤 set배열중에서 전부 밟게 되어 밟지 않은 취약점이 하나도 없게 될 경우   
isEmpty를 통해 반복문을 꺠주고, 해당 순간의 index+1를 반환해준다.   
해당 사람이 최소한의 사람으로 모든 취약점을 방문한 순간이기 때문이다.   
   
모든 사람들이 정방향 역방향으로 가더라도 아직 취약점이 남았다면 -1를 반환해준다.   
```
import Foundation
let n = Int(readLine()!)!
let weak = readLine()!.split(separator: " ").map{Int($0)!}
let dist = readLine()!.split(separator: " ").map{Int($0)!}
func solution() -> Int{
    var weaks: Set<[Int]> = [weak]
    
    // 가장 적은수로 많은 약점을 돌기 위해 많이 움직일 수 있는 사람부터
    for (cnt, d) in dist.reversed().enumerated() {
        var notyet: Set<[Int]> = []
        for w in weaks {
            print(w)
            for start in w {
                // 시계 방향
                let end1 = (start + d)%n
                let filter1 = start < end1 ? w.filter({$0 < start || $0 > end1}) : w.filter({$0 > end1 && $0 < start})
                
                if filter1.isEmpty { return cnt + 1}
                notyet.insert(filter1)
                
                // 반시계 방향
                let end2 = (n + start - d)%n
                let filter2 = start < end2 ? w.filter({$0 > start && $0 < end2}) : w.filter({$0 > start || $0 < end2})
                
                if filter2.isEmpty { return cnt + 1}
                notyet.insert(filter2)
                
            }
        }
        weaks = notyet
    }
    
    return -1
}
print(solution())

```
