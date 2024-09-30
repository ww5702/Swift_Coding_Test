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
