```
import Foundation
/*
퀸은 한 행에 하나밖에 들어가지 못한다.
1행의 1열에 퀸이 들어갔다면
더이상 1열에는 퀸이 들어가지 못한다
[1,2,3,4]
1행의 1열에 2행의 2열에 3행의 3열에 4행의 4열에 퀸이 있다는 뜻을 의미한다.

|기존 퀸의 행 - 새로운 퀸의 행| == |기존 퀸의 열 - 새로운 퀸의 열|
두 값이 같으면 같은 대각선에 존재한다는 사실을 알 수 있다.
1행의 3열 퀸과 3행의 1열 퀸은
1 - 3 == 3 - 1 이므로 같은 대각선에 존재한다는 사실을 알 수 있다는 것이다.
*/
func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var stack: [([T], [Bool])] = array.enumerated().map {
        var visited = Array(repeating: false, count: array.count)
        visited[$0.offset] = true
        return ([$0.element], visited)
    }
    
    while stack.count > 0 {
        let now = stack.removeLast()
        
        let elements = now.0
        var visited = now.1
        
        if elements.count == n {
            result.append(elements)
            continue
        }
        
        for i in 0...array.count-1 {
            if visited[i] { continue }
            visited[i] = true
            stack.append((elements + [array[i]], visited))
            visited[i] = false
        }
    }
    
    return result
}
func solution(_ n:Int) -> Int {
    var arr = Array(1...n)
    var newarr = permutation(arr, 4)
    var result = 0
    for i in 0..<newarr.count {
        //print(newarr[i])
        var possible = true
        for j in 0..<newarr[i].count-1 {
            for k in j+1..<newarr[i].count {
                let ax = newarr[i].firstIndex(of:newarr[i][j])!+1
                let ay = newarr[i][j]
                let bx = newarr[i].firstIndex(of:newarr[i][k])!+1
                let by = newarr[i][k]
                
                //print(ax, ay, bx, by)
                //print(abs(ax-bx), abs(ay-by))
                //같은 대각선에 있다는 것
                if abs(ax - bx) == abs(ay - by) {
                    possible = false
                    break
                }
            }
            
            if possible == false { break }
        }
        if possible == true { 
            //print("가능",newarr[i])
            result += 1
        }
    }
    //print(result)
    return result
}
```
