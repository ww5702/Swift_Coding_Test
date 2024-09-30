```
import Foundation
func solution() {
    let nmp = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,p) = (nmp[0], nmp[1], nmp[2])
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}
    if n == 0 {
        print(1)
    } else {
        var score = board + [m]
        score.sort(by: >)
        if score.lastIndex(of: m)! >= p {
            print(-1)
        } else {
            print(score.firstIndex(of: m)! + 1)
        }
    }
}

solution()
/*
 */


```
입력값이 0일수도 있다;   
따라서 0이 아닐때 입력을 받아야한다.   
안그럼 무한대기가 지속된다.   

```
import Foundation
func solution() {
    let nmp = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,p) = (nmp[0], nmp[1], nmp[2])
    
    if n == 0 {
        print(1)
    } else {
        var board = readLine()!.split(separator: " ").map{Int(String($0))!}
        var score = board + [m]
        score.sort(by: >)
        if score.lastIndex(of: m)! >= p {
            print(-1)
        } else {
            print(score.firstIndex(of: m)! + 1)
        }
    }
}

solution()
/*
 */


```
