```
import Foundation
/*
N만 사용해서 number를 만드는 문제

최솟값이 8보다 크면 break이기에
완전탐색을 이용해 풀이할수도 있다.
5 55 555 5555 등 8번을 사용하기 전까지 N을 붙인뒤
해당 값을 현재값과 + - * / 등 사칙연산을 시켜준다.
그리고 cnt가 8을 넘지 않는 선에서 해당 방식을 반복하고
만약 number와 같아지는 순간이 있고 해당값이 더 작은 값이라면 바꿔준다

*/
func solution(_ N:Int, _ number:Int) -> Int {
    if N == number { return 1 }
    var dp: [Int] = []
    var answer = -1
    func dfs(_ cnt: Int, _ now: Int) {
        if cnt > 8 { return }
        if now == number {
            // 해당값이 answer보다 작다면 변화
            if cnt < answer || answer == -1 {
                answer = cnt
            }
        }
        
        var NN = 0
        for i in 0..<8 {
            // 1+i는 초기 NN의 N의 개수를 의미
            // 정답이 나왔다면 break
            if answer != -1 && answer < cnt + 1 + i {
                break
            }            
            // 5 55 555 5555와 같이 증가하는 숫자 NN
            NN = NN*10 + N
            dfs(cnt + 1 + i, now+NN)
            dfs(cnt + 1 + i, now/NN)
            dfs(cnt + 1 + i, now-NN)
            dfs(cnt + 1 + i, now*NN)
        }
    }
    dfs(0,0)
    
    return answer
}
```
