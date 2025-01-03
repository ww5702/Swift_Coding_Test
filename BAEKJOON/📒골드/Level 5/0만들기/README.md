9까지밖에없어서 dfs로 풀이하였다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        
        func calculation(_ arr: [String]) -> Int{
            var sum = Int(arr[0])!
            var idx = 1
            if idx >= arr.count { return -1}
            while idx < arr.count {
                if arr[idx] == "+" {
                    sum += Int(arr[idx+1])!
                    idx += 2
                } else if arr[idx] == "-" {
                    sum -= Int(arr[idx+1])!
                    idx += 2
                }
            }
            return sum
        }
        
        func dfs(_ num: Int, _ list: [String], _ result: [String]) {
            if num == n+1 {
                //print(list)
                //print(calculation(list))
                if calculation(list) == 0 {
                    //print(result)
                    print(result.joined(separator: ""))
                }
                return
            }
            
            let last = list.last! + String(num)
            var temp = list
            temp[temp.count-1] = last
            dfs(num+1, temp, result+[" "]+[String(num)])

            dfs(num+1 , list+["+"]+[String(num)], result+["+"]+[String(num)])
            dfs(num+1 , list+["-"]+[String(num)], result+["-"]+[String(num)])
            
        }
        
        dfs(2, ["1"], ["1"])
        print()
    }
}
solution()
/*
 1-23+4+5+6+7
 */

```
