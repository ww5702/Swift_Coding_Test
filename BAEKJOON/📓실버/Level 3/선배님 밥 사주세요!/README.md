튜플과 딕셔너리로 비교해가며 풀이했으나 실패   
아마도 같은날이 여러 선배가 존재할 가능성 때문에 실패한것같다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var record: [(String,Int,Int,Int)] = []
    var money: [String:Int] = [:]
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        record.append((input[0],Int(input[1])!,Int(input[2])!,Int(input[3])!))
    }
    record.sort(by: {$0.1 == $1.1 ? $0.2 < $1.2 : $0.1 < $1.1})
    print(record)
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        money.updateValue(Int(input[1])!, forKey: input[0])
    }
    print(money)
    var result = -1
    var cnt = 0
    var (lastweek, lastday) = (0,0)
    for i in 0..<n {
        let now = record[i]
        let (name, week, day, m) = (now.0, now.1, now.2, now.3)
        //print(now)
        
        if i == 0 {
            //print("첫날")
            if money[name]! >= m {
                cnt += 1
            }
            lastweek = week
            lastday = day
        } else {
            lastday += 1
            if lastday == 7 {
                lastweek += 1
                lastday = 0
            }
            
            if lastweek == week && lastday == day {
                if money[name]! >= m {
                    cnt += 1
                } else {
                    cnt = 0
                }
            } else {
                lastday = week
                lastday = day
                cnt = 0
            }
            
        }
        result = max(result, cnt)
    }
    print(result)
}
solution()

```
