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
비교해야할 대상이 두개이상이고 층이 내려갈수도 올라갈수도 있는데   
이분탐색으로 풀이하니 더 복잡헀던것이다.   
어차피 최대 높이는 256이므로 0부터 시작해서 256까지 가면서   
시간초가 더 낮아지면 변경해주고,   
어차피 256까지 층은 점점 높아지니 층도 자연스럽게 최대 층으로 변환된다.   
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m,b) = (input[0],input[1],input[2])
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    var total = 0
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        total += input.reduce(0, +)
        board[i] = input
    }
    total += b
    //print(board)
    
    var resultTime = Int.max
    var floor = -1
    
    func calTime(_ height: Int) -> Int {
        var time = 0
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] < height {
                    time += (height - board[i][j])
                } else if board[i][j] > height {
                    time += (board[i][j] - height) * 2
                }
            }
        }
        return time
    }
    
    for height in 0...256 {
        let need = n*m*height
        // 가능한 물량인가
        if need <= total {
            let t = calTime(height)
            if resultTime >= t {
                resultTime = t
                floor = height
            }
        }
        
    }
    
    print(resultTime, floor)
}
solution()

```
