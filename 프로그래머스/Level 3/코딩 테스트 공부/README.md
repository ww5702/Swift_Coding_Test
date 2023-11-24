```
import Foundation
/*
알고력 코딩력 
일정 이상의 알고력과 코딩력이 필요
알고력 높이기위해 1의 시간 -> 1 +
코딩력 1의 시간 -> 1 +
현재 풀 수 있는 문제 중 하나를 풀어 알고력과 코딩력을 높이자
같은 문제를 여러번 풀기도 가능

problems (필요한 알고력, 필요한 코딩력, 증가 알고력, 증가 코딩력, 드는 시간)
*/
func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var maxAlp = problems.map{$0[0]}.max()!
    var maxCop = problems.map{$0[1]}.max()!
    var alp = alp, cop = cop
    var dp = Array(repeating: Array(repeating: 10000, count: maxCop+1), count: maxAlp+1)
    dp[alp][cop] = 0
    var reuslt = 0
    
    // 알고력a 와 코딩력c를 달성하는데 드는 최소 시간을 구하는 반복문
    for a in alp..<maxAlp+1 {
        for c in cop..<maxCop+1 {
            var isChange = false
            if a+1 <= maxAlp {
                // 해당 알고력과 코딩력은 -1의 시간때 1을 들여서 공부하는
                // 것과 같다.
                dp[a+1][c] = min(dp[a+1][c], dp[a][c]+1)
                isChange = true
            }
            if c+1 <= maxCop {
                dp[a][c+1] = min(dp[a][c+1], dp[a][c]+1)
                isChange = true
            }
            
            // +1 공부했다는 변화했다는 소리는 현재값에서 증가값들이 변화할
            // 가능성이 생겼다는 소리
            if isChange {
                for problem in problems {
                    let algorithm_req = problem[0]
                    let coding_req = problem[1]
                    let algorithm_raise = problem[2]
                    let coding_raise = problem[3]
                    let cost = problem[4]
                    
                    // 필요한 알고리즘이 넘어갔고 해당값이 최소값이면 비교
                    // 현재 a,c에서 증가치만큼 증가했을때
                    // +cost한 값이 더 작다면 바꿔준다.
                    if a >= algorithm_req && c >= coding_req {
                        // maxAlp을 넘어가서는 안된다.
                        let nowAlp = min(maxAlp,a+algorithm_raise)
                        let nowCop = min(maxCop,c+coding_raise)
                        dp[nowAlp][nowCop] = min(dp[nowAlp][nowCop], dp[a][c]+cost)
                        
                    }
                }
            }
        }
    }
    return dp[maxAlp][maxCop]
}
```
초기 alp, cop 값보다 처음 주어진 maxcop maxalp값이 더 작을수도 있다.   
```
import Foundation
/*
알고력 코딩력 
일정 이상의 알고력과 코딩력이 필요
알고력 높이기위해 1의 시간 -> 1 +
코딩력 1의 시간 -> 1 +
현재 풀 수 있는 문제 중 하나를 풀어 알고력과 코딩력을 높이자
같은 문제를 여러번 풀기도 가능

problems (필요한 알고력, 필요한 코딩력, 증가 알고력, 증가 코딩력, 드는 시간)
*/
func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var maxAlp = problems.map{$0[0]}.max()!
    var maxCop = problems.map{$0[1]}.max()!
    var alp = min(maxAlp,alp), cop = min(maxCop,cop)
    var dp = Array(repeating: Array(repeating: 10000, count: maxCop+1), count: maxAlp+1)
    dp[alp][cop] = 0
    
    
    // 알고력a 와 코딩력c를 달성하는데 드는 최소 시간을 구하는 반복문
    for a in alp..<maxAlp+1 {
        for c in cop..<maxCop+1 {
            var isChange = false
            if a+1 <= maxAlp {
                // 해당 알고력과 코딩력은 -1의 시간때 1을 들여서 공부하는
                // 것과 같다.
                dp[a+1][c] = min(dp[a+1][c], dp[a][c]+1)
                isChange = true
            }
            if c+1 <= maxCop {
                dp[a][c+1] = min(dp[a][c+1], dp[a][c]+1)
                isChange = true
            }
            
            // +1 공부했다는 변화했다는 소리는 현재값에서 증가값들이 변화할
            // 가능성이 생겼다는 소리
            if isChange {
                for problem in problems {
                    let algorithm_req = problem[0]
                    let coding_req = problem[1]
                    let algorithm_raise = problem[2]
                    let coding_raise = problem[3]
                    let cost = problem[4]
                    
                    // 필요한 알고리즘이 넘어갔고 해당값이 최소값이면 비교
                    // 현재 a,c에서 증가치만큼 증가했을때
                    // +cost한 값이 더 작다면 바꿔준다.
                    if a >= algorithm_req && c >= coding_req {
                        // maxAlp을 넘어가서는 안된다.
                        let nowAlp = min(maxAlp,a+algorithm_raise)
                        let nowCop = min(maxCop,c+coding_raise)
                        dp[nowAlp][nowCop] = min(dp[nowAlp][nowCop], dp[a][c]+cost)
                        
                    }
                }
            }
        }
    }
    return dp[maxAlp][maxCop]
}
```
