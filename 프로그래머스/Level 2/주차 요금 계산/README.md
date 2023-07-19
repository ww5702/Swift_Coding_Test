입차 출차에 따라 경우를 대입하여 문제를 해결하였다.   
딕셔너리 배열로 문제를 풀이했는데 딕셔너리는 항상 순서가 랜덤이라는 점을 잊었다.   
```
import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var record: [String:Int] = [:]
    var inoutCheck: [String:String] = [:]
    var money: [String:Int] = [:]
    for i in records {
        var value = i.split(separator:" ")
        let condition: ((String, Int)) -> Bool = {
            $0.0.contains(value[1])
        }
        // 만약 한번도 들어온적이 없다면 insert
        if !record.contains(where: condition) {
            var time = value[0].split(separator:":").map{String($0)}
            var hour = Int(time[0])!*60
            var min = Int(time[1])!
            record["\(value[1])"] = hour + min
            inoutCheck["\(value[1])"] = String(value[2])
        } else {
            // 출차 기능
            let inTime = record["\(value[1])"]!
            var outTime = value[0].split(separator:":").map{String($0)}
            var outHour = Int(outTime[0])!*60
            var outMin = Int(outTime[1])!
            
            // print(inTime, outTime)
            // 돈 추가
            var price = money["\(value[1])"] ?? 0
            money["\(value[1])"] = price + ((outHour+outMin)-inTime)
            // 다시 out
            inoutCheck["\(value[1])"] = String(value[2])
            // 기록 삭제
            record.removeValue(forKey: "\(value[1])")
        }
        // print("기록", record)
        // print("입출", inoutCheck)
        // print("돈",money)
        // print("===")

    }
    // 하루가 끝날때까지 입차되어있다면
    for i in inoutCheck {
        let key = i.key
        let value = i.value
        let limitTime = (23*60)+59
        if value == "IN" {
            var price = money["\(key)"] ?? 0
            let inTime = record["\(key)"]!
            money["\(key)"] = price + (limitTime-inTime)
            //print(price, inTime)
            inoutCheck["\(key)"] = "OUT"
            record.removeValue(forKey: "\(key)")
        }
        
    }
    // print(record)
    // print(inoutCheck)
    //print(money)
    
    // 마지막 정산
    var result: [Int] = []
    for m in money {
        // 기본시간보다 적다면
        let key = m.key
        let value = m.value
        //print(value)
        if value <= fees[0] {
            result.append(fees[1])
        } else {
            var lastMoney = fees[1]
            if (value - fees[0]) % 10 != 0 {
            }
            var fee = value-fees[0]
            if fee % 10 != 0 {
                fee = (fee/fees[2])+1
            } else {
                fee /= fees[2]
            }
            fee *= fees[3]
            lastMoney += fee
            result.append(lastMoney)
        }
    }
    return result
}
```
