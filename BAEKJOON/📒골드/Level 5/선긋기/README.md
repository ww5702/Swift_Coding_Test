fileIO를 사용하지 않으면 풀 수 없는 문제이다.   
문제는 다음과 같다.   
1-2 / 2-3 / 3-4 / 6-8   
이런 선들이 있다면   
1부터 4까지는 한번에 그을수 있고, 6부터 다시 8까지 그을수있다.   
그렇다면 길이는 5이다.   
만약 1-5 / 2-3 이라면 3은 5보다 작기때문에 계산하지않는다.   
```
import Foundation
final class FileIO {
private let buffer: Data
private var index: Int = 0

init(fileHandle: FileHandle = FileHandle.standardInput) {
    self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
}

@inline(__always) private func read() -> UInt8 {
    defer {
        index += 1
    }
    guard index < buffer.count else { return 0 }
    
    return buffer[index]
}

@inline(__always) func readInt() -> Int {
var sum = 0
var now = read()
var isPositive = true
    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
    while now >= 48, now <= 57 {
        sum = sum * 10 + Int(now-48)
        now = read()
    }
    return sum * (isPositive ? 1:-1)
}

@inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}



func solution(){
    let fileIO = FileIO()
    let n = fileIO.readInt()
    var board = [(Int,Int)]()
    for _ in 0..<n {
        let s = fileIO.readInt()
        let e = fileIO.readInt()
        board.append((s,e))
    }
    board.sort{$0.0 == $0.1 ? $0.1 < $1.1 : $0.0 < $1.0}
    //print(board)
    
    var answer = 0
    var (start,end) = (board[0].0, board[0].1)
    
    for i in 1..<n {
        let line =  board[i]
        if end >= board[i].1 {
            continue
        }
        
        if line.0 <= end && end < line.1 {
            end = line.1
        } else if end < line.1 {
            answer += end - start
            start = line.0
            end = line.1
        }
    }
    
    answer += end - start
    print(answer)
}

solution()
/*
 4
 1 3
 2 5
 3 5
 6 7
 */

```
