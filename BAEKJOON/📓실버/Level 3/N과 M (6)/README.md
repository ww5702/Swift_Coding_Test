```
import Foundation
func solution() {
    let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m) = (nm[0], nm[1])
    var list = readLine()!.split(separator: " ").map{Int(String($0))!}
    list.sort(by: <)
    
    
    func dfs(_ arr: [Int], _ idx: Int) {
        if (arr.count == m) {
            print(arr.map{String($0)}.joined(separator: " "))
            return
        }
        
        for i in idx..<n {
            dfs(arr + [list[i]], i+1)
        }
        
    }
    
    dfs([], 0)
}

solution()
/*

 */

```
