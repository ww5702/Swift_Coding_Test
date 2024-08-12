```
import Foundation
func solution() {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.sort(by: <)
    
    
    
    func permutation(_ targetArr: [Int], _ targetNum: Int, _ list: [Int]) {
        if (list.count == targetNum) {
            print(list.map{String($0)}.joined(separator: " "))
            return
        }
        
        for i in 0..<n {
            permutation(targetArr, targetNum, list+[arr[i]])
        }
        
    }
    
    
    permutation(arr, m, [])
}


solution()
/*
 */

```
