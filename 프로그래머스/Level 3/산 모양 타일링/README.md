누가봐도 규칙을 찾아 풀이하는 dp문제같다.   
삼각형을 기준으로 정 가운데 삼각형을 기준으로 규칙을 찾아낸다.   
1. 전부 삼각형인경우
2. 위로 올라가있을때 위쪽으로 마름모타일로 놓을때
3. 왼쪽 밑으로 마름모타일을 놓을때
4. 오른쪽 밑으로 마름모타일을 놓을때
   
이렇게 4가지이다.
하지만 앞선 삼각형에서 오른쪽밑으로 마름모 타일을 놓았을 경우
그 다음 타일은 왼쪽 밑으로 마름모 타일을 놓을 수 없게된다.
따라서 dp를 두개로 구성하여 비교하며 풀이한다.

점화식은 다음과 같다.   
정삼각형이 위로 붙을경우 전 삼각형일때 오른쪽아래로 덮었는지 아닌지로 비교할 수 있다.   
a = k번째 아래 방향 정삼각형까지 덮되 k번째 아래 방향 정삼각형을 덮는 방법이 4번일때   
b = k번째 아래 방향 정삼각형까지 덮되 k번째 아래 방향 정삼각형을 덮는 방법이 4번이 아닌 경우   
따라서 a일때는 k-1에서 4번 경우의수를 이행한것 + 4번이 아니었던 경우   
a[i] = b[i-1] + a[i-1]이다.   
b의 경우에는 k-1에서 4번의 경우를 사용했을때 k는 1,2번을 사용이 가능하고   
그렇지 않다면 1,2,3을 사용이 가능하다.   
b[i] = a[i-1] * 2 + b[i-1] * 3이 된다.   
이게 위에 정삼각형이 붙었을 경우이고,   
안붙었다라도 a[i]는 같고   
1번 경우를 빼준   
b[i] = a[i-1] + b[i-1] * 2가 된다.   
```
import Foundation

func solution(_ n:Int, _ tops:[Int]) -> Int {
    var downRight = Array(repeating: 0, count: n+1)
    var notDownRight = Array(repeating: 0, count: n+1)
    downRight[1] = 1
    notDownRight[1] = tops[0] == 1 ? 3 : 2
    
    if n == 1 {
        return downRight[1] + notDownRight[1]
    }
    
    let mod = 10007
    
    for i in 2..<n+1 {
        // 윗삼각형이 있나 없나
        if tops[i-1] == 1 {
            // 어차피 있던 없던 오른쪽 아래로 내릴것이기에 경우의수는 하나다
            downRight[i] = (downRight[i-1] + notDownRight[i-1]) % mod
            // 전부 삼각형, 윗쪽 마름모, 밑쪽 마름모 3가지
            // 나머지 전부 삼각형, 윗쪽 마름모 2가지
            notDownRight[i] = (downRight[i-1] * 2 + notDownRight[i-1] * 3) % mod
        } else {
            // 어차피 경우의수는 하나다
            downRight[i] = (downRight[i-1] + notDownRight[i-1]) % mod
            // 전부 삼각형, 왼쪽 마름모 2가지
            // 가운데 삼각형 한가지
            notDownRight[i] = (downRight[i-1] + notDownRight[i-1] * 2) % mod
        }
    }
    
    return (downRight[n] + notDownRight[n]) % mod
}
```
