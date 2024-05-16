이분탐색으로 풀이하려 헀으나 29%에서 실패   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,b) = (input[0],input[1],input[2])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    var (start, end) = (Int.max, Int.min)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board[i] = input
        start = min(start, input.min()!)
        end = max(end, input.max()!)
    }
    print(board)
    print(start,end)
    var resultTime = Int.max
    var floor = 0
    
    while (start <= end) {
        let middle = (start+end)/2
        print(middle)
        var inven = b
        var time = 0
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] < middle {
                    inven -= (middle - board[i][j])
                    time += (middle - board[i][j])
                } else if board[i][j] > middle {
                    inven += (board[i][j] - middle)
                    time += (board[i][j] - middle) * 2
                }
            }
        }
        
        
        print(inven, time)
        // 층이 더 낮아야함
        if inven < 0 {
            end = middle - 1
        } else {
            // 시간이 단축 되었는지
            if time < resultTime {
                resultTime = time
                floor = middle
            } else if time == resultTime {
                // 층이 더 높아졌으면 변화
                if middle > floor {
                    floor = middle
                }
            }
            start = middle + 1
        }
    }
    print(resultTime, floor)
}
solution()

```
