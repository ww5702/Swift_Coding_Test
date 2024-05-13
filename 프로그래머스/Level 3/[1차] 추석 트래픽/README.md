문법적으로 어렵다기 보다는 해당 정보들을 통일화하여 정렬시키는 문제이다.   
이미 시간도 오름차순으로 정렬되어있기도 하고   
주어진 시간을 시작 시간을 구해 시작시간, 종료시간을 저장해준다.   
n도 2000개 이므로 2000 x 1999 의 시간복잡도로 풀 수 있다.   

```
import Foundation
struct LogData {
    let year: String
    let month: String
    let day: String
    let hour: String
    let min: String
    let sec: String
    var excute: String
    
    var endTime: Double {
        let mhourF = Double(hour)! * 60 * 60 * 1000
        let mminF = Double(min)! * 60 * 1000
        let msecF = Double(sec)! * 1000
        return mhourF + mminF + msecF
    }
    
    var startTime: Double {
        let mhourF = Double(hour)! * 60 * 60 * 1000
        let mminF = Double(min)! * 60 * 1000
        let msecF = Double(sec)! * 1000
        var temp = excute
        temp.removeLast()
        let mExcuteF = Double(temp)! * 1000 - 1
        let mTotal = mhourF + mminF + msecF
        return Double(mTotal - mExcuteF)
    }
}
func solution(_ lines:[String]) -> Int {
    var info: [LogData] = []
    for line in lines {
        let split = line.components(separatedBy: .whitespaces)
        let dates = split[0].components(separatedBy: "-")
        
        let (year, month, day) = (dates[0], dates[1], dates[2])
        let time = split[1].components(separatedBy: ":")
        let (hour, min, sec) = (time[0], time[1], time[2])
        let data = LogData(year: year,
                           month: month,
                           day: day,
                           hour: hour,
                           min: min,
                           sec: sec,
                           excute: split[2])
        info.append(data)
        //print(data)
    }
    
    var result = 0
    for i in 0..<info.count {
        var cnt = 1
        let end = info[i].endTime
        for j in i+1..<info.count {
            if (info[j].startTime < end + 1000) {
                cnt += 1
            }
        }
        result = max(result,cnt)
    }
    return result
}

```
