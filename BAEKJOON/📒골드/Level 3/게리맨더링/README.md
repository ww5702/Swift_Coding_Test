완전탐색과 bfs문제이다.   
먼저 10개의 구밖에 없으니 10C1, 10C2 ... 등등으로 구역을 나눠준다.   
그리고 bfs로 나눠준 2개의 구를 돌면서   
사이클이 형성되는지 확인해준다.   
만약 해당 구역을 다 돌수 있다면 해당 구역들의 인구수를 더한다음   
두 구역의 차를 구해본다.   
그리고 최솟값을 출력해준다.   

```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    let people = readLine()!.split(separator: " ").map{Int(String($0))!}
    var board = Array(repeating: [Int](), count: n+1)
    var result = Int.max
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if input[0] != 0 {
            board[i+1] = Array(input[1...])
        }
    }
    //print(board)
    
    func combi(_ arr: [Int], _ num: Int, _ idx: Int) {
        if arr.count == num {
            var rest: [Int] = []
            for i in 1...n {
                if !arr.contains(i) {
                    rest.append(i)
                }
            }
            //print(arr, rest)
            bfs(arr, rest)
            return
        }
        
        for i in idx..<board.count {
            combi(arr+[i], num, i+1)
        }
        
        
    }
    
    func bfs(_ arrA: [Int], _ arrB: [Int]){
        var q: [Int] = []
        var visited = Array(repeating: false, count: n+1)
        var (sumA,sumB) = (0,0)
        visited[arrA[0]] = true
        q.append(arrA[0])
        var idx = 0
        while q.count > idx {
            var now = q[idx]
            idx += 1
            
            for next in board[now] {
                if !visited[next] && arrA.contains(next) {
                    q.append(next)
                    visited[next] = true
                }
            }
        }
        
        if q.count != arrA.count {
            //print("A연결불가",q)
            return
        }
        
        visited = Array(repeating: false, count: n+1)
        visited[arrB[0]] = true
        q = []
        q.append(arrB[0])
        idx = 0
        while q.count > idx {
            var now = q[idx]
            idx += 1
            
            for next in board[now] {
                if !visited[next] && arrB.contains(next) {
                    q.append(next)
                    visited[next] = true
                }
            }
        }
        
        if q.count != arrB.count {
            //print("B연결불가",q)
            return
        }
        
        for i in 0..<arrA.count {
            sumA += people[arrA[i]-1]
        }
        for i in 0..<arrB.count {
            sumB += people[arrB[i]-1]
        }
        
        result = min(result, abs(sumA-sumB))
        //print(sumA,sumB)
        
    }
    
    
    for i in 1...n/2 {
        combi([], i, 1)
    }
    print(result != Int.max ? result : -1)
}

solution()
/*
 */

```
