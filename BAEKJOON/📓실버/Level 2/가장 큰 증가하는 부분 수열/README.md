덧셈이라 dfs로 진행했으나 시간초과   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    var sumArr: [Int] = []
    var temp = arr.reduce(0, +)
    for i in 0..<n {
        
        sumArr.append(temp)
        temp -= arr[i]
        
    }
    //print(sumArr)
    var result = -1
    func dfs(_ sum: Int, _ last: Int, _ idx: Int) {
        
        if idx == n {
            result = max(result, sum)
            //print(result)
            return
        }
        if sum + sumArr[idx] < result {
            //print(result, sum, idx, sumArr[idx], "이미 불가")
            return }
        
        for i in idx..<n {
            if last < arr[i] {
                dfs(sum+arr[i], arr[i], i+1)
            }
            dfs(sum, last, i+1)
        }
    }
    
    dfs(0, 0, 0)
    print(result)
}
solution()
/*
 */

```
