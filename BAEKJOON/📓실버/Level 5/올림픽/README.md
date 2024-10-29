```
import Foundation
func solution(){
    let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,k) = (nk[0],nk[1])
    var medal: [(Int,Int,Int,Int)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        medal.append((input[0],input[1],input[2],input[3]))
    }
    medal.sort(by: {$0.1 == $1.1 ? $0.2 == $1.2 ? $0.3 > $1.3 : $0.2 > $1.2 : $0.1 > $1.1 })
    //print(medal)
    for i in 0..<n {
        if medal[i].0 == k {
            var idx = i
            while true {
                guard idx > 0 else {
                    print(1)
                    break
                }
                let medalA = [medal[idx-1].1, medal[idx-1].2, medal[idx-1].3]
                let medalB = [medal[idx].1, medal[idx].2, medal[idx].3]
                if medalA == medalB {
                    idx -= 1
                } else {
                    print(idx+1)
                    break
                }
            }
            break
        }
    }
    
    
}

solution()
/*
 */


```
