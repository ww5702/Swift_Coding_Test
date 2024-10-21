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
