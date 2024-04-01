```
import Foundation
func solution(){
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (nm[0],nm[1])
    var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        let input = Array(readLine()!).map{Int(String($0))!}
        arr[i] = input
    }
    //print(arr)
    var result = 1
    for size in 1..<min(n,m) {
        for y in 0..<n-size {
            for x in 0..<m-size {
                let p1 = arr[y][x]
                let p2 = arr[y][x+size]
                let p3 = arr[y+size][x]
                let p4 = arr[y+size][x+size]
                
                if p1 == p2 && p2 == p3 && p3 == p4 {
                    result = (size+1)*(size+1)
                }
            }
        }
    }
    print(result != 1 ? result : 1)
}
solution()

```
