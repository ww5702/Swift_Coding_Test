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
더 쉽게 풀이한 방법이 있다.   
a - 97을 하면 0이 된다.   
따라서 0~25까지 알파벳들의 idx를 전부 저장해준다.   
다음 k개수를 넘어가는 dictionary만 비교하면서   
0부터 k-1개까지의 idx범위를 탐색하면서 범위의 크기를 비교해준다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let word = readLine()!
        let k = Int(readLine()!)!
        var dict = Array(repeating: [Int](), count: 26)
        var i = 0
        for w in word {
            let num = Int(w.asciiValue!-97)
            dict[num].append(i)
            i += 1
        }
        
        //print(dict)
        var (minV,maxV) = (Int.max, Int.min)
        
        for i in 0..<dict.count {
            let now = dict[i]
            if now.count >= k {
                var left = 0, right = k-1
                var minTemp = now[right] - now[left] + 1
                var maxTemp = now[right] - now[left] + 1
                while right < now.count-1 {
                    left += 1; right += 1
                    minTemp = min(minTemp, now[right] - now[left] + 1)
                    maxTemp = max(maxTemp, now[right] - now[left] + 1)
                }
                
                minV = min(minTemp, minV)
                maxV = max(maxTemp, maxV)
                
            }
        }
        
        print(minV == Int.max || maxV == Int.min ? -1 : "\(minV) \(maxV)")
    }
}

solution()
/*
 */

```
