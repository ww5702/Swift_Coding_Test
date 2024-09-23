시간초과   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var list = readLine()!.split(separator: " ").map{Int(String($0))!}
    var dict: [Int:Int] = [:]
    for i in 0..<n {
        let value = dict[list[i]] ?? 0
        dict[list[i]] = value + 1
    }
    //print(dict)
    var cnt = dict.count
    var result = 0
    var answer = -1
    
    
    func dfs(_ cnt: Int, _ start:Int, _ end: Int, _ dict: [Int:Int], _ result: Int) {
        //print(cnt,start,end,dict,result)
        if n-result <= answer { return }
        
        if cnt == 2 {
            //print(n,result,answer)
            answer = max(n-result, answer)
            //print(answer)
            return
        }
        
        
        // 앞에서 하나 빼는 경우
        if start < end {
            var newDict = dict
            let value = newDict[list[start]]!
            newDict[list[start]] = value - 1
            
            if newDict[list[start]] == 0 {
                dfs(cnt-1, start+1, end, newDict, result+1)
            } else {
                dfs(cnt, start+1, end, newDict, result+1)
            }
        }
        
        // 뒤에서 하나 빼는 경우
        if start < end {
            var newDict = dict
            let value = newDict[list[end]]!
            newDict[list[end]] = value - 1
            
            if newDict[list[end]] == 0 {
                dfs(cnt-1, start, end-1, newDict, result+1)
            } else {
                dfs(cnt, start, end-1, newDict, result+1)
            }
        }
    }
    
    if dict.count <= 2 {
        print(n)
    } else {
        dfs(cnt, 0, n-1, dict, 0)
        print(answer)
    }
}

solution()
/*
 */


```
