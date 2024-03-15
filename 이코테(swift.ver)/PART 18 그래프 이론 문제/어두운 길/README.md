최소신장트리를 이용해 최소 비용으로 모든 도시를 연결할 수 있다.   
비용을 기준으로 오름차순으로 정렬하고,   
union-find를 통해 사이클이 형성되지 않는다면 union해준다.   
```
import Foundation
func solution(){
    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        } else {
            parent[x] = find(parent[x])
            return parent[x]
        }
    }
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        if (a < b) {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (nm[0], nm[1])
    var parent = [Int](0...n)
    var total = 0
    var board:[(Int,Int,Int)] = []
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        board.append((input[0],input[1],input[2]))
        total += input[2]
    }
    board.sort(by: {$0.2 < $1.2})
    //print(board,total)
    var result = 0
    for b in board {
        let start = b.0
        let end = b.1
        let cost = b.2
        if find(start) == find(end) { continue }
        union(start,end)
        result += cost
        //print(parent, result)
    }
    print(total - result)
}
solution()
/*
 7 11
 0 1 7
 0 3 5
 1 2 8
 1 3 9
 1 4 7
 2 4 5
 3 4 15
 3 5 6
 4 5 8
 4 6 9
 5 6 11
 
 */

```
