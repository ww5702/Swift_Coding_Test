set 사용 하지만 시간초과   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,d,k,c) = (input[0],input[1],input[2],input[3])
    var board: [Int] = []
    for _ in 0..<n {
        board.append(Int(readLine()!)!)
    }
    var result = -1
    
    for i in 0...n-k {
        var value = board[i..<i+k]
        value.append(c)
        let setValue = Set(value)
        result = max(result, setValue.count)
    }
    
    // 뒤에 꺼 + 앞에꺼
    for i in n-k+1..<n {
        var value = board[i..<n] + board[0..<k-(n-i)]
        value.append(c)
        let setValue = Set(value)
        result = max(result, setValue.count)
    }
    
    print(result)
}

solution()
/*
 */
```
set은 시간초과가 보통 발생한다.   
따라서 dict를 이용해 한바퀴를 돌면서 배열뒤로 한 사이클을 만들어준다.   
따라서 right가 2xn-1일때까지 반복한다.   

```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,d,k,c) = (input[0],input[1],input[2],input[3])
    var board: [Int] = []
    for _ in 0..<n {
        board.append(Int(readLine()!)!)
    }
    var dict: [Int:Int] = [:]
    var (left,right,get,total,answer) = (0,0,0,0,0)
    
    func addDict(_ x: Int) {
        if let _ = dict[board[x]] {
            dict[board[x]]! += 1
        } else {
            if board[x] != c {
                total += 1
            }
            dict[board[x]] = 1
        }
        answer = max(answer, total)
        board.append(board[x])
        get += 1
    }
    
    func removeDict(_ x: Int) {
        answer = max(answer, total)
        if let _ = dict[board[x]] {
            dict[board[x]]! -= 1
            if dict[board[x]] == 0 {
                if board[x] != c {
                    total -= 1
                }
                dict.removeValue(forKey: board[x])
            }
        }
        get -= 1
    }

    while true {
        if get < k {
            if right == 2*n-1 {
                break
            }
            addDict(right)
            right += 1
            
        } else {
            removeDict(left)
            left += 1
        }
    }
    
    print(answer + 1)
}

solution()
/*
 */


```
