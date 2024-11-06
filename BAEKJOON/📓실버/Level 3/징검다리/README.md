```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        if n <= 2 {
            print(1)
        } else {
            var value = 1
            var num = 1
            while value < n {
                num += 1
                value += num
            }
            print(num-1)
        }
    }
}

solution()
/*
1 2 3 4 5 6 7 8 9 10 11 12 13
 92
 */
  

```
등차수열 공식이 필요했다.   
12까지의 등차수열합이 n이 되는지가 키   

```
import Foundation
func solution(){
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var start = 0; var end = 1000000000
        
        while start <= end {
            let middle = (start+end) / 2
            let sum = (middle+1) * middle / 2
            if n < sum {
                end = middle-1
            } else {
                start = middle+1
            }
        }
        
        print(end)
    }
}

solution()
/*
1 2 3 4 5 6 7 8 9 10 11 12 13
 92
 */
  

```
