```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    var arr: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    var k = Int(readLine()!)!
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let gender = input[0]
        let num = input[1]
        
        if gender == 1 {
            for i in 1...n/num {
                let idx = (num*i)-1
                if arr[idx] == 0 {
                    arr[idx] = 1
                } else {
                    arr[idx] = 0
                }
            }
        } else if gender == 2 {
            var left = num-1
            var right = num-1
            while true  {
                if arr[left] == arr[right] {
                    left -= 1
                    right += 1
                } else {
                    left += 1
                    right -= 1
                    break
                }
                
                if left < 0 || right > n-1 {
                    left += 1
                    right -= 1
                    break
                }
                
            }
            //print(left, right)
            
            for i in left...right {
                if arr[i] == 0 {
                    arr[i] = 1
                } else {
                    arr[i] = 0
                }
            }
        }
        //print(arr)
    }
    arr.insert(-1, at: 0)
    for i in 1...n {
        print(arr[i], terminator: " ")
        if i % 20 == 0 {
            print()
        }
    }
}
solution()

```
