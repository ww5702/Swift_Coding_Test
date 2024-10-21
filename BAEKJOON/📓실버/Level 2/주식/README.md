dfs 시간초과   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
        var result = Int.min
        
        func dfs(_ idx: Int, _ list: [Int], _ sum: Int) {
            //print(idx, list, sum)
            if idx >= n {
                result = max(result, sum)
                //print(sum)
                return
            }
            
            dfs(idx+1, list+[arr[idx]], sum)
            
            if !list.isEmpty {
                //print("팔거임",list,"이가격에",arr[idx])
                var value = 0
                for i in 0..<list.count {
                    value += (arr[idx]-list[i])
                }
                //print("팔았음",value)
                dfs(idx+1, [], sum+value)
            }
            
            dfs(idx+1, list, sum)
        }
        
        dfs(0, [], 0)
        print(result)
    }
}

solution()
/*
 
 */

```
실버 문제는 그냥 쉽게 생각하는게 답이다.   
그냥 제일 비싼값으로 현재 주식을 판다고 생각하면 된다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
        
        var result = 0
        var maxValue = 0
        
        for i in (0..<n).reversed() {
            if maxValue < arr[i] {
                maxValue = arr[i]
            } else {
                result += maxValue-arr[i]
            }
        }
        
        print(result)
    }
}

solution()
/*
 
 */

```
