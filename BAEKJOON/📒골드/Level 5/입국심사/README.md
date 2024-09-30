전에 헀던 이분탐색문제와 같다.   
0부터 최대값을 구한뒤 가운데값으로 모든 심사위원을 돌리고   
더 많이 검사가능하면 시간을 줄이고, m만큼 못하면 시간을 늘려준다.   
if cnt >= m { break }   
을 넣어야 32프로에서 런타임에러 문제를 해결할 수 있었다.   

```
import Foundation
func solution() {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board: [Int] = []
    var maxValue = -1
    var minValue = 1_000_000_000
    for _ in 0..<n {
        let input = Int(readLine()!)!
        maxValue = max(maxValue, input)
        board.append(input)
    }
    
    var start = 1 , end = maxValue*m
    var result = -1
    //print(start,end)
    
    while start <= end {
        let middle = (start+end)/2
        //print(start, end , middle)
        var cnt = 0
        for i in 0..<n {
            cnt += (middle / board[i])
            if cnt >= m { break }
        }
        //print(cnt)
        if cnt >= m {
            end = middle - 1
            result = middle
        } else {
            start = middle + 1
        }
    }
    
    print(result)
}

solution()
/*
 */


```
