dfs로 풀이해봤으나 당연히 시간초과   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: 4), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board[i] = input
    }
    var result = 0
    
    
    func dfs(_ depth: Int, _ sum: Int) {
       
        if depth == 4 {
            //print(depth, sum)
            if sum == 0 {
                //print(" 정답")
                result += 1
            }
            return
        }
        
        for i in 0..<n {
            dfs(depth+1, sum + board[i][depth])
        }
    }
    
    for i in 0..<n {
        dfs(1, board[i][0])
    }
    print(result)
}


solution()
/*
 */

```
먼저 AB배열과 CD배열을 각자 더했을때의 경우의수를 배열에 따로 저장해준다.   
그리고 정렬후 AB배열의 처음과 CD의 끝에서부터 모이면서 0이 되는 index를 각각 구한다.   
그리고 구했을때 87과 -87이라고 가정하자.   
이랬을때 더 있을 경우는 AB의 87이 3번 있고, CD의 -87이 2번 있다면   
총 6번 0이 되는 예외사항을 구해주면 된다.   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: 4), count: n)
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        board[i] = input
    }
    var AB: [Int] = []
    var CD: [Int] = []
    var arrIdx = n*n-1
    var start = 0, end = arrIdx
    var result = 0
    
    for i in 0..<n {
        for j in 0..<n {
            AB.append(board[i][0]+board[j][1])
            CD.append(board[i][2]+board[j][3])
        }
    }
    AB.sort()
    CD.sort()
    //print(AB)
    //print(CD)
    
    while start <= arrIdx && end >= 0 {
        var increase = 0, decrease = 0
        
        // 만약 0보다 크다면 end를 줄이기
        if AB[start] + CD[end] > 0 {
            end -= 1
        } else if AB[start] + CD[end] < 0 {
        // 0보다 작다면 start 키우기
            start += 1
        } else {
        // 0이라면
            let ABvalue = AB[start]
            let CDvalue = CD[end]
            
            //print(ABvalue, start)
            //print(CDvalue, end)
            
            // 같은 숫자면 계속해서 더해서 0이 된다
            while start <= arrIdx && AB[start] == ABvalue {
                start += 1
                increase += 1
            }
            
            while end >= 0 && CD[end] == CDvalue {
                end -= 1
                decrease += 1
            }
            
            //print(increase, decrease)
            result += (increase * decrease)
        }
        
    }
    print(result)
}


solution()
/*
 */

```
