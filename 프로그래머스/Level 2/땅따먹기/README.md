동적계획법을 이용해 풀이할 수 있었다.   
1번째 행부터   
1번째 열은 위 행인 0번째 행의 2,3,4 열중에 하나를 받고 내려온다.   
2번째 열은 위의 0번째 행에서 1,3,4 열중에 하나를 받고 내려온다.   
위의 과정이 제일 밑의 행까지 반복된다고 보면 된다.   
따라서 열중에 하나를 고르는 과정을 max로 제일 높은 숫자만 골라서 내려왔을때   
제일 밑의 행이 되었을때 가장 큰 수를 반환해주면 된다.   
```
import Foundation

func solution(_ land:[[Int]]) -> Int{
    var land = land
    for i in 0..<land.count-1 {
        land[i+1][0] += max(land[i][1],land[i][2],land[i][3])
        land[i+1][1] += max(land[i][2],land[i][3],land[i][0])
        land[i+1][2] += max(land[i][3],land[i][0],land[i][1])
        land[i+1][3] += max(land[i][0],land[i][1],land[i][2])
    }
    return land[land.count-1].max()!
}
```
만약 행의 크기가 4가 아닌 더 크거나 정해져있지 않다면 반복문을 여러개 사용하여 풀이할 수 있다.   
가변하는 dp를 복사하여 만들고, 같은 열이라면 continue, 다른 열이라면 현재 행열의 값 + 전 행열의 값을 넣어주면서   
전 행열의 값이 바뀌고 max 함수를 통해 값이 더 커진다면 덮어 씌워주는 방식으로 진행한다.   
```
import Foundation

func solution(_ land:[[Int]]) -> Int{
    var dp = land
    for i in 1..<land.count {
        for j in 0..<land[0].count {
            for k in 0..<land[0].count {
                // 만약 같은 열의 숫자를 고르려고 한다면 continue
                if j == k { continue }
                dp[i][j] = max(dp[i][j], dp[i-1][k] + land[i][j])
            }
        }
    }
    return dp.last!.max()!
}
```
