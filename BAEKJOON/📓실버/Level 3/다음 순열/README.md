순열 만들고 다시 순환하면 메모리초과   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let value = readLine()!.split(separator: " ").map{Int(String($0))!}
    var arr: [Int] = []
    for i in 1...n {
        arr.append(i)
    }
    
    var visited = Array(repeating: false, count: n)
    var result: [[Int]] = []
    
    func combi(_ list: [Int]) {
        if list.count == n {
            result.append(list)
            return
        }
        
        for i in 0..<n {
            if !visited[i] {
                visited[i] = true
                combi(list + [arr[i]])
                visited[i] = false
            }
        }
        
    }
    
    combi([])
    //print(result)
    var answer = -1
    for i in 0..<result.count {
        if result[i] == value {
            answer = i+1
            break
        }
    }
    print(result.count == answer ? -1 : result[answer].map{String($0)}.joined(separator: " "))
}

solution()
/*
 */

```
순열 돌리면서 확인하니 이번에는 시간초과   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let value = readLine()!.split(separator: " ").map{Int(String($0))!}
    var arr: [Int] = []
    for i in 1...n {
        arr.append(i)
    }
    
    var visited = Array(repeating: false, count: n)
    var isEnd = false
    var funcEnd = false
    
    func combi(_ list: [Int]) {
        if funcEnd { return }
        
        if list.count == n {
            if isEnd {
                print(list.map{String($0)}.joined(separator: " "))
                funcEnd = true
            }
            
            if list == value {
                isEnd = true
            }
            
            
            
            return
        }
        
        for i in 0..<n {
            if !visited[i] {
                visited[i] = true
                combi(list + [arr[i]])
                visited[i] = false
            }
        }
        
    }
    
    combi([])
    
    if !funcEnd { print(-1) }
    //print(result)
}

solution()
/*
 */

```
해당 문제는 수학적 알고리즘이 필요하다.   
1 3 4 2라면 다음 숫자는 1 4 2 3이다.   
따라서 idx를 증가시키면서 뒤에 숫자보다 작다면 idx를 지정해준다.   
idx 는 1이 된다.   
idx 뒤부터 idx보다 큰 값이 bigidx가 되고,   
서로 숫자를 바꿔준다.   
1 4 3 2가 된다.   
그리고 1 4 뒤의 부분을 반대로 뒤집어줘야 정답이 된다.   

```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    if Array(1...n).reversed() == arr {
        print(-1)
    } else {
        var idx = 0
        for i in 0..<n {
            if i+1 < n, arr[i] < arr[i+1] {
                idx = i
            }
        }
        
        var bigidx = 0
        for j in idx..<n {
            if arr[idx] < arr[j] {
                bigidx = j
            }
        }
        
        //print(idx,bigidx)
        
        arr.swapAt(idx, bigidx)
        arr = arr[...idx] + arr[(idx+1)...].sorted()
        print(arr.map{String($0)}.joined(separator: " "))
    }
    
}

solution()
/*
 */

```
