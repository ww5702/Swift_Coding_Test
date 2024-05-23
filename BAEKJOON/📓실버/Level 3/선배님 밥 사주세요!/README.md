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
따라서 어차피 10주에 7일밖에 없어서 2차원배열로 만들어 풀이해보았다.   
또한 같은날에 여러 선배가 있을수 있으므로 해당 배열에 여러 값을 넣어둘 수 있게 하였다.   
하지만 실패   
아마 1퍼에서 실패하는것을 보아하니 범위적으로 문제가 있거나 한것같다.   
```
import Foundation
func isNextDay(_ lastweek: Int, _ lastday: Int, _ week: Int, _ day: Int) -> Bool {
    var (lastday, lastweek) = (lastday, lastweek)
    lastday += 1
    if lastday == 7 {
        lastweek += 1
        lastday = 0
    }
    
    if lastweek == week && lastday == day {
        return true
    } else {
        return false
    }
}
func solution(){
    let n = Int(readLine()!)!
    var record = Array(repeating: Array(repeating: [(String,Int)](), count: 7), count: 11)
    var money: [String:Int] = [:]
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        record[Int(input[1])!][Int(input[2])!].append((input[0], Int(input[3])!))
    }
    //print(record)
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        money.updateValue(Int(input[1])!, forKey: input[0])
    }
    //print(money)
    
    var (lastweek, lastday) = (0,-1)
    var cnt = 0
    var result = 0
    
    for i in 1...10 {
        for j in 0...6 {
            //print(record[i][j])
            if record[i][j].count == 0 {
                cnt = 0
                lastweek = i
                lastday = j
            } else {
                if isNextDay(lastweek, lastday, i, j) {
                    var isCan = false
                    for node in record[i][j] {
                        //print(node.0)
                        if money[node.0]! >= node.1 {
                            //print("지금가능",node)
                            isCan = true
                            break
                        }
                    }
                    
                    if isCan {
                        cnt += 1
                    } else {
                        cnt = 0
                    }
                    
                    result = max(result, cnt)
                    lastweek = i
                    lastday = j
                } else {
                    cnt = 0
                    lastweek = i
                    lastday = j
                }
            }
        }
    }
    print(result)
    
}
solution()

```
