```
import Foundation
func solution() {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let arr = Set(input).sorted(by:<)
    var result = Set<[Int]>()
    //print(arr)
    
    combi(arr, m, 0, [])
    
    func combi(_ targetArr: [Int], _ targetNum: Int, _ idx: Int, _ list: [Int]) {
        //print(idx, list)
        if list.count == targetNum {
            if !result.contains(list) {
                print(list.map{String($0)}.joined(separator: " "))
                result.insert(list)
            }
            return
        }
        
        for i in idx..<targetArr.count {
            combi(targetArr, targetNum, i, list + [arr[i]])
            combi(targetArr, targetNum, i+1, list)
        }
    }
}


solution()
/*
 */

```
