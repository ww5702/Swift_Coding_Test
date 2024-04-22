```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    if (n == 0) {
        print(0)
    } else {
        var arr: [Int] = []
        for _ in 0..<n {
            let input = Int(readLine()!)!
            arr.append(input)
        }
        arr.sort(by: <)
        //print(arr)
        let k = Int(round(Double(n) / 100 * 15));
        let newArr = arr[k..<n-k]
        let sum = newArr.reduce(0, +)
        print(Int(round(Double(sum)/Double((n-(k*2))))))
    }
    
}
solution()

```
