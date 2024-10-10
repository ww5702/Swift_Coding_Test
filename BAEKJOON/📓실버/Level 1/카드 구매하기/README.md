카드1당 가치가 제일 높은 순으로 계산했지만 30프로에서 실패   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var dict: [Int:Double] = [:]
    for i in 0..<n {
        dict[i+1] = Double(board[i]) / Double(i+1)
    }
    //print(dict)
    let newDict = dict.sorted(by: {$0.value == $1.value ? $0.key < $1.key : $0.value > $1.value})
    //print(newDict)
    
    var cnt = 0
    var idx = 0
    var cost = 0
    while true {
        if cnt == n {
            print(cost)
            break
        }
        
        let index = newDict[idx].key
        if cnt + index <= n {
            cnt += index
            cost += board[index-1]
        } else {
            idx += 1
        }
    }
}

solution()
/*
 */


```
