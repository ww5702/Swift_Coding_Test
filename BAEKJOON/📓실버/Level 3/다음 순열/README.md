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
