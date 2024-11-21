```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var line: [Int] = []
    var q: [Int] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if input[0] == 1 {
            q.append(input[1])
            if q.count > line.count {
                line = q
            } else if q.count == line.count {
                if q.last! < line.last! {
                    line = q
                }
            }
        } else if input[0] == 2 {
            q.reverse()
            q.removeLast()
            q.reverse()
        }
        //print(q, line)
    }
    print(line.count, line.last!)
}
solution()
/*
 
 */

```
q를 사용해도 틀렸었고,   
그냥 입력받아도 틀렸었다;   
FileIO()를 사용하면서 숫자덧셈으로 풀이해야한다.   

```
import Foundation
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
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
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index-1)])
    }
}


func solution(){
    let io = FileIO()
    let n = io.readInt()
    var cnt = 0
    var result = (0,Int.max)
    for _ in 0..<n {
        let input = io.readInt()
        if input == 1 {
            let num = io.readInt()
            cnt += 1
            if result.0 == cnt {
                if num < result.1 {
                    result = (cnt,num)
                }
            } else if result.0 < cnt {
                result = (cnt,num)
            }
        } else if input == 2 {
            cnt -= 1
        }
        //print(q, line)
    }
    print(result.0, result.1)
}
solution()
/*
 
 */

```
