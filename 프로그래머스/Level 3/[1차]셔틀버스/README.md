2번째 테스트케이스때문에 문제를 파악하는데 더 오래 걸린거같다.   
09시10분에 타면 되는게 아닌가 싶지만   
09시에 08시에 줄을 슨 크루 한명만 타게 되고   
09시10분에 두명이 타게 되는것이다.   
따라서 09시10분에 줄을 서는것이 아닌 09시 09분에 줄을 서야한다.   

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
테스트케이스 2번을 위해 다시 코드를 짜보았다.   

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
    var canArrive = true
    
    // 최대한 늦게 타기 위한 순서를 구하는 limit
    var limit = m*n, nowbus = "9:00", waitingline = 0
    // 막차를 계산하기 위한 변수
    let a = (n-1)*t
    let lasthour = (a/60)+9
    let lastmin = a%60
    var lastbus = ""
    if lasthour < 10 {
        lastbus = lastmin < 10 ? "0\(lasthour):0\(lastmin)" : "0\(lasthour):\(lastmin)"
    } else {
        lastbus = lastmin < 10 ? "\(lasthour):0\(lastmin)" : "\(lasthour):\(lastmin)"
    }
    
    var result = ""
    // n대의 버스가 지나간다고 가정할때
    for timeTable in sortedDict {
        let nowTime = timeTable.key.components(separatedBy:":")
        //print(nowTime)
        //print("현재 대기라인",waitingline)
        let nowCnt = timeTable.value
        var hour = Int(nowTime[0])!
        var min = Int(nowTime[1])!

        // 아직 첫차가 출발하기 전이라면
        if Int(nowbus.components(separatedBy:":").joined())! >= Int(nowTime.joined())! {
            //print("아직 첫차 출발 전")
            waitingline += nowCnt
            //print("줄 서기",waitingline)
            // 만약 첫차가 출발하기 전에 인원이 가득 찬다면
            // 해당 시간 1분전이 result
            if limit <= waitingline {
                print("최종인원 넘김")
                canArrive = false
                min -= 1
                if min < 0 {
                    min = 59
                    hour -= 1
                }
                if hour < 10 {
                    result = min < 10 ? "0\(hour):0\(min)" : "0\(hour):\(min)"
                } else {
                    result = min < 10 ? "\(hour):0\(min)" : "\(hour):\(min)"
                }
                break
            } else {
            // 아직 줄이 남았어도 막차라면
                if timeTable.key == lastbus {
                    canArrive = false
                    min -= 1
                    if min < 0 {
                        min = 59
                        hour -= 1
                    }
                    if hour < 10 {
                        result = min < 10 ? "0\(hour):0\(min)" : "0\(hour):\(min)"
                    } else {
                        result = min < 10 ? "\(hour):0\(min)" : "\(hour):\(min)"
                    }
                    break
                }
                
            }
        } else {
        // 현재 차 출발
            //print("현재 차 출발")
            waitingline = waitingline-m < 0 ? 0 : waitingline-m
            limit -= m
            //print("줄 빠짐",waitingline)
            var value = nowbus.components(separatedBy:":")
            var hour = Int(value[0])!
            var min = Int(value[1])!
            min += t
            if min > 60 {
                min = 0
                hour += 1
            }
            if hour < 10 {
                    nowbus = min < 10 ? "0\(hour):0\(min)" : "0\(hour):\(min)"
                } else {
                    nowbus = min < 10 ? "\(hour):0\(min)" : "\(hour):\(min)"
                }
            //print("다음차",nowbus)
        }
        
    }
    //print(result)
    if canArrive {
        result = lastbus
    }
    
    return result
}
```
