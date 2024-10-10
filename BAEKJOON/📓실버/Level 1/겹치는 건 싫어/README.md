```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var dict: [Int:Int] = [:]
    var cnt = 0
    var dictIdx = 0
    var result = -1
    for i in 0..<n {
        let value = dict[board[i]] ?? 0
        if value + 1 <= k {
            dict[board[i]] = value + 1
            cnt += 1
        } else {
            dict[board[i]] = value + 1
            cnt += 1
            //print(i,board[i])
            //print("경고")
            while dict[board[i]]! > k {
                let v = dict[board[dictIdx]]
                dict[board[dictIdx]]! -= 1
                cnt -= 1
                dictIdx += 1
            }
            //print("조정끝")
            //print(dict.sorted(by: {$0.key < $1.key}))
            //print(cnt)
        }
        
        //print(dict.sorted(by: {$0.key < $1.key}))
        result = max(result, cnt)
    }
    print(result)
}

solution()
/*
 */


```
