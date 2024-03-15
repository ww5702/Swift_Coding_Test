```
import Foundation
struct Queue {
    private var index: Int = 0
    private var queue = [Int]()
    
    var isEmpty: Bool {
        queue.count == index
    }
    
    var count: Int {
        queue.count - index
    }
    
    mutating func push(_ n: Int) {
        queue.append(n)
    }
    
    mutating func pop() -> Int {
        defer {
            index += 1
        }
        return queue[index]
    }
}

func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var indegree = Array(repeating: 0, count: n + 1) // 나를 이긴팀 ( 자신에게 들어오는 간선의 갯수)
        var matrix = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1) // 승패를 저장
        var lastYear = readLine()!.split(separator: " ").map{Int(String($0))!}
        for i in 0..<n-1 {
            let winner = lastYear[i]
            for j in i+1..<n {
                let loser = lastYear[j]
                matrix[winner][loser] = true
                indegree[loser] += 1
            }
        }
        print(indegree)
        print(matrix)
        let m = Int(readLine()!)!
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            let win = input[0], lose = input[1]
            if matrix[win][lose] {
                matrix[win][lose] = false
                matrix[lose][win] = true
                indegree[win] += 1
                indegree[lose] -= 1
            } else {
                matrix[win][lose] = true
                matrix[lose][win] = false
                indegree[win] -= 1
                indegree[lose] += 1
            }
        }
        
        var result = [Int]()
        var q = Queue()
        
        for i in 1..<n+1 {
            if indegree[i] == 0 { q.push(i) }
        }
        print(q)
        
        var isOk = true
        var more = false
        
        for _ in 0..<n {
            if q.isEmpty {
                isOk = false
                break
            }
            if q.count > 1 {
                more = true
                break
            }
            
            let now = q.pop()
            result.append(now)
            
            for j in 1..<n+1 {
                if matrix[now][j] {
                    indegree[j] -= 1
                    
                    if indegree[j] == 0 {
                        q.push(j)
                    }
                }
            }
        }
        
        if !isOk {
            print("IMPOSSIBLE")
        } else if more {
            print("?")
        } else {
            print(result.map{String($0)}.joined(separator: " "))
        }
    }
}
solution()
/*
 3
 5
 5 4 3 2 1
 2
 2 4
 3 4
 3
 2 3 1
 0
 4
 1 2 3 4
 3
 1 2
 3 4
 2 3
 */

```
