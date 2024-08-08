```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var list: [[Int]] = []
    var result = -1
    
    func permutation(_ targetArr: [Int], _ targetNum: Int) -> [[Int]] {
        var list: [[Int]] = []
        var visited = Array(repeating: false, count: n)
        
        func permute(_ arr: [Int]) {
            if arr.count == targetNum {
                list.append(arr)
                return
            }
            
            for i in 0..<n {
                if visited[i] { continue }
                else {
                    visited[i] = true
                    permute(arr + [targetArr[i]])
                    visited[i] = false
                }
            }
        }
        
        permute([])
        
        return list
    }
    
    list = permutation(input, n)
    
    
    for i in 0..<list.count {
        let nowArr = list[i]
        let value = calcul(nowArr, nowArr[0])
        //print(value)
        result = max(value, result)
    }
    
    
    func calcul(_ arr: [Int], _ cur: Int) -> Int{
        var sum = 0
        var cur = cur
        
        for i in 1..<n {
            let temp = abs(cur - arr[i])
            sum += temp
            cur = arr[i]
        }
        return sum
    }
    
    
    print(result)
}


solution()
/*
 */

```
