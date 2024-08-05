최대로 제곱을 했을때부터 역으로 계산하여 0이 될때까지 재귀함수를 돌린다   
그리고 만약 구했던 값보다 큰 값이 반복된다면 빠져나온다   
시간초과가 발생하여 FileIO로 입출력을 받았다   
19프로에서 여전히 시간초과 발생   
따라서 4보다 크다면 return 으로 변경하였더니 통과   

```
import Foundation
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { // 공백과 줄바꿈 무시
            now = read()
        }
        
        if now == 45{ // 음수 처리
            isPositive.toggle()
            now = read()
        }
        
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


func solution() {
    let file = FileIO()
    let n = file.readInt()
    
    var result = Int.max
    
    func dfs(_ n: Int, _ cnt: Int) {
        //print(n,cnt)
        if (cnt >= 5) { return }
        
        if (n == 0) {
            result = cnt
            //print("결과 ",cnt)
            return
        }
        
        let num = Int(sqrt(Double(n)))
        for i in stride(from: num, through: 1, by: -1) {
            //print(i)
            if (cnt+1 < result) {
                dfs(n - (i*i), cnt+1)
            }
        }
    }
    
    dfs(n,0)
    print(result)
}

solution()
/*

 */

```
