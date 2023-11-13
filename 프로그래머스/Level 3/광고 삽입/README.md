시 분 초를 초 단위로 전부 변경해준뒤   
시작 시간을 기준으로 오름차순으로 정렬해준다.   
그리고 정렬된 시간을 기준으로 + 광고시간을 더해준다   
광고시간을 더했을때 그 사이에 존재하는 시청 기록을 temp배열에 저장해준다.   
현재 시간에 대비하여 시청하고 있는 사람의 수를 세어서 기록했을때 max값을 계속해서 변경해준다.   
```
import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    /*
    
    max값이 나온다면 변경해주는 형식으로 진행하면 앞선 시간대를 반환가능
    */
    var user_log = [[Int]]()
    for log in logs {
        var value = log.components(separatedBy:"-")
        print(value)
        var startTime = value[0].components(separatedBy:":")
        var endTime = value[1].components(separatedBy:":")
        
        let start = Int(startTime[0])!*3600 + Int(startTime[1])!*60 + Int(startTime[2])!
        let end = Int(endTime[0])!*3600 + Int(endTime[1])!*60 + Int(endTime[2])!
        user_log.append([start,end])
        
    }
    user_log.sort(by:{$0[0] < $1[0]})
    var adv = adv_time.components(separatedBy:":")
    let advTime = Int(adv[0])!*3600 + Int(adv[1])!*60 + Int(adv[2])!
    print(advTime)
    //print(user_log.filter{$0[0] > advTime})
    var max = 0
    for user in user_log {
        print(user)
        var temp = user_log.filter{$0[0] <= user[0]+advTime && $0[0] >= user[0]}
        print(temp)
        for time in temp {
            
        }
    }
    
    return ""
}
```
누적합을 계속해서 고민했던 문제이다.   
분명히 누적합을 시간으로 계산하여 +1해준다면 시간초과가 나올것같았다.   
그에 대한 방법을 찾아본 결과 시작시간을 +1 시청을 끝낸 시간을 -1 해주는 것이다.   
그 다음 반복문을 한번만 돌려서 i-1을 i에 더해준다면 i시간에서의 누적 시청자의 수가 나온다.   

그 다음부터는 i + i+advTime 이렇게 해당 범위 사이의 누적합이 많은 sum을 구해준다.      
```
import Foundation
func convertTime(_ time: String) -> Int {
    let value = time.components(separatedBy:":")
    return Int(value[0])!*3600 + Int(value[1])!*60 + Int(value[2])!
}

func convertString(_ time: Int) -> String {
    let hour = time / 3600
    let min = (time % 3600) / 60
    let sec = (time % 3600 % 60)
    
    return String(format: "%02d:%02d:%02d", hour, min, sec)
}


func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    
    // 누적합을 위한 시청자수 확인 배열
    var cnt: [Double] = Array(repeating: 0, count: convertTime(play_time)+1)
    for log in logs {
        var value = log.components(separatedBy:"-")
        //print(value)
        var startTime = convertTime(value[0])
        var endTime = convertTime(value[1])
        // 누적합을 시간초로 계산한다면 당연히 시간초과 발생
        // 따라서 시작시간에 +1, 끝시간에 -1
        cnt[startTime] += 1
        cnt[endTime] -= 1
    }
    // 누적합 구하는 반복문
    for i in 1..<cnt.count {
        cnt[i] += cnt[i-1]
    }
    var advTime = convertTime(adv_time)
    
    var sum: Double = cnt[0..<advTime].reduce(0,+)
    var maxSum: Double = sum
    var result = convertString(0)
    
    for i in 0..<(cnt.count-advTime) {
        // 앞에 하나 빼주고 뒤에 하나 더해주고
        // 시간이 지남에 따라 앞 시간에 보는 사람은 빠지고
        // 뒤에 보는 사람은 추가되므로
        sum = sum - cnt[i] + cnt[i+advTime]
        // 딱 그 순간 보는 사람이 더 많았다면 해당 시간대로 변경
        if sum > maxSum {
            maxSum = sum
            result = convertString(i+1)
        }
    }
    return result
}
```
