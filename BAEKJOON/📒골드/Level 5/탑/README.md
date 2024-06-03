오른쪽에서 큰 수를 찾는 알고리즘과 비슷하다.   
당연히 for문 2개로는 시간초과가 발생한다.   
따라서 반복문은 하나로 형성   
오큰수가 아니기에 idx-=1 으로 내려오면서 풀이한다.   
5   
10 9 5 7 4   
일때   
해당 idx가 더 큰게 아니라면 그냥 추가   
크거나 같은수라면 해당 idx값을 결과값으로 저장   
물론 크거나 같은수일때까지 반복   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var result = Array(repeating: 0, count: n)
    var stack: [Int] = []
    var idx = n-1
    while idx >= 0 {
        
        while !stack.isEmpty && arr[idx] >= arr[stack.last!] {
            result[stack.popLast()!] = idx+1
            //print(result)
        }
    
        stack.append(idx)
        idx -= 1
        //print(stack, idx)
    }
    print(result.map{String($0)}.joined(separator: " "))
}
solution()

```
