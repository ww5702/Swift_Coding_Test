골드3치고는 쉬웠다.   
정렬한 번호들을 나열하고   
i부터 시작해서 i+1 부터 n-1가지 비교한다.   
반복문은 5개를 예시로 3까지만 비교한다 (3,4,5)의 경우만   
따라서 n-2까지   
0,1,4값들을 더해준다.   
만약 해당값이 0에 더 가깝다면 값들을 바꿔준다.   
이와는 별개로 0보다 크다면 최대값idx를 1줄여주고,   
0보다 작다면 최소값idx를 1늘려준다.   
그리고 0이라면 break시켜준다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
    var result: [Int] = []
    var resultValue = 10_000_000_000
    var isEnd = false
    
    for i in 0..<n-2 {
        var start = i+1
        var end = n-1
        
        while start < end {
            let sum = board[i] + board[start] + board[end]
            if abs(sum) < resultValue {
                resultValue = abs(sum)
                result = [board[i], board[start], board[end]]
            }
            
            if sum == 0 {
                isEnd = true
                break
            } else if sum > 0 {
                end -= 1
            } else {
                start += 1
            }
        }
        
        if isEnd { break }
    }
    print(result.map{String($0)}.joined(separator: " "))
    //print(result, resultValue)
}

solution()
/*
 */


```
