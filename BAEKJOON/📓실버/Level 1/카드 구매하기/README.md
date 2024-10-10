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
사실 dp로 풀면 더 쉽게 풀이가 가능하다.   
1개를 만들수있는 최댓값부터 점차 늘려가면서 구해준다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    var dp = [Int](repeating: 0, count: n+1)
    for i in 1..<n+1 {
        for j in 1..<i+1 {
            print(i,j)
            dp[i] = max(dp[i], dp[i-j]+board[j-1])
        }
    }
    
    // 4개 =  1개를 만들수잇는 최댓값 + 3개값
    // 2개를 만들수있는 최댓값 + 2개값
    // 3개를 만들수있는 최댓값 + 1개값
    print(dp[n])
}

solution()
/*
 */

```
