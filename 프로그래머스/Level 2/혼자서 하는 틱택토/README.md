첫 제출
```
import Foundation

func solution(_ board:[String]) -> Int {
    var data = board.map{$0.map{String($0)}}
    var counto = 0
    var countx = 0
    for i in 0..<data.count {
        var count = 0
        for j in data[i] {
            if j == "O" { 
                counto += 1 
                count += 1
            } else if j == "X" { countx += 1 }
            // 연속된 3개가 나왔다면 return 0
            if count == 3 { return 0 }
        }
        
    }
    if counto != 0 || countx != 0 {
        // 만약 x가 더 많았다면
        if countx > counto { return 0 }
    }
    // 그런 경우가 아니라면 전부 가능
    return 1
}
```
O가 연속 3개가 나오거나 x가 더 많거나의 경우만 생각해서 계산했지만   
O가 X보다 2개 이상 앞서거나, 비옥에 선공한 줄이 2개보다 많을때(하지만 O는 동시에 2개 성공할 수 있다)   
O의 승리에서 O의 개수와 X의 개수가 같거나, X의 승리에서 O의 개수가 X의 개수보다 많은 경우 또한 생각해줘야 한다.   
```
import Foundation

func solution(_ board:[String]) -> Int {
    var data = board.map{$0.map{String($0)}}
    var counto = 0
    var countx = 0
    for i in 0..<data.count {
        var count = 0
        for j in data[i] {
            if j == "O" { 
                counto += 1 
            } else if j == "X" { countx += 1 }
        }
        
    }
    if counto < countx || counto > countx + 1 { return 0 }
    
    var OBingo: Int = 0
    var XBingo: Int = 0
    
    for row in 0..<3 {
        if data[row][0] != "." && data[row][0] == data[row][1] && data[row][1] == data[row][2] {
            if data[row][0] == "O" { OBingo += 1 }
            else { XBingo += 1 }
        }
        
        // 세로 빙고
        if data[0][row] != "." && data[0][row] == data[1][row] && data[1][row] == data[2][row] {
            if data[0][row] == "O" { OBingo += 1 }
            else { XBingo += 1 }
        }
    }
    
    // 대각 빙고
    if data[1][1] == "O" {
        if data[0][0] == data[1][1] && data[1][1] == data[2][2] { OBingo += 1}
        if data[0][2] == data[1][1] && data[1][1] == data[2][0] { OBingo += 1}
    } else if data[1][1] == "X" {
        if data[0][0] == data[1][1] && data[1][1] == data[2][2] { XBingo += 1}
        if data[0][2] == data[1][1] && data[1][1] == data[2][0] { XBingo += 1}
    }
    
    if OBingo == 2 { return 1 }
    if OBingo + XBingo >= 2 { return 0 }
    if OBingo == 1 && counto <= countx { return 0 }
    if XBingo == 1 && counto > countx { return 0 }
    // 그런 경우가 아니라면 전부 가능
    return 1
}
```
