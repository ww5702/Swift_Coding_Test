dfs로 풀이하면 메모리초과   

```
import Foundation
func solution(){
    let arr = readLine()!.map{String($0)}
    //print(arr)
    
    var visited = Array(repeating: false, count: arr.count)
    var answer = -1
    
    func dfs(_ depth: Int, _ num: String)  {
        if depth == arr.count {
            let result = Int(num)!
            if result % 30 == 0 {
                answer = max(result, answer)
            }
            return
        }
        
        for i in 0..<arr.count {
            if !visited[i] {
                visited[i] = true
                dfs(depth+1, num+arr[i])
                visited[i] = false
            }
        }
    }
    
    for i in 0..<arr.count {
        visited[i] = true
        dfs(1, String(arr[i]))
        visited[i] = false
    }
    print(answer)
}
solution()
/*
 */

```
30,60,90,120,150,180 으로 진행되는데   
각각의 숫자들의 규칙은 각자리의 합이 3의 배수이며, 끝자리가 0이라는 점이다.   
따라서 위를 적용하여 풀이하면 된다.

```
import Foundation
func solution(){
    var arr = readLine()!.map{String($0)}
    arr.sort(by: >)
    
    var sum = 0
    for a in arr {
        sum += Int(a)!
    }
    if sum%3 == 0 && arr.last == "0" {
        print(arr.joined())
    } else {
        print("-1")
    }
    
}
solution()
/*
 */

```
