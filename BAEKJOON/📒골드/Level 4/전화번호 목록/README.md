정렬후 한글자씩 돌면서 확인해보려했으나 10프로에서 당연히 시간초과   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var isPossible = true
        var board: [Int] = []
        for _ in 0..<n {
            board.append(Int(readLine()!)!)
        }
        board.sort(by:<)
        var dict: [Int] = []
        dict.append(board[0])
        
        for i in 1..<n {
            if !isPossible { break }
            let now = Array(String(board[i]))
            //print(now)
            
            var num = ""
            for n in now {
                num += String(n)
                //print(num)
                if dict.contains(Int(num)!) {
                    isPossible = false
                    break
                }
            }
            
            //print(num)
            if isPossible {
                dict.append(board[i])
            }
            //print(dict)
        }
        print(isPossible ? "YES" : "NO")
        
        
    }
}

solution()
/*
 */


```
hasPrefix가 있었다.   
str[i+1].hasPrefix(str[i])는   
정렬된값이니   
91125426에서 911이라는 값이 앞에서부터 한번이라도 있는가?   
를 물어보는것과 같다.   
뒤에서부터 탐색은 hasSuffix이다.   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var str = [String]()
        var isPossible = true
        
        for _ in 0..<n {
            str.append(readLine()!)
        }
        str.sort(by:<)
        for i in 0..<n-1 {
            if str[i+1].hasPrefix(str[i]) {
                isPossible = false
                break
            }
        }
        
        print(isPossible ? "YES" : "NO")
        
    }
}

solution()
/*
 
 */

```
