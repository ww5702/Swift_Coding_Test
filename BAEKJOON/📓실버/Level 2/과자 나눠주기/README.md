```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var board = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by:<)
    
    var (left,right) = (1, board.last!)
    
    //print(left,right)
    while left <= right {
        let mid = (left+right) / 2
        var cnt = 0
        for b in board {
            cnt += b / mid
        }
        
        if cnt >= n {
            left = mid+1
        } else {
            right = mid - 1
        }
    }
    
    print(right)
}

solution()
/*
 4
 10 12 80
 10 12 40 40
 
 
 10 12 18 18
 
 
 */


```
