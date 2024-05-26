누적합 개념으로 풀이해보았으나 시간초과   
세그먼트 트리로 풀어야 한다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k,m) = (input[0],input[1],input[2])
    /*
     1 2 3 4 5
     1 2 6 4 5
     2 ~ 5 = 17
     1 2 6 4 2 = 12
     */
    var arr: [Int] = []
    var sum = Array(repeating: 0, count: n+1)
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    var num = 0
    for i in 0..<n {
        num += arr[i]
        sum[i+1] = num
    }
    //print(sum)
    
    for _ in 0..<k+m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        // 변경
        if input[0] == 1 {
            for i in input[1]...n {
                if input[2] >= arr[input[1]-1] {
                    sum[i] += (input[2] - arr[input[1]-1])
                } else {
                    sum[i] -= (arr[input[1]-1] - input[2])
                }
            }
            arr[input[1]-1] = input[2]
        } else if input[0] == 2 {
            print(sum[input[2]] - sum[input[1]-1])
        }
//        print(arr)
//        print(sum)
    }
}
solution()

```
