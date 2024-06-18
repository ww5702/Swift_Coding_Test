구현문제같았다   
한바퀴 돌동안 거짓말을 알아차린 사람이 있다면 다시 반복문을 실행   
거짓말을 알아차린 파티가 없다면 남은 파티가 정답이다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (input[0],input[1])
    var visited = Array(repeating: false, count: n+1)
    let know = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let k = know[0]
    for i in 0..<k {
        visited[know[i+1]] = true
    }
    //print(visited)
    var arr: [[Int]] = []
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        arr.append(input)
    }
    var isChange = false
    while true {
        var temp: [[Int]] = []
        //print("기본", arr)
        for i in 0..<arr.count {
            let num = arr[i][0]
            let now = arr[i][1...]
            var isOk = true
            //print(now)
            for j in 1...num {
                if visited[now[j]] {
                    isOk = false
                    break
                }
            }
            
            if !isOk {
                for j in 1...num {
                    visited[now[j]] = true
                }
            } else {
                temp.append(arr[i])
            }
        }
        //print(visited)
        //print("통과한 파티",temp)
        if temp.count == arr.count || temp.count == 0{
            print(temp.count)
            break
        } else {
            arr = temp
        }
    }
}

solution()
/*
 */

```
