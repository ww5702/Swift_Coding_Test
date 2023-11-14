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
풀이방식은 비슷하나 결국 filter문을 얼마나 깔끔하게 사용할수있는지 문제였다.   
```
import Foundation

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    // Set로 된 취약점들이 담긴 weaks변수를 만들어준다
    // 취약점들이 같은것들의 반복을 피하기 위함
    var weaks: Set<[Int]> = [weak]
    
    // 이동할 수 있는 거리가 큰 친구부터 차례로 순회
    // 최대한 적은 친구를 이용해야하므로 멀리 갈수있는 친구부터
    for (friendCnt, d) in dist.reversed().enumerated() {
        // 이미 점검한 취약점들을 필터링한 새로운 취약점들을 담아준다
        // 필터링한 취약점이 하나도 남지 않았다면 모두 점검된것
        // 아니라면 새로운 취약점들을 담아준다
        var newWeaks: Set<[Int]> = []
        for w in weaks {
            for start in w {
                let end = (n+(start-d))%n
                let filterWeaks = start > end ? w.filter{$0<end || start+1...n ~= $0} : w.filter{start+1..<end ~= $0}
                if filterWeaks.isEmpty { return friendCnt+1}
                newWeaks.insert(filterWeaks)
            }
        }
        weaks = newWeaks
    }
    return -1
}

```
