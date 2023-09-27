아직 완성되지않았다.   

```
import Foundation
/*
t1~t2의 실내온도를 유지
처음 현재(0분)때는 실내온도와 실외온도는 같다
실내온도를 조절한다(희망온도)

희망온도는 에어컨의 전원이 켜져있는 동안 설정할 수 있다
실내온도와 희망온도가 다르다면 1분뒤에 같아지는 방향으로 +1 -1 상승/하강한다
실내온도가 희망온도와 같다면 켜져있는 동안은 실내온도가 변하지 않는다

하지만 에어컨의 전원을 끈다면 실내온도는 실외온도와 같아지는 방향으로
1분에 1도씩 상승 / 하강 한다
실내온도와 실외온도가 같아진다면 변하지 않는다

에어컨의 소비전력은 현재 실내온도에 따라 달라진다
희망온도와 실내온도가 다르다면 매 분 a전력만큼 소비
희망온도와 실내온도가 같다면 매 분 b전력만큼 소비
물론 에어컨이 꺼져있다면 전력을 소비하지 않는다

t1~t2의 실내 온도를 유지하면서 에어컨의 소비전력을 최소화하자

*/
func solution(_ temperature:Int, _ t1:Int, _ t2:Int, _ a:Int, _ b:Int, _ onboard:[Int]) -> Int {
    var (temperature, t1, t2) = (temperature+11, t1+11, t2+11)
    /*
    4가지 방법으로 온도가 변화한다
    1. 에어컨을 끄고 실내온도 방향으로 1도 변경하는 경우
    2. 에어컨을 끄고 온도를 유지하는 경우(실내온도 = 현재온도) -> 특수상황
    3. 에어컨을 키고 온도를 유지하는 경우
    4. 에어컨을 키고 온도를 실내온도와 반대방향으로 1도 변경하는 경우
    
    실내온도가 변할 수 있는 범위를 구해야 한다
    현재 온도가 변할 수 있는 범위 
    min(t1, 실외온도) ~ max(t2, 실외온도)
    즉 만약 실외온도가 t1~t2사이에 있다면 에너지 손실은 0이다!
    에어컨을 킬 필요가 없기에
    
    동적계획법의 bottom-up방식을 이용한다
    낮은 문제부터 빌드업해가는 방식
    dp[i][j] = i분에 j도를 만들어 낼 수 있는 에어컨의 최소 소비 전력
    을 의미한다
    
    */
    var min = t1 < temperature ? t1 : temperature
    var max = t2 > temperature ? t2 : temperature
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 52), count: onboard.count)
    for i in 1..<onboard.count {
        var start = 0
        var end = 0
        if onboard[i] == 1 {
            start = t1
            end = t2
        } else {
            start = min
            end = max
        }
        // min = 18 max = 28
        for j in start..<end+1 {
            /*
            dp[i-1][j-1]+a = 1분전 1도 낮은 곳에서 에어컨을켜서 1도업
            dp[i-1][j] = 1분전 같은 온도에서 에어컨꺼서 1도 다운
            dp[i-1][j+1]+a = 1분전 1도 높은 곳에서 에어컨을켜서 1도다운
            dp[i-1][j+1] = 1분전 1도 높은곳에서 에어컨을꺼서 1도 다운
            dp[i-1][j]+b = 1분전 같은 온도에서 에어컨을켜서 온도유지
            */
            dp[i][j] = [dp[i-1][j-1]+a,dp[i-1][j],dp[i-1][j+1]+a,dp[i-1][j+1],dp[i-1][j]+b].min()!
            // 10도 올리는것 고려
            print(dp[i][j])
        }
    }
    print(dp)
    return 0
}
```
