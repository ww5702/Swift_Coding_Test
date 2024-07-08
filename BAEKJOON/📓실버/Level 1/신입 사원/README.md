첫번쨰 성적을 기준으로 오름차순 정렬을 한다.   
그렇다면 이미 i사원은 자신이 뒤로는 전부 다 높다.   
그렇다면 두번째 성적까지 높아야 되기에 만약   
다음 사원이 더 높은 등수를 가지고 있다면 last를 바꿔주고   
+1 해준다.   
더 낮다면 모두한테 높은것이 아니다.   
하지만 시간초과   

```
import Foundation
func solution() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var arr: [(Int,Int)] = []
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{Int(String($0))!}
            arr.append((input[0],input[1]))
        }
        arr.sort(by: {$0.0 < $1.0})
        //print(arr)
        var ans = 1
        var last = arr[0].1
        for i in 1..<n {
            if last > arr[i].1 {
                ans += 1
                last = arr[i].1
            }
        }
        print(ans)
    }
}

solution()
/*

 */

```
풀이는 맞았다^^   
또다시 swift의 느린 입출력땜에 시간초과 발생   
또한 두번째 등수가 1등이 이미 나와버리면 더이상 계산은 무의미하므로 1일때 break문을 추가해주었다.   

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

func solution() {
    let fIO = FileIO()
    
    let t = fIO.readInt()
    for _ in 0..<t {
        let n = fIO.readInt()
        var arr: [(Int,Int)] = []
        for _ in 0..<n {
            arr.append((fIO.readInt(),fIO.readInt()))
        }
        arr.sort(by: {$0.0 < $1.0})
        //print(arr)
        var ans = 1
        var last = arr[0].1
        for i in 1..<n {
            if last > arr[i].1 {
                ans += 1
                last = arr[i].1
            }
            if last == 1 { break }
        }
        print(ans)
    }
}

solution()
/*

 */

```
