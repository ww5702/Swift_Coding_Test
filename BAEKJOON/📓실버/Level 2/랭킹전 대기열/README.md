```
import Foundation
func solution(){
    let pm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (p,m) = (pm[0],pm[1])
    
    var q: [[(Int,String)]] = []
    
    for _ in 0..<p {
        let input = readLine()!.split(separator: " ").map{String($0)}
        let (level, name) = (Int(input[0])!,input[1])
        
        if q.isEmpty {
            q.append([(level,name)])
            continue
        }
        var isAdd = false
        for i in 0..<q.count {
            let num = q[i][0].0
            if q[i].count >= m || num-10 > level || num+10 < level { continue }
            q[i].append((level,name))
            isAdd = true
            break
        }
        
        if !isAdd {
            q.append([(level,name)])
        }
    }
    
    q.forEach{
        print($0.count == m ? "Started!" : "Waiting!")
        for i in $0.sorted(by: {$0.1 < $1.1}) {
            print("\(i.0) \(i.1)")
        }
    }
}
solution()
/*
 
 */

```
