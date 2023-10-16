각 지점에서 출발했을때의 요금을 fee에 저장한다.   
자기자신에서부터 자기자신의 요금은 0이다.   
k라는 중간 지점을 거쳐서 i에서 j로 갈때   
더 요금이 싸진다면 갱신해준다.   

마지막 mid를 이용한 반복문을 떠올리지 못해서 오랜시간이 걸렸다.   
출발지점 s를 기준으로 mid를 거쳐서 + mid에서 a까지 + mid에서 b까지의 값들이 더 싸다면 갱신해준다.   

```
import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var fee = [[Int]](repeating: [Int](repeating: 987654321, count: n + 1), count: n + 1)
    var result = 987654321
    for fare in fares {
        fee[fare[0]][fare[1]] = fare[2]
        fee[fare[1]][fare[0]] = fare[2]
    }
    // 자기자신은 요금이 0
    for node in 1...n {
        fee[node][node] = 0
    }
    for k in 1...n {
        for i in 1...n {
            // i부터 j까지 가는데 k를 거쳐서 가는게 더 빠르다면 변경
            for j in 1...n {
                fee[i][j] = min(fee[i][j], fee[i][k]+fee[j][k])
            }
        }
    }
    // 중간에 mid 즉 출발지에서부터 한 지점을 거쳐서 각 지점으로 가더라도
    // 최소값이 변경된다면 갱신
    for mid in 1...n {
        result = min(result, fee[s][mid]+fee[mid][a]+fee[mid][b])
    }
    return result
}
```
