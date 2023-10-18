```
func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    /*
    셔틀버스는 0900시에 출발하여 t분 간격으로 n회 운행한다.
    즉 n = 1 t = 1이면 9시에 한대가 출발한다는 뜻이다
    
    운행되는 버스중 가장 마지막 버스를 타면 되는것이므로
    n*m 번째로 줄을 스면 된다.
    */
    var arr: [String:Int] = [:]
    for table in timetable {
        var value = arr[table] ?? 0
        arr[table] = value + 1
    }
    var sortedDict = arr.sorted{$0.0 < $1.0}
    print(sortedDict)
    // 최대한 늦게 타기 위한 순서를 구하는 limit
    var limit = m*n
    var result = ""
    for value in sortedDict {
        let time = value.key.components(separatedBy:":")
        var hour = Int(time[0])!
        var min = Int(time[1])!
        let cnt = value.value
        // 만약 타야되는 순서보다 해당 시간에 줄서는 사람이 많다면 -1분
        if limit <= cnt {
            min -= 1
            if min < 0 {
                min = 59
                hour -= 1
            }
            
            if hour < 10 {
                if min < 10 {
                    result = "0\(hour):0\(min)" 
                } else {
                    result = "0\(hour):\(min)" 
                }
            } else {
                if min < 10 {
                    result = "\(hour):0\(min)"
                } else {
                    result = "\(hour):\(min)"
                }
            }
            let check = result.components(separatedBy:":").joined()
            var time = (n-1)*t
            var hour = time/60 + 9
            var min = time%60
            var limitTime = min < 10 ? "0\(hour)0\(min)" : "0\(hour)\(min)"
            if Int(limitTime)! < Int(check)! {
                result = min < 10 ? "0\(hour):0\(min)" : "0\(hour):\(min)"
            }
            break
        } else {
        // 그게 아니라면 해당 시간대에는 줄을 안서도 되므로 패스
            limit -= cnt
        }
    }
    
    // 아직 result가 정해지지않았다면
    // 즉 아직 버스에 남은자리가 있다는 의미
    if result == "" {
        print("자리 여유")
        if n == 1 {
            result = "09:00"
        } else {
            var time = (n-1)*t
            var hour = time/60 + 9
            var min = time%60
            if t > m {
                if hour < 10 {
                    if min < 10 {
                        result = "0\(hour):0\(min)" 
                    } else {
                        result = "0\(hour):\(min)" 
                    }
                } else {
                    if min < 10 {
                        result = "\(hour):0\(min)"
                    } else {
                        result = "\(hour):\(min)"
                    }
                }
            } else {
                min -= 1
                if min < 0 {
                    min = 59
                    hour -= 1
                }
                if hour < 10 {
                    if min < 10 {
                        result = "0\(hour):0\(min)" 
                    } else {
                        result = "0\(hour):\(min)" 
                    }
                } else {
                    if min < 10 {
                        result = "\(hour):0\(min)"
                    } else {
                        result = "\(hour):\(min)"
                    }
                }
            }
            
        }
    }
    return result
}
```
