오히려 cache로 풀이하면 찾을 수 없고, 재귀함수로 찾으면 시간초과가 발생한다.   
1 0   
0 1   
1 1   
2 2   
3 3   
일때 n = 3일때부터 규칙성을 띄고있는 것을 찾을 수 있다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var cache: [(Int,Int)] = Array(repeating: (-1,-1), count: 41)
        
        for i in 0...40 {
            if i == 0 {
                cache[i] = (1,0)
            } else if i == 1 {
                cache[i] = (0,1)
            } else if i == 2 {
                cache[i] = (1,1)
            } else {
                cache[i] = (cache[i-2].0 + cache[i-1].0, cache[i-2].1 + cache[i-1].1)
            }
        }
        print("\(cache[n].0) \(cache[n].1)")
    }
}
solution()

```
