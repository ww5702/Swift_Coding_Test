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
