이분탐색 풀이중 파라메트릭 서치를 이용하는 문제이다.   
기존 이분탐색은 start가 arr.min()이었다면 해당 문제는 1부터 시작해야 한다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    let total = Int(readLine()!)!
    var (start,end) = (1,arr.max()!)
    
    while start <= end {
        let middle = (start + end) / 2
        
        let money = arr.reduce(0) {$0 + ($1 < middle ? $1 : middle)}
        if money > total {
            end = middle - 1
        } else {
            start = middle + 1
        }
    }
    
    print(end)
}
solution()

```
