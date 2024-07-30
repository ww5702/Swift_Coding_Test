최대힙 최소힙 2개를 구현한다.   
그리고 최대힙에서 가장 작은 수를 뽑아낸다고 생각하고 구현한다.   
1 5 2 10 -99 7 5   
가 있을때   
아무것도 없다면 1을 최대힙에 삽입 그리고 가장 작은수를 출력   
만약 최대힙에서 가장 작은수보다 더 큰수라면 최소힙에 삽입   
그리고 다시 최대힙에서 가장 작은수 출력   
1    
2 5 가 삽입되어있을때   
최소힙의 양이 더 많다면 최소힙에서 가장 작은수를 최대힙에 삽입   
1 2   
5   
가 형성되고, 다시 최대힙에서 가장 작은수 2 출력   
10 이 최소힙에 삽입   
1 2   
5 10   
그리고 다시 최대힙에서 가장 작은수 2 출력   
위와 같은 형식으로 구현한다.   

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
struct Heap {
    var list = [Int]()
    var comparer: (Int,Int) -> Bool
    
    init(_ comparer : @escaping (Int,Int) -> Bool ) {
        self.comparer = comparer
    }
    
    mutating func insert(_ x: Int ) {
        var idx = list.count
        list.append(x)
        while idx>0, comparer(list[(idx-1)/2],list[idx]) {
            list.swapAt((idx-1)/2, idx)
            idx = (idx-1)/2
        }
    }
    mutating func delete() -> Int? {
        if list.isEmpty { return nil }
        list.swapAt(0, list.count-1)
        let delete = list.removeLast()
        var idx = 0, change = -1
        while idx < list.count {
            for k in idx*2+1...idx*2+2 {
                if k < list.count && comparer(list[idx], list[k]) {
                    if change == -1 || comparer(list[change], list[k]) {
                        change = k
                    }
                }
            }
            if change == -1 { break }
            list.swapAt(idx, change)
            idx = change; change = -1
        }
        return delete
    }
    var isEmpty: Bool { return list.isEmpty }
    var count: Int { return list.count}
    var first: Int { return list.first!}
}
func solution() {
    var minPriorityQueue = Heap(>)
    var maxPriorityQueue = Heap(<)
    var answer = ""
    let file = FileIO()
    let n = file.readInt()
    for _ in 0..<n {
        let input = file.readInt()
        if maxPriorityQueue.isEmpty {
            maxPriorityQueue.insert(input)
        } else {
            if input > maxPriorityQueue.first {
                minPriorityQueue.insert(input)
            } else {
                maxPriorityQueue.insert(input)
            }
            
            if maxPriorityQueue.count == minPriorityQueue.count+2 {
                minPriorityQueue.insert(maxPriorityQueue.delete()!)
            } else if maxPriorityQueue.count + 1 == minPriorityQueue.count {
                maxPriorityQueue.insert(minPriorityQueue.delete()!)
            }
            
        }
        answer += "\(maxPriorityQueue.first)\n"
    }
}

solution()
/*

 */

```
