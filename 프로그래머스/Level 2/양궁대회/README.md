k점을 어피치와 동일하게 맞추면 어피치가 점수를 가져간다. 따라서 라이언이 이기려면 무조건 커야한다.    
둘다 0점이라면 아무도 점수를 가져가지 못한다.   
가장 큰 점수 차로 이기려고 한다.   
지거나 비기면 -1을 리턴한다.   
가장 큰 점수차로 우승하는 방법이 여러개라면 가장 낮은 점수를 더 많이 맞힌 경우를 리턴   
맨 마지막 조건을 봄으로서 낮은 점수에서부터 백트래킹을 시작했다.   
```
import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var result = Array(repeating: 0, count: 11)
    var arr = Array(repeating: 0, count: 11)
    var lionSum = 0
    var apeachSum = 0
    var temp = 0
    var lionWin = false
    func dfs(_ depth: Int, _ start: Int) {
        if depth == n {
            // 화살 개수가 동일할때 합 계산
            lionSum = 0
            apeachSum = 0
            for i in 0...10 {
                // 둘다 0이면 pass
                if arr[i] == 0 && info[i] == 0 {
                    continue
                }
                // 점수 얻는 조건
                if info[i] < arr[i] {
                    lionSum += 10-i
                } else {
                    apeachSum += 10-i
                }
            }
            //print(lionSum, apeachSum)
            if lionSum > apeachSum {
                // 한번이라도 이긴적이 있다면 true
                lionWin = true
                if lionSum - apeachSum > temp {
                    result = arr
                    temp = lionSum - apeachSum
                }
            }
            return
        }
        
        for i in start...10 {
            arr[10-i] += 1
            dfs(depth + 1, i)
            arr[10 - i] -= 1
        }
    }
    dfs(0,0)
    if !lionWin {
        result = [-1]
    }

    return result
}
```
