시 분 초를 초 단위로 전부 변경해준뒤   
시작 시간을 기준으로 오름차순으로 정렬해준다.   
그리고 정렬된 시간을 기준으로 + 광고시간을 더해준다   
광고시간을 더했을때 그 사이에 존재하는 시청 기록을 temp배열에 저장해준다.   
현재 시간에 대비하여 시청하고 있는 사람의 수를 세어서 기록했을때 max값을 계속해서 변경해준다,   
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
