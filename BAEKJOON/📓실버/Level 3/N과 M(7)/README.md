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
mapping하면 시간이 더 걸린다   
mapping을 안해도 stack을 추가해서 넣어서 함수에 삽입하는게 적게 걸린다.   

```
import Foundation
func solution() {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0],nm[1])
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.sort(by: <)
    var stack = [String]()
    
    func permutation(_ targetArr: [Int], _ targetNum: Int, _ list: [String]) {
        if (list.count == targetNum) {
            print(list.joined(separator: " "))
            return
        }
        
        for i in 0..<n {
            stack.append(String(arr[i]))
            permutation(targetArr, targetNum, stack)
            stack.removeLast()
        }
    }
    
    
    permutation(arr, m, [])
}


solution()
/*
 */

```
