bfs로 최단거리가 아닌 최장거리를 생각하면 풀이해주었다.   
하지만 50%에서 시간초과가 발생하였다.   
```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let (n,k) = (input[0],input[1])
        var time = readLine()!.split(separator: " ").map{Int($0)!}
        var graph = Array(repeating:[Int](), count: n+1)
        var visited = Array(repeating: false, count: n+1)
        var dis = Array(repeating: -1, count: n+1)
        
        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            graph[input[0]].append(input[1])
            visited[input[1]] = true
        }
        //print(graph)
        //print(visited)
        
        let goal = Int(readLine()!)!
        
        
        func bfs() {
            var q: [Int] = []
            for i in 1...n {
                if !visited[i] {
                    q.append(i)
                    dis[i] = time[i-1]
                }
            }
            //print(q)
            var idx = 0
            
            while q.count > idx {
                let now = q[idx]
                //print(now)
                //print(graph[now])
                idx += 1
                for next in graph[now] {
                    if dis[next] < dis[now] + time[next-1] {
                        dis[next] = dis[now] + time[next-1]
                        q.append(next)
                        //print(dis)
                    }
                }
            }
            
            //print(dis)
        }
        
        bfs()
        print(dis[goal])
    }
}
solution()
/*
5 6 -> 8
2 3 -> 20
1 -> 1
*/


```
따라서 혹시 모르는 느낌으로 FilIO로 입력을 받았더니 통과하였다;   

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
    let fIO = FileIO()
    let t = fIO.readInt()
    for _ in 0..<t {
        let n = fIO.readInt()
        let k = fIO.readInt()
        var time: [Int] = []
        for _ in 0..<n {
            time.append(fIO.readInt())
        }
        var graph = Array(repeating:[Int](), count: n+1)
        var visited = Array(repeating: false, count: n+1)
        var dis = Array(repeating: -1, count: n+1)
        
        for _ in 0..<k {
            let a = fIO.readInt()
            let b = fIO.readInt()
            graph[a].append(b)
            visited[b] = true
        }
        //print(graph)
        //print(visited)
        
        let goal = fIO.readInt()
        
        
        func bfs() {
            var q: [Int] = []
            for i in 1...n {
                if !visited[i] {
                    q.append(i)
                    dis[i] = time[i-1]
                }
            }
            //print(q)
            var idx = 0
            
            while q.count > idx {
                let now = q[idx]
                //print(now)
                //print(graph[now])
                idx += 1
                for next in graph[now] {
                    if dis[next] < dis[now] + time[next-1] {
                        dis[next] = dis[now] + time[next-1]
                        q.append(next)
                        //print(dis)
                    }
                }
            }
            
            //print(dis)
        }
        
        bfs()
        print(dis[goal])
    }
}
solution()
/*
5 6 -> 8
2 3 -> 20
1 -> 1
*/


```
