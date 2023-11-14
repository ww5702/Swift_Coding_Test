시계방향과 반시계방향일때 포함되는 취약지점들의 값들중   
가장 큰 값을 뽑아내어 해당 값들을 지워준다.   

```
import Foundation

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    /*
    n의 둘레
    weak 포인트가 취약점
    dist가 사람 수이자, 각자가 한번에 이동할수있는 거리
    1시간동안 최저의 사람수로 최약지점을 전부 확인하는 방법
    불가능하다면 -1
    
    가장 거리가 긴 사람이 어떻게 잘 가냐가 중요할것같다
    
    */
    
    var dist = dist.sorted(by:>)
    var weak = weak
    var index = 0
    
    func clock(_ point: Int, _ dist: Int) -> Int{
        var cnt = 0
        // 원을 넘어갔을때
        if point+dist > n {
            cnt = weak.filter{$0 >= point && $0 <= n}.count + weak.filter{$0 <= dist-(n-point)}.count
        } else {
            cnt = weak.filter{$0 >= point && $0 <= point+dist}.count
        }
        return cnt
    }
    func reverseClock(_ point: Int, _ dist: Int) -> Int{
        var cnt = 0
        if point-dist <= 0 {
            cnt = weak.filter{$0 <= point}.count + weak.filter{$0 >= n-(dist-point)}.count
        } else {
            cnt = weak.filter{$0 >= (point-dist) && $0 <= point}.count
        }
        
        return cnt
    }
    
    while !weak.isEmpty {
        // 사람을 다 써도 취약점이 남아있다면 -1
        if index >= dist.count { return -1 }
        var now = dist[index]
        // 각자 포인트에서 출발했을때 제일 많은 취약점에 들릴수있는지
        for point in weak {
            print(point, now)
            let clockWay = clock(point, now)
            let reverseClockWay = reverseClock(point, now)
            print("결과",clockWay, reverseClockWay)
        }
        weak.removeFirst()
    }
    return 0
}
```
