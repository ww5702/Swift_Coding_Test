투포인터문제인거같은데 좀 지저분하다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let word = readLine()!.map{String($0)}
        let k = Int(readLine()!)!
        var dict: [String:Int] = [:]
        var (minV,maxV) = (10000,-1)
        var (start,end) = (0,0)
        
        while start <= end {
            let value = dict[word[end]] ?? 0
            dict[word[end]] = value + 1
            //print(dict)
            
            if dict[word[end]] == k {
                //print("같음")
                while dict[word[end]]! >= k {
                    
                    minV = min(minV, (end-start))
                    maxV = max(maxV, (end-start))
                    dict[word[start]]! -= 1
                    //print("줄임",dict)
                    start += 1
                }
            }
            //print(start, end)
            //print(dict)
            if end < word.count-1 {
                end += 1
            } else {
                break
            }
        }
        if minV == 10000 || maxV == 0 {
            print(-1)
        } else {
            print("\(minV+1) \(maxV+1)")
        }
    }
}

solution()
/*
 */

```
